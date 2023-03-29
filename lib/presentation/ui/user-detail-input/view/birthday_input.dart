import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/cubit/user_detail_input_cubit.dart';

class BirthdayInput extends StatelessWidget {
  const BirthdayInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetailInputCubit = context.read<UserDetailInputCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Label(
          text: "Birthday",
          color: UIColor.black.withOpacity(0.5),
        ),
        const Space(height: 4),
        PrimaryTextField(
          controller: userDetailInputCubit.birthdayTextController,
          isEditable: false,
          onTextChanged: (value) {},
        ),
        const Space(height: 16),
        NextBackButton(
          onBack: () => userDetailInputCubit.setStepperPosition(1),
          onNext: userDetailInputCubit.submitStepTwo,
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: userDetailInputCubit.birthdayDate,
            onDateTimeChanged: userDetailInputCubit.setBirthday,
          ),
        )
      ],
    );
  }
}
