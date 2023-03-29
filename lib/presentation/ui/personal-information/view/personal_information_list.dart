import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/model/personal_information_model.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view-model/personal_information_view_model.dart';

class PersonalInformationList extends StatelessWidget {
  const PersonalInformationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final personalInformationViewModel = context.watch<PersonalInformationViewModel>();
    final itemList = personalInformationViewModel.personalInformation ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: itemList.map(
        (e) {
          return ListTile(
            onTap: () async {
              final PersonalInformationModel? result = await Navigation.push(
                RouteName.useEditor,
                arguments: e,
              );
              if (result != null) {
                personalInformationViewModel.updatePersonalInformation();
              }
            },
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            minVerticalPadding: 8,
            title: Label(text: e.headText, size: 12, color: UIColor.black.withOpacity(0.5)),
            subtitle: Label(text: e.titleText, size: 18, weight: FontWeight.w700, color: UIColor.black),
          );
        },
      ).toList(),
    );
  }
}
