part of 'login_page.dart';

class DynamicSpace extends StatelessWidget {
  const DynamicSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();

    if (!loginViewModel.isKeyboardVisible) {
      return const Space(height: 64);
    } else {
      return const SizedBox.shrink();
    }
  }
}
