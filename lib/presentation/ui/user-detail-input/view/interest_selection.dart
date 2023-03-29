import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/cubit/user_detail_input_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/model/user_interests_model.dart';

class InterestSelection extends StatelessWidget {
  const InterestSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetailInputCubit = context.read<UserDetailInputCubit>();
    return StreamBuilder<List<UserInterestsModel>>(
      stream: userDetailInputCubit.userInterestsStream,
      builder: (context, snapshot) {
        final userInterests = snapshot.data ?? [];
        return Column(
          children: [
            Label(
              text: "what are you interested in?",
              color: UIColor.black.withOpacity(0.5),
            ),
            const Space(height: 16),
            Wrap(
              spacing: 8,
              alignment: WrapAlignment.center,
              children: userInterests.map((e) {
                return InkWell(
                  onTap: () => userDetailInputCubit.selectUserInterests(e),
                  child: Chip(
                    label: Text(
                      e.title ?? "",
                      style: TextStyle(
                        fontSize: 12,
                        color: e.isSelected ? UIColor.white : UIColor.black.withOpacity(0.7),
                      ),
                    ),
                    backgroundColor: e.isSelected ? UIColor.unitedNationsBlue : UIColor.unitedNationsBlue.withOpacity(0.1),
                  ),
                );
              }).toList(),
            ),
            const Space(height: 16),
            NextBackButton(
              onBack: () => userDetailInputCubit.setStepperPosition(2),
              onNext: userDetailInputCubit.submitStepThree,
              nextTitle: "Done",
            ),
            const Space(height: 16),
          ],
        );
      },
    );
  }
}
