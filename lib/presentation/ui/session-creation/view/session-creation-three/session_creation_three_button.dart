import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';

class SessionCreationThreeButton extends StatelessWidget {
  final VideoState videoState;

  const SessionCreationThreeButton({
    Key? key,
    required this.videoState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionController = context.read<SessionController>();
    final sessionCreationCubit = context.read<SessionCreationCubit>();

    return Column(
      children: [
        const Space(height: 64),
        StreamBuilder<SessionCreationOption?>(
          stream: sessionCreationCubit.sessionCreationOptionStream,
          builder: (context, option) {
            return NextBackButton(
              width: 168,
              onNext: () {
                if (sessionController.videoController.hasValue) {
                  sessionCreationCubit.setPage(index: 3);
                } else {
                  sessionController.pickVideo();
                }
              },
              onBack: () {
                sessionCreationCubit.setPage(index: videoState == VideoState.uploaded ? 2 : 1);
              },
              nextTitle: option.data?.buttonTitle ?? "",
            );
          },
        ),
      ],
    );
  }
}
