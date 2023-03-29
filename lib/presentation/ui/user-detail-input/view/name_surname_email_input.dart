import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/cubit/user_detail_input_cubit.dart';

class NameSurnameInput extends StatelessWidget {
  const NameSurnameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetailInputCubit = context.read<UserDetailInputCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          text: "First name",
          color: UIColor.black.withOpacity(0.5),
        ),
        const SizedBox(height: 4),
        StreamBuilder<String?>(
          stream: userDetailInputCubit.firstNameStream,
          builder: (context, snapshot) {
            return PrimaryTextField(
              controller: userDetailInputCubit.firstNameTextController,
              error: snapshot.error == null ? null : snapshot.error as String,
              inputAction: TextInputAction.next,
              onTap: () => userDetailInputCubit.setStepperPosition(0),
              onTextChanged: userDetailInputCubit.setFirstName,
              onSubmit: (_) => userDetailInputCubit.setStepperPosition(1),
            );
          },
        ),
        const SizedBox(height: 16),
        Label(
          text: "Last name",
          color: UIColor.black.withOpacity(0.5),
        ),
        const SizedBox(height: 4),
        StreamBuilder<String?>(
          stream: userDetailInputCubit.lastNameStream,
          builder: (context, snapshot) {
            return PrimaryTextField(
              controller: userDetailInputCubit.lastNameTextController,
              onTextChanged: userDetailInputCubit.setLastName,
              onTap: () => userDetailInputCubit.setStepperPosition(1),
              error: snapshot.error == null ? null : snapshot.error as String,
              inputAction: TextInputAction.next,
            );
          },
        ),
        const SizedBox(height: 16),
        Label(
          text: "Email",
          color: UIColor.black.withOpacity(0.5),
        ),
        const SizedBox(height: 4),
        StreamBuilder<String?>(
          stream: userDetailInputCubit.emailStream,
          builder: (context, snapshot) {
            return PrimaryTextField(
              controller: userDetailInputCubit.emailTextController,
              onTextChanged: userDetailInputCubit.setEmail,
              onTap: () => userDetailInputCubit.setStepperPosition(1),
              error: snapshot.error == null ? null : snapshot.error as String,
            );
          },
        ),
        const SizedBox(height: 16),
        NextBackButton(
          onBack: Navigation.pop,
          onNext: userDetailInputCubit.submitStepOne,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
