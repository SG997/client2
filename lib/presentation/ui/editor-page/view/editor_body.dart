import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/model/personal_information_model.dart';

class EditorBody extends StatelessWidget {
  final PersonalInformationModel personalInformation;
  const EditorBody({Key? key, required this.personalInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Label(
          text: personalInformation.headText,
          size: 12,
          color: UIColor.black.withOpacity(0.5),
        ),
        TextFormField(
          textAlign: TextAlign.center,
          initialValue: personalInformation.titleText,
          autofocus: true,
          onFieldSubmitted: (value) {
            personalInformation.titleText = value;
            Navigation.pop(result: personalInformation);
          },
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Enter your text",
            hintStyle: TextStyle(fontSize: 14),
          ),
        ),
        const Spacer(flex: 3),
      ],
    );
  }
}
