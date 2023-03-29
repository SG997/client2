import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/controller/chat_input_controller.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

enum MediaType { image, video, file }

enum ImagePickerType { camera, gallery }

class ChatViewModel extends ChangeNotifier {
  final ChatInputController inputController;
  ChatViewModel(this.inputController) {
    listenInputMessages();
  }
  final _scrollController = ScrollController();
  IMessage? _pendingReplyToMessage;
  IMessage? _pendingEditiableMessage;
  IMessage? _pendingMediaMessage;
  IMessage? _pendingMessage;
  CoursePopUpController coursePopUpController = CoursePopUpController(
    items: [
      ChatAction.reply,
      ChatAction.delete,
      ChatAction.edit,
    ],
  );

  StreamSubscription<IMessage>? _inputMessageSubscription;
  bool _isMediaActionPending = false;
  String _pendingMediaUrl = "";
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  final List<IMessage> _messages = List.generate(
    3,
    (index) => Message(
      id: UniqueKey(),
      text: "Text $index",
      messageType: MessageType.text,
      name: "John Terdolovsky",
      opponentType: index % 2 == 0 ? OpponentType.sender : OpponentType.receiver,
      avatarUrl: "https://picsum.photos/200/300",
      time: "12:00",
      replyTo: Message(
        id: UniqueKey(),
        text: "Text $index",
        opponentType: OpponentType.sender,
        avatarUrl: "https://picsum.photos/200/300",
      ),
    ),
  );

  List<IMessage> get messages => _messages;
  IMessage? get pendingReplyToMessage => _pendingReplyToMessage;
  IMessage? get pendingMediaMessage => _pendingMediaMessage;
  IMessage? get pendingMessage => _pendingMessage;
  bool get isMediaActionPending => _isMediaActionPending;
  ScrollController get scrollController => _scrollController;
  String get pendingMediaUrl => _pendingMediaUrl;
  CoursePopUpController? get popUpController => coursePopUpController;
  ItemScrollController get itemScrollController => _itemScrollController;
  ItemPositionsListener get itemPositionsListener => _itemPositionsListener;
  double scrollOffset = 0.0;

  scrollMessage(IMessage message) {
    _itemScrollController.scrollTo(
      index: _messages.length - 1 - _messages.indexOf(message),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  listenInputMessages() {
    _inputMessageSubscription = inputController.inputMessageStream.listen((message) {
      IMessage? newMessage;
      if (_pendingReplyToMessage != null) {
        newMessage = message.copyWith(replyTo: _pendingReplyToMessage);
        _pendingReplyToMessage = null;
      } else if (_pendingMediaMessage != null) {
        if (inputController.textEditingController.text.isNotEmpty) {
          _pendingMediaMessage?.text = inputController.textEditingController.text;
        }
        newMessage = _pendingMediaMessage;
      } else {
        newMessage = message;
      }
      if (newMessage != null) {
        sendMessage(newMessage);
      }
    });
  }

  sendMessage(
    IMessage message,
  ) {
    if (_pendingEditiableMessage != null) {
      final pickedMessage = _messages.indexOf(_pendingEditiableMessage!);
      _messages[pickedMessage].text = inputController.textEditingController.value.text;
    } else {
      _messages.add(message);
    }
    inputController.clearText();
    _pendingReplyToMessage = null;
    _pendingMessage = null;
    _pendingMediaMessage = null;
    _pendingMediaUrl = "";
    _pendingEditiableMessage = null;
    if (_messages.length > 1) {
      _itemScrollController.jumpTo(index: 0);
    }
    notifyListeners();
  }

  replyTo(IMessage message) {
    _pendingReplyToMessage = message;
    if (message.opponentType == OpponentType.sender) {
      _pendingMessage?.replyTo = null;
    }
    if (_pendingMessage != null) {
      _pendingMessage?.replyTo = message;
    } else {
      _pendingMessage = message;
    }
    inputController.focusNode.requestFocus();

    notifyListeners();
  }

  openMediaActionSheet() {
    _isMediaActionPending = !_isMediaActionPending;
    notifyListeners();
  }

  closeMediaActionSheet() {
    _isMediaActionPending = false;
    notifyListeners();
  }

  deleteMessage(IMessage message) {
    _messages.remove(message);
    notifyListeners();
    inputController.focusNode.unfocus();
  }

  editMessage(IMessage message) {
    _pendingEditiableMessage = message;
    inputController.textEditingController.text = message.text ?? "";
    inputController.focusNode.requestFocus();
  }

  focus() {
    FocusScope.of(Navigation.context).requestFocus();
  }

  unFocus() {
    FocusScope.of(Navigation.context).unfocus();
  }

  cancel() {
    _pendingReplyToMessage = null;
    _pendingMessage = null;
    _pendingMediaMessage = null;
    _pendingMediaUrl = "";
    _pendingEditiableMessage = null;
    inputController.clearText();
    notifyListeners();
  }

  pickMedia({ImagePickerType? pickType, MediaType? mediaType}) async {
    MessageType? messageType;
    final ImagePicker picker = ImagePicker();
    XFile? media;
    FilePickerResult? file;
    String? thumbnailUrl;
    if (mediaType == MediaType.image) {
      if (pickType == ImagePickerType.gallery) {
        media = await picker.pickImage(source: ImageSource.gallery);
      } else if (pickType == ImagePickerType.camera) {
        media = await picker.pickImage(source: ImageSource.camera);
      }
      if (media == null) {
        return;
      }
      messageType = MessageType.image;
      _pendingMediaUrl = media.path;
    } else if (mediaType == MediaType.video) {
      media = await picker.pickVideo(source: ImageSource.gallery);
      if (media == null) {
        return;
      }
      _pendingMediaUrl = media.path;
      thumbnailUrl = await createThumbnail(File(media.path));
      messageType = MessageType.video;
    } else if (mediaType == MediaType.file) {
      file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['docx', 'pdf', 'doc', 'xlsx', 'xls', 'ppt', 'pptx'],
      );
      if (file != null) {
        messageType = MessageType.file;
        File pickedFile = File(file.files.single.path!);
        _pendingMediaUrl = pickedFile.path;
      } else {
        return;
      }
    }

    _pendingMediaMessage = Message(
      id: UniqueKey(),
      mediaUrl: _pendingMediaUrl,
      messageType: messageType ?? MessageType.text,
      opponentType: OpponentType.sender,
      name: "John Terdolovsky",
      avatarUrl: "https://picsum.photos/200/300",
      time: "12:00",
      replyTo: _pendingMessage,
      thumbnailUrl: thumbnailUrl,
    );

    _pendingMessage = _pendingMediaMessage;

    inputController.addMedia(
      _pendingMediaUrl,
      messageType ?? MessageType.text,
      thumbnailUrl: thumbnailUrl,
    );
    _isMediaActionPending = false;
    notifyListeners();
  }

  createThumbnail(File file) async {
    final path = await VideoThumbnail.thumbnailFile(
      video: file.path,
      imageFormat: ImageFormat.JPEG,
      quality: 100,
    );

    if (path == null) return;

    return (path);
  }

  pickFile() {}
  @override
  void dispose() {
    inputController.close();
    _inputMessageSubscription?.cancel();
    super.dispose();
  }
}
