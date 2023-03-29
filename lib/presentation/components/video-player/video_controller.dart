import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class VideoController {
  final File? file;
  final String? url;
  VideoPlayerController? videoPlayerController;
  final videoDurationController = BehaviorSubject<String>.seeded("-- : --");
  final thumbnailController = BehaviorSubject<ImageProvider?>();
  final isVideoUploadedController = BehaviorSubject<bool>.seeded(false);

  VideoController({
    this.file,
    this.url,
  }) {
    init();
  }

  Stream<String> get videoDurationStream => videoDurationController.stream;
  Stream<ImageProvider?>? get thumbnailProviderStream => thumbnailController.stream;
  Stream<bool> get isVideoUploadedStream => isVideoUploadedController.stream;

  init() async {
    final file = this.file;

    if (file != null) {
      videoPlayerController = VideoPlayerController.file(file);
    }

    final url = this.url;

    if (url != null) {
      videoPlayerController = VideoPlayerController.network(url);
    }

    await videoPlayerController?.initialize();
    createThumbnail();
  }

  changePlayerState() {
    isVideoUploadedController.add(true);
  }

  createThumbnail() async {
    final video = file?.path ?? url;

    if (video == null) return;

    final bytes = await VideoThumbnail.thumbnailData(
      video: video,
      imageFormat: ImageFormat.JPEG,
      quality: 100,
    );

    if (bytes == null) return;

    final imageProvider = MemoryImage(bytes);

    thumbnailController.add(imageProvider);
    videoDurationController.add(currentVideoDuration);
  }

  String get currentVideoDuration {
    final currentValue = videoPlayerController?.value;
    if (currentValue == null) return "-- : --";
    if (!currentValue.isInitialized) return videoDurationController.value;

    final duration = currentValue.duration;
    final minute = duration.inMinutes.remainder(60).toString().padLeft(2, '0');
    final second = duration.inSeconds.remainder(60).toString().padLeft(2, '0');

    return "$minute : $second";
  }
}
