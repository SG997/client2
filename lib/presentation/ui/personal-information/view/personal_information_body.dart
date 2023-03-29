import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view/personal_information_bottom_item.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view/personal_information_list.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view/personal_information_top_item.dart';

class PersonalInformationBody extends StatelessWidget {
  const PersonalInformationBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          PersonalInformationTopItem(),
          PersonalInformationList(),
          PersonalInformationBottomItem(),
        ],
      ),
    );
  }
}
