import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/editor-page/view/editor_body.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/model/personal_information_model.dart';

class EditorPage extends StatelessWidget {
  final PersonalInformationModel personalInformation;
  const EditorPage({Key? key, required this.personalInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: EditorBody(personalInformation: personalInformation),
    );
  }
}
