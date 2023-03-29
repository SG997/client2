import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/session-creation-four/session_creation_four.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/session-creation-one/session_creation_one.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/session-creation-three/session_creation_three.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/session-creation-two/session_creation_two.dart';

class SessionCreationBody extends StatelessWidget {
  const SessionCreationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionCreationCubit = context.read<SessionCreationCubit>();

    return PageView(
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      controller: sessionCreationCubit.sessionCreationPageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        SessionCreationOne(),
        SessionCreationTwo(),
        SessionCreationThree(),
        SessionCreationFour(),
      ],
    );
  }
}
