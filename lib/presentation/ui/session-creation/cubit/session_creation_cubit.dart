import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/model/icon_title.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

enum SessionCreationOption {
  link("Paste your link", "Your video link", "Upload session"),
  file("File details", "Choose the file to upload it", "Upload file"),
  video("Video Session details", "Choose the video to upload it", "Upload video"),
  liveStream("Live Stream details", "Choose the video to upload it", "Upload video"),
  image("Image details", "Choose the image to upload it", "Upload image"),
  podcast("Podcast details", "Choose the podcast to upload it", "Upload session"),
  text("Session details", "Choose the text to upload it", "Upload session"),
  event("Event details", "Choose the event to upload it", "Upload event");

  final String title;
  final String description;
  final String buttonTitle;

  const SessionCreationOption(this.title, this.description, this.buttonTitle);
}

abstract class SessionCreationCubit extends Cubit<GenericState> {
  SessionCreationCubit() : super(Initial()) {
    checkClipBoard();
  }

  PageController? sessionCreationPageController;
  Stream<int>? currentStepStream;
  Stream<VideoPlayerController?>? videoControllerStream;
  Stream<String>? videoDurationStream;
  Stream<ImageProvider?>? thumbnailProviderStream;
  Stream<SessionCreationOption?>? sessionCreationOptionStream;
  Stream<String> clipBoardTextStream = BehaviorSubject<String>();
  List<IconTitleModel>? sessionTypes;
  TextEditingController? textEditingController;

  void setPage({required int index, SessionCreationOption? option});
  void pickVideo();
  void playVideo();
  void checkClipBoard();
  void paste() {}
  void clearText() {}
}

class SessionCreationImpl extends SessionCreationCubit {
  final currentStepController = BehaviorSubject<int>.seeded(0);
  final videoPlayerController = BehaviorSubject<VideoPlayerController?>();
  final videoDurationController = BehaviorSubject<String>.seeded("-- : --");
  final thumbnailController = BehaviorSubject<ImageProvider?>();
  final sessionCreationOptionController = BehaviorSubject<SessionCreationOption?>();
  final clipBoardTextController = BehaviorSubject<String>();
  final textController = TextEditingController();

  final PageController? pSessionCreationPageController;
  final ImagePicker? imagePicker;

  final List<IconTitleModel> _sessionTypes = [
    IconTitleModel(title: "Upload from Link", icon: Assets.linkIcon, option: SessionCreationOption.link),
    IconTitleModel(title: "File Upload", icon: Assets.fileIcon, option: SessionCreationOption.file),
    IconTitleModel(title: "Video", icon: Assets.videoIcon, option: SessionCreationOption.video),
    IconTitleModel(title: "Live Stream", icon: Assets.liveIcon, option: SessionCreationOption.liveStream),
    IconTitleModel(title: "Image", icon: Assets.imageIcon, option: SessionCreationOption.image),
    IconTitleModel(title: "Podcast", icon: Assets.podcastIcon, option: SessionCreationOption.podcast),
    IconTitleModel(title: "Text", icon: Assets.textIcon, option: SessionCreationOption.text),
    IconTitleModel(title: "Event", icon: Assets.eventIcon, option: SessionCreationOption.event),
  ];

  SessionCreationImpl({
    this.pSessionCreationPageController,
    this.imagePicker,
  });

  @override
  PageController? get sessionCreationPageController => pSessionCreationPageController;

  @override
  Stream<int>? get currentStepStream => currentStepController.stream;

  @override
  Stream<VideoPlayerController?> get videoControllerStream => videoPlayerController.stream;

  @override
  Stream<String> get videoDurationStream => videoDurationController.stream;

  @override
  Stream<ImageProvider?>? get thumbnailProviderStream => thumbnailController.stream;

  @override
  List<IconTitleModel> get sessionTypes => _sessionTypes;

  @override
  Stream<SessionCreationOption?> get sessionCreationOptionStream => sessionCreationOptionController.stream;

  @override
  Stream<String> get clipBoardTextStream => clipBoardTextController.stream;

  @override
  TextEditingController? get textEditingController => textController;

  @override
  void setPage({required int index, SessionCreationOption? option}) {
    currentStepController.add(index);
    if (option != null) {
      sessionCreationOptionController.add(option);
    }
    pSessionCreationPageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  checkClipBoard() async {
    ClipboardData? cdata = await Clipboard.getData(Clipboard.kTextPlain);
    final text = cdata?.text ?? "";
    if (text.isNotEmpty) {
      if (kDebugMode) {
        print("Clipboard data: ${cdata?.text}");
      }
      clipBoardTextController.add(text);
    }
  }

  @override
  paste() {
    textController.text = clipBoardTextController.value;
  }

  @override
  clearText() {
    textController.clear();
  }

  @override
  pickVideo() async {
    final pickedVideo = await imagePicker?.pickVideo(source: ImageSource.gallery);
    if (pickedVideo == null) return;

    final file = File(pickedVideo.path);
    final videoController = VideoPlayerController.file(file);
    await videoController.initialize();

    videoPlayerController.add(videoController);
    videoDurationController.add(currentVideoDuration);

    await createThumbnail(file);
  }

  createThumbnail(File file) async {
    final bytes = await VideoThumbnail.thumbnailData(
      video: file.path,
      imageFormat: ImageFormat.JPEG,
      quality: 100,
    );

    if (bytes == null) return;

    final imageProvider = MemoryImage(bytes);

    thumbnailController.add(imageProvider);
  }

  String get currentVideoDuration {
    final currentValue = videoPlayerController.value?.value;

    if (currentValue == null || !currentValue.isInitialized) return videoDurationController.value;

    final duration = currentValue.duration;
    final minute = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final second = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return "$minute : $second";
  }

  @override
  void playVideo() {}

  @override
  Future<void> close() {
    currentStepController.close();
    videoPlayerController.close();
    videoDurationController.close();
    thumbnailController.close();
    sessionCreationOptionController.close();
    clipBoardTextController.close();
    return super.close();
  }
}
