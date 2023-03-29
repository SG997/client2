part of 'create_academy_page.dart';

class StepThreeHeader extends StatelessWidget {
  const StepThreeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAcademyViewModel = context.watch<CreateAcademyViewModel>();
    return Column(
      children: [
        const Space(height: 16),
        Label(
          text: "About the Workshop(1000 characters)",
          size: 12,
          color: UIColor.black.withOpacity(0.5),
        ),
        const Space(height: 10),
        MultilineTextField(
          autoFocus: true,
          hintText: "Type...",
          onTextChanged: createAcademyViewModel.setWorkshopDescription,
          error: createAcademyViewModel.workshopDescriptionError,
        ),
        const Space(height: 16),
      ],
    );
  }
}
