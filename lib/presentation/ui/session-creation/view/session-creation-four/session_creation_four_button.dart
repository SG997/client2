import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/button/next_back_button.dart';
import 'package:unimastery_mobile/presentation/components/button/secondary_button.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';

class SessionCreationFourButtons extends StatelessWidget {
  const SessionCreationFourButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionCreationCubit = context.read<SessionCreationCubit>();

    return Column(
      children: [
        const Space(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(Assets.calendarIcon),
                const SecondaryButton(
                  title: "Schedule this session",
                ),
              ],
            ),
            // Row(
            //   children: const [
            //     Icon(
            //       Icons.share_outlined,
            //       size: 20,
            //     ),
            //     SecondaryButton(
            //       title: "Copy share link",
            //     ),
            //   ],
            // ),
          ],
        ),
        const Space(height: 16),
        NextBackButton(
          width: 168,
          onNext: () => Navigation.push(RouteName.coursePage),
          onBack: () {
            sessionCreationCubit.setPage(index: 2);
          },
          nextTitle: "Publish",
        ),
      ],
    );
  }
}
