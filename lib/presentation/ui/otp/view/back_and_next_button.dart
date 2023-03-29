part of 'otp_page.dart';

class BackAndNextButton extends StatelessWidget {
  const BackAndNextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpViewModel = context.watch<OtpViewModel>();

    return NextBackButton(
      onBack: () => Navigation.pop(),
      isLoading: otpViewModel.isLoading,
      onNext: otpViewModel.isNextButtonActive == true ? () => otpViewModel.confirm() : null,
    );
  }
}
