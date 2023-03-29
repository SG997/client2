part of 'otp_page.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpViewModel = context.read<OtpViewModel>();

    return Stack(
      children: [
        const GradientWrapper(),
        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                BottomSheetWrapper(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Space(height: 64),
                        Label(
                          text: "You will get a confirmation code via SMS to your number, please enter the code below in order to continue:",
                          color: UIColor.black.withOpacity(0.5),
                          size: 12,
                        ),
                        const Space(height: 32),
                        PinFields(
                          onPinChanged: otpViewModel.setPin,
                          onPinSubmitted: otpViewModel.setPin,
                        ),
                        const Space(height: 48),
                        const BackAndNextButton(),
                        const Space(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
