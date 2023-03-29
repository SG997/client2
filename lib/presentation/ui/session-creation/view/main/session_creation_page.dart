import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/main/session_creation_body.dart';

class SessionCreationPage extends StatelessWidget {
  const SessionCreationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionCreationCubit = context.read<SessionCreationCubit>();
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: Column(
        children: [
          const Space(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: StreamBuilder<int>(
              stream: sessionCreationCubit.currentStepStream,
              builder: (context, snapshot) {
                return NumberStepper(
                  numberOfTotalSteps: 4,
                  currentStep: snapshot.data ?? 0,
                );
              },
            ),
          ),
          const Space(height: 32),
          Expanded(
            child: RepositoryProvider(
              create: (context) => locator.get<SessionController>(),
              child: const SessionCreationBody(),
            ),
          ),
        ],
      ),
    );
  }
}
