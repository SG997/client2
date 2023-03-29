part of 'login_page.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();

    if (!loginViewModel.isKeyboardVisible) {
      return PrimaryButton(
        isLoading: !loginViewModel.isKeyboardVisible ? loginViewModel.isLoading : false,
        title: "Login",
        onTap: loginViewModel.login,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
