import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final VoidCallback? onTap;
  final bool isLoading;

  const PrimaryButton({
    Key? key,
    required this.title,
    this.onTap,
    this.icon,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: SizedBox(
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
            : ElevatedButton(
                onPressed: onTap == null
                    ? null
                    : () {
                        onTap?.call();
                        HapticFeedback.lightImpact();
                      },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  shadowColor: UIColor.clear,
                  textStyle: const TextStyle(fontSize: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    color: onTap == null ? UIColor.white.withOpacity(0.5) : null,
                    gradient: const LinearGradient(
                      colors: UIColor.primaryGradient,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (icon != null)
                          IconButton(
                            onPressed: onTap,
                            icon: icon ?? const SizedBox.shrink(),
                          )
                        else
                          Label(
                            text: title,
                            color: UIColor.white,
                            weight: FontWeight.bold,
                            size: 16,
                          )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
