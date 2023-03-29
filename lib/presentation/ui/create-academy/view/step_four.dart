part of 'create_academy_page.dart';

class StepFour extends StatelessWidget {
  const StepFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final createAcademyViewModel = context.watch<CreateAcademyViewModel>();

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Label(
              text: "Just upload your cover image and you are ready to start your journey",
              weight: FontWeight.w700,
              size: 18,
              align: TextAlign.center,
            ),
          ),
          const Space(height: 40),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AcademyCourseHeader(
              isEditable: false,
              avatarImage: const NetworkImage("https://rb.gy/j0scnj"),
              coverImage: createAcademyViewModel.imageProvider,
              title: "Trading Academy",
              subtitle: "Forex for beginners",
              typeTitle: "workshop",
              onTapHeader: createAcademyViewModel.pickImage,
              onTapImagePicker: () {},
            ),
          ),
          StepFourItem(
            onTap: () => createAcademyViewModel.selectedRegistrationDate(context),
            title: "Schedule Registration",
            leading: Assets.calendar,
            trailing: createAcademyViewModel.registrationDate ?? "None",
          ),
          StepFourItem(
            onTap: () => createAcademyViewModel.selectedExpirationDate(context),
            title: "Add Expiration Date",
            leading: Assets.calendar,
            trailing: createAcademyViewModel.expirationDate ?? "None",
          ),
          const Space(height: 48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                SecondaryButton(
                  title: "Skip",
                  onTap: () {},
                ),
                const Space(width: 16),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: PrimaryButton(
                      title: "Create New Workshop",
                      onTap: () => Navigation.push(RouteName.coursePage, arguments: CoursePageSituations.empty),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
