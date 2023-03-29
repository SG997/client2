import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/model/student_model.dart';

class StudentDialog extends StatelessWidget {
  final List<Student> stundets;
  const StudentDialog({
    Key? key,
    required this.stundets,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Space(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Label(
                    text: 'Students (${stundets.length})',
                    size: 18,
                    weight: FontWeight.w700,
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: UIColor.brightGray,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        Navigation.pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        color: UIColor.black,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ListView.builder(
                  itemCount: stundets.length,
                  itemBuilder: (context, index) {
                    final student = stundets[index];
                    return CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(student.avatar),
                        ),
                        title: Label(
                          text: '${student.name} ${student.surname}',
                          size: 12,
                          weight: FontWeight.w400,
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
