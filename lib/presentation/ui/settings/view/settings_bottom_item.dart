import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/bottom-sheet/main/bottom_sheet_presenter.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/l10n_dummy.dart';

class SettingsBottomItem extends StatelessWidget {
  const SettingsBottomItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SecondaryButton(
                title: "Terms & Conditions",
                onTap: () => BottomSheetPresenter.showCourseBottomSheet(
                  context,
                  text: L10nDummy.dummyText,
                  titleText: "Terms & Conditions",
                ),
              ),
              SecondaryButton(
                title: "Privacy Policy",
                onTap: () => BottomSheetPresenter.showCourseBottomSheet(
                  context,
                  text: L10nDummy.dummyText,
                  titleText: "Privacy Policy",
                ),
              ),
            ],
          ),
        ),
        const Space(height: 16),
      ],
    );
  }
}
