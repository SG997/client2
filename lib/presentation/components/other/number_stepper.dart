import 'package:flutter/cupertino.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class NumberStepper extends StatelessWidget {
  final int numberOfTotalSteps;
  final int currentStep;

  const NumberStepper({
    Key? key,
    required this.numberOfTotalSteps,
    this.currentStep = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(numberOfTotalSteps * 2 - 1, (i) => i).map((e) {
        if (e.isOdd) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: CustomPaint(
                painter: DashedLinePainter(),
              ),
            ),
          );
        }

        return Container(
          height: 28,
          width: 28,
          decoration: BoxDecoration(
            color: color(currentStep, e),
            borderRadius: const BorderRadius.all(Radius.circular(14)),
            border: border(currentStep, e),
          ),
          child: child(currentStep, e),
        );
      }).toList(),
    );
  }

  Color color(int c, int e) {
    if (e < c * 2) {
      return UIColor.celadon;
    } else if (c * 2 == e) {
      return UIColor.unitedNationsBlue;
    } else {
      return UIColor.clear;
    }
  }

  Border? border(int c, int e) {
    return (e < c * 2 || c * 2 == e) ? null : Border.all(color: UIColor.lightSilver);
  }

  Widget? child(int c, int e) {
    final currentStepInE = e ~/ 2;

    if (e < c * 2) {
      return const Icon(
        CupertinoIcons.checkmark_alt,
        size: 20,
        color: UIColor.white,
      );
    }

    return Center(
      child: Text(
        "${currentStepInE + 1}",
        style: TextStyle(
          fontSize: 12,
          color: c * 2 == e ? UIColor.white : UIColor.black.withOpacity(0.5),
        ),
      ),
    );
  }
}
