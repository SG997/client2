part of 'create_academy_page.dart';

class StepThree extends StatelessWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAcademyViewModel = context.watch<CreateAcademyViewModel>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const Label(
              text: "Great choise please fill the blanks",
              size: 18,
              weight: FontWeight.w700,
            ),
            const StepThreeHeader(),
            Row(
              children: const [
                StepThreeField(
                  title: "How many sessions?",
                  keyboardType: TextInputType.number,
                ),
                Space(width: 16),
                StepThreeField(
                  title: "How many hours?",
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
            const Space(height: 36),
            NextBackButton(
              onNext: () {
                FocusScope.of(context).unfocus();
                createAcademyViewModel.setPage(3);
              },
              onBack: () => createAcademyViewModel.setPage(1),
            ),
          ],
        ),
      ),
    );
  }
}
