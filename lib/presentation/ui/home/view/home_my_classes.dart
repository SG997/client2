import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/classes/in-progress-class-item/in_progress_class_item.dart';

class HomeMyClasses extends StatelessWidget {
  const HomeMyClasses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: InProgressClassItem(
              onTapBookmark: () {},
            ),
          );
        }),
      ),
    );
  }
}
