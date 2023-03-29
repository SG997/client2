part of 'login_page.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.watch<LoginViewModel>();

    return PrimaryTextField(
      maxLength: 10,
      keyboardType: TextInputType.phone,
      filled: !loginViewModel.isKeyboardVisible,
      onTextChanged: loginViewModel.setPhoneNumber,
      error: loginViewModel.phoneNumberError,
    );
  }
}
