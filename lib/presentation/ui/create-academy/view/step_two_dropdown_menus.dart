part of 'create_academy_page.dart';

class StepTwoDropdownMenus extends StatelessWidget {
  const StepTwoDropdownMenus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAcademyViewModel = context.watch<CreateAcademyViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: DropdownMenu(
            dropdownController: createAcademyViewModel.dropdownController,
            itemsStream: createAcademyViewModel.dropdownController?.currencyStream,
            selectedItemStream: createAcademyViewModel.dropdownController?.selectedCurrencyStream,
            onChangeItem: (value) {
              createAcademyViewModel.dropdownController?.selectCurrency(value);
            },
          ),
        ),
        const Space(width: 8),
        Expanded(
          child: DropdownMenu(
            dropdownController: createAcademyViewModel.dropdownController,
            selectedItemStream: createAcademyViewModel.dropdownController?.selectedDateStream,
            itemsStream: createAcademyViewModel.dropdownController?.dateStream,
            onChangeItem: (value) {
              createAcademyViewModel.dropdownController?.selectDate(value);
            },
          ),
        ),
      ],
    );
  }
}
