import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';

enum ChatInputState { filled, empty }

class ChatInputController {
  final _inputMessageController = BehaviorSubject<IMessage>();
  final _textEditingController = TextEditingController();
  final _chatInputStateController = BehaviorSubject<ChatInputState>.seeded(ChatInputState.empty);
  final FocusNode _focusNode = FocusNode();
  String? _mediaUrl;
  MessageType? _messageType;
  String? _thumbnailUrl;

  Stream<IMessage> get inputMessageStream => _inputMessageController.stream;
  TextEditingController get textEditingController => _textEditingController;
  Stream<ChatInputState> get chatInputStateStream => _chatInputStateController.stream;
  FocusNode get focusNode => _focusNode;

  onChange(String value) {
    _chatInputStateController.add(ChatInputState.filled);
    if (value.isEmpty) {
      _chatInputStateController.add(ChatInputState.empty);
    }
  }

  addMedia(String mediaUrl, MessageType messageType, {String? thumbnailUrl}) {
    _mediaUrl = mediaUrl;
    _messageType = messageType;
    _thumbnailUrl = thumbnailUrl;
    _chatInputStateController.add(ChatInputState.filled);
  }

  clearText() {
    _chatInputStateController.add(ChatInputState.empty);
    _textEditingController.clear();
  }

  sendMessage() {
    final text = _textEditingController.value.text;

    if (text.isNotEmpty || _mediaUrl != null) {
      _inputMessageController.add(
        Message(
          id: UniqueKey(),
          text: text,
          opponentType: OpponentType.sender,
          avatarUrl: "https://picsum.photos/200/300",
          name: "You",
          time: "12:00",
          mediaUrl: _mediaUrl,
          messageType: _messageType ?? MessageType.text,
          thumbnailUrl: _thumbnailUrl,
          messageKey: GlobalKey(),
        ),
      );
    }
    _mediaUrl = null;
  }

  close() {
    _inputMessageController.close();
    _textEditingController.dispose();
    _inputMessageController.close();
  }
}
