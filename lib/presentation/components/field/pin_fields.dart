import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class PinFields extends StatelessWidget {
  final Function(String?)? onPinChanged;
  final Function(String?)? onPinSubmitted;

  const PinFields({
    Key? key,
    this.onPinChanged,
    this.onPinSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PinFieldAutoFill(
      codeLength: 6,
      autoFocus: true,
      onCodeChanged: onPinChanged,
      onCodeSubmitted: onPinSubmitted,
      keyboardType: TextInputType.number,
      decoration: UnderlineDecoration(
        colorBuilder: FixedColorBuilder(
          UIColor.black.withOpacity(0.24),
        ),
      ),
    );
  }
}
