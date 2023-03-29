import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/dropdown/view/dropdwon_menu.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/create-academy/view-model/create_academy_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/create-academy/view/step_four_item.dart';

part 'create_academy_number_stepper.dart';
part 'step_four.dart';
part 'step_one.dart';
part 'step_three.dart';
part 'step_three_field.dart';
part 'step_three_header.dart';
part 'step_two.dart';
part 'step_two_dropdown_menus.dart';

class CreateAcademyPage extends StatelessWidget {
  const CreateAcademyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAcademyViewModel = context.read<CreateAcademyViewModel>();
    return Scaffold(
      appBar: PrimaryAppBar(),
      body: Column(
        children: [
          const Space(height: 24),
          const CreateAcademyNumberStepper(),
          const Space(height: 32),
          Expanded(
            child: PageView(
              controller: createAcademyViewModel.createAcademyPageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                StepOne(),
                StepTwo(),
                StepThree(),
                StepFour(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
