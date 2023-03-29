import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/app-bar/primary_app_bar.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view/personal_information_body.dart';

class PersonalInformationPage extends StatelessWidget {
  const PersonalInformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: const PersonalInformationBody(),
    );
  }
}
