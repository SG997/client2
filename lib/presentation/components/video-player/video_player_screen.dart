import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  const VideoPlayerPage({Key? key, required this.videoPlayerController}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  @override
  void dispose() {
    widget.videoPlayerController.pause();
    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: UIColor.white,
          ),
          onPressed: () => Navigation.pop(),
        ),
        backgroundColor: UIColor.black,
        elevation: 0,
      ),
      backgroundColor: UIColor.black,
      body: SafeArea(
        child: Chewie(
          controller: ChewieController(
            placeholder: const LoadingIndicator(),
            videoPlayerController: widget.videoPlayerController,
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
