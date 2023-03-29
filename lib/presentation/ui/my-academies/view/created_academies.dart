import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/classes/in-progress-academy-item/in_progress_academy_item.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class CreatedAcademies extends StatelessWidget {
  const CreatedAcademies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Label(
                text: "Academies i've created",
                size: 22,
                weight: FontWeight.w700,
              ),
              Row(
                children: [
                  Label(text: "News first", size: 12, color: UIColor.black.withOpacity(0.5)),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ],
          ),
        ),
        const Space(height: 16),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (_, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 24,
                ),
                child: InProgressAcademyItem(),
              );
            },
          ),
        ),
      ],
    );
  }
}
