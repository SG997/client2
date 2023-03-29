import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class SessionCardTopBackground extends StatelessWidget {
  final VideoState videoState;
  final bool? hideTopRadius;
  const SessionCardTopBackground({
    Key? key,
    required this.videoState,
    this.hideTopRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionController = context.read<SessionController>();
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: hideTopRadius ?? false ? null : BorderRadius.circular(12),
          color: UIColor.spanishGray.withOpacity(0.1),
        ),
        child: StreamBuilder<VideoController?>(
          stream: sessionController.videoControllerStream,
          builder: (context, snapshot) {
            return VideoPlayerCard(
              title: "Session 4",
              videoState: videoState,
              videoController: snapshot.data,
              onPlay: () {
                Navigation.push(RouteName.videoPlayerScreen, arguments: snapshot.data?.videoPlayerController);
              },
              onTap: () {
                sessionController.pickVideo();
              },
            );
          },
        ),
      ),
    );
  }
}
