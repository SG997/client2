import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class HomeEvents extends StatelessWidget {
  const HomeEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: UIColor.white,
            borderRadius: BorderRadius.circular(
              12,
            ),
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: UIColor.pastelRed,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      12,
                    ),
                    topRight: Radius.circular(
                      12,
                    ),
                  ),
                ),
                width: 48,
                child: const Label(
                  text: "JUL",
                  color: UIColor.white,
                  size: 8,
                  weight: FontWeight.w700,
                  align: TextAlign.center,
                ),
              ),
              const Label(
                text: "28",
                size: 28,
                weight: FontWeight.w300,
                align: TextAlign.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}
