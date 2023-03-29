part of 'login_page.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children: const [
                MottoText(),
                Space(height: 64),
                BottomHolder(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
