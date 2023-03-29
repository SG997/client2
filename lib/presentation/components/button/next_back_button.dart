import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class NextBackButton extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final double? width;
  final String? nextTitle;
  final bool? isBackEnabled;
  final bool isLoading;

  const NextBackButton({
    Key? key,
    this.onBack,
    this.onNext,
    this.nextTitle,
    this.isBackEnabled = true,
    this.width,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: isLoading
          ? const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(UIColor.jeansBlue),
                ),
              ),
            )
          : Row(
              mainAxisAlignment: isBackEnabled == true ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
              children: [
                if (isBackEnabled == true)
                  TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      overlayColor: MaterialStateColor.resolveWith(
                        (states) => UIColor.lightSilver.withOpacity(0.3),
                      ),
                    ),
                    onPressed: onBack,
                    child: Label(
                      text: "Back",
                      color: UIColor.black.withOpacity(0.5),
                    ),
                  ),
                SizedBox(
                  width: width ?? 100,
                  child: PrimaryButton(
                    onTap: onNext,
                    title: nextTitle ?? "Next",
                  ),
                )
              ],
            ),
    );
  }
}
