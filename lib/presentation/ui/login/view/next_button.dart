part of 'login_page.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();

    if (loginViewModel.isKeyboardVisible) {
      return NextBackButton(
        onBack: () => FocusManager.instance.primaryFocus?.unfocus(),
        onNext: loginViewModel.login,
        isLoading: loginViewModel.isKeyboardVisible ? loginViewModel.isLoading : false,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
