part of 'login_page.dart';

class MottoText extends StatelessWidget {
  const MottoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();

    if (!loginViewModel.isKeyboardVisible) {
      return SafeArea(
        child: Label(
          text: "Meet Your\nSuper\nLearners",
          size: 42 * Config.multiplier,
          weight: FontWeight.bold,
          color: UIColor.white,
          align: TextAlign.center,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
