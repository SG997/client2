import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/cubit/user_detail_input_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/view/birthday_input.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/view/interest_selection.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/view/name_surname_email_input.dart';

class UserDetailInputBody extends StatelessWidget {
  const UserDetailInputBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetailInputCubit = context.read<UserDetailInputCubit>();

    return KeyboardVisibilityBuilder(
      builder: (context, isVisible) {
        userDetailInputCubit.setKeyboardVisibility(isVisible);

        return Stack(
          children: [
            const GradientWrapper(),
            SafeArea(
              bottom: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease,
                        child: BottomSheetWrapper(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Space(height: 32),
                                StreamBuilder<int>(
                                  stream: userDetailInputCubit.stepperPositionStream,
                                  builder: (context, snapshot) {
                                    return NumberStepper(
                                      numberOfTotalSteps: 4,
                                      currentStep: snapshot.data ?? 0,
                                    );
                                  },
                                ),
                                const Space(height: 32),
                                AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 200),
                                  child: StreamBuilder<int>(
                                    stream: userDetailInputCubit.stepperPositionStream,
                                    builder: (context, snapshot) {
                                      final step = snapshot.data ?? 0;

                                      if (step == 0 || step == 1) {
                                        return const NameSurnameInput();
                                      } else if (step == 2) {
                                        return const BirthdayInput();
                                      } else if (step == 3) {
                                        return const InterestSelection();
                                      }

                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                                const Space(height: 32),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
