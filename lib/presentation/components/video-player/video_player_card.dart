import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class VideoPlayerCard extends StatelessWidget {
  final String? title;
  final VideoController? videoController;
  final VideoState videoState;
  final VoidCallback onTap;
  final VoidCallback? onPlay;
  const VideoPlayerCard({
    Key? key,
    this.title,
    this.videoController,
    this.onPlay,
    required this.onTap,
    required this.videoState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder<ImageProvider?>(
          stream: videoController?.thumbnailProviderStream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            final imageProvider = snapshot.data;

            if (imageProvider == null) return const SizedBox.shrink();

            return Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: snapshot.data,
                ),
              ),
            );
          },
        ),
        StreamBuilder<bool>(
          stream: videoController?.isVideoUploadedStream,
          builder: (context, snapshot) {
            if (videoState == VideoState.initial || videoState == VideoState.canPickAnother) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Space(height: 16),
                  GestureDetector(
                    onTap: onTap,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: UIColor.white,
                        radius: 36,
                        child: SvgPicture.asset(Assets.imageAdd),
                      ),
                    ),
                  ),
                  if (videoController == null)
                    Column(
                      children: [
                        const Space(height: 16),
                        Center(
                          child: Label(
                            text: "250MB limitation",
                            size: 12,
                            color: UIColor.black.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                ],
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: InkWell(
                    onTap: onPlay,
                    child: CircleAvatar(
                      backgroundColor: UIColor.black,
                      radius: 36,
                      child: SvgPicture.asset(Assets.play),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        Positioned(
          top: 11,
          left: 8,
          child: LabelChip(title: title ?? ""),
        ),
        StreamBuilder<String>(
          stream: videoController?.videoDurationStream,
          builder: (context, snapshot) {
            final duration = snapshot.data;
            if (duration == null) return const SizedBox.shrink();

            return Positioned(
              bottom: 9,
              right: 8,
              child: LabelChip(
                title: duration,
              ),
            );
          },
        ),
      ],
    );
  }
}
