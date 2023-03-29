import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/classes/in-progress-academy-item/in_progress_academy_item.dart';

class HomeMyAcademies extends StatelessWidget {
  const HomeMyAcademies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: InProgressAcademyItem(),
          );
        }),
      ),
    );
  }
}
