part of 'create_academy_page.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({Key? key}) : super(key: key);

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
              text: "Great choice please fill the blanks",
              weight: FontWeight.bold,
              size: 18,
              align: TextAlign.center,
            ),
            const Space(height: 32),
            Label(
              text: "Workshop Name (100 characters)",
              size: 12,
              color: UIColor.black.withOpacity(0.5),
            ),
            const Space(height: 16),
            PrimaryTextField(
              onTextChanged: createAcademyViewModel.setWorkshopName,
              error: createAcademyViewModel.workshopNameError,
            ),
            const Space(height: 32),
            Label(
              text: "Workshop price",
              size: 12,
              color: UIColor.black.withOpacity(0.5),
            ),
            const Space(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: PrimaryTextField(
                    keyboardType: TextInputType.phone,
                    hintText: "Discounted price",
                    onTextChanged: createAcademyViewModel.setPrice,
                  ),
                ),
                const Space(width: 8),
                Flexible(
                  child: PrimaryTextField(
                    keyboardType: TextInputType.phone,
                    hintText: "Orginal price",
                    onTextChanged: createAcademyViewModel.setPrice,
                  ),
                ),
              ],
            ),
            const Space(height: 8),
            const StepTwoDropdownMenus(),
            const Space(height: 8),
            if (createAcademyViewModel.priceError != null)
              SizedBox(
                width: double.infinity,
                child: LabelChip(
                  title: createAcademyViewModel.priceError ?? "",
                  color: UIColor.pastelRed,
                  textSize: 12,
                  backgroundColor: UIColor.cottageCoreSunset.withOpacity(0.5),
                ),
              ),
            const Space(height: 48),
            NextBackButton(
              onBack: () => createAcademyViewModel.setPage(0),
              onNext: () => createAcademyViewModel.setPage(2),
            )
          ],
        ),
      ),
    );
  }
}
