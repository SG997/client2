part of 'create_academy_page.dart';

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAcademyViewModel = context.watch<CreateAcademyViewModel>();
    final list = createAcademyViewModel.list ?? [];
    return Column(
      children: [
        const Space(height: 32),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Label(
            text: "What do you want to create?",
            weight: FontWeight.bold,
            size: 18,
          ),
        ),
        const Space(height: 24),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (_, index) {
              final item = list[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 90,
                  child: OptionSelectorButton(
                    title: item.text,
                    onTap: () => createAcademyViewModel.setPage(1),
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => const Space(height: 16),
            itemCount: list.length,
          ),
        )
      ],
    );
  }
}
