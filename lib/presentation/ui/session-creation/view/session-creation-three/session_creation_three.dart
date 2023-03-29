import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/session-creation-three/session_creation_three_button.dart';

class SessionCreationThree extends StatelessWidget {
  const SessionCreationThree({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionCreationCubit = context.read<SessionCreationCubit>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: StreamBuilder<SessionCreationOption?>(
          stream: sessionCreationCubit.sessionCreationOptionStream,
          builder: (context, snapshot) {
            return Column(
              children: [
                Label(
                  text: snapshot.data?.description ?? "",
                  weight: FontWeight.bold,
                  size: 18,
                ),
                const Space(height: 24),
                const SessionCard(
                  videoState: VideoState.initial,
                ),
                const SessionCreationThreeButton(
                  videoState: VideoState.initial,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
