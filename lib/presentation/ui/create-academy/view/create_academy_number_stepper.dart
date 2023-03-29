part of 'create_academy_page.dart';

class CreateAcademyNumberStepper extends StatelessWidget {
  const CreateAcademyNumberStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAcademyViewModel = context.watch<CreateAcademyViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: NumberStepper(
        numberOfTotalSteps: 4,
        currentStep: createAcademyViewModel.currentStep ?? 0,
      ),
    );
  }
}
