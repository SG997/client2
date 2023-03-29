part of 'login_page.dart';

class BottomHolder extends StatelessWidget {
  const BottomHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Space(height: 64),
            Label(
              text: "Phone number",
              size: 12,
              color: UIColor.black.withOpacity(0.5),
            ),
            const Space(height: 8),
            const PhoneNumberTextField(),
            const Space(height: 32),
            const LoginButton(),
            const DynamicSpace(),
            const NextButton(),
            const Space(height: 16),
          ],
        ),
      ),
    );
  }
}
