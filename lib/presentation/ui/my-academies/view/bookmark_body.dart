import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/ui/my-academies/view/created_academies.dart';
import 'package:unimastery_mobile/presentation/ui/my-academies/view/my_academies.dart';

class BookMarkBody extends StatelessWidget {
  const BookMarkBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            onTap: (value) {},
            indicatorWeight: 3,
            indicatorColor: UIColor.black,
            labelPadding: const EdgeInsets.all(14),
            labelStyle: TextStyle(fontWeight: FontWeight.w600, color: UIColor.black.withOpacity(0.9)),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
            tabs: const [
              Label(text: "My Academies"),
              Label(text: "Academies i've created"),
            ],
            labelColor: Colors.black,
          ),
          const Space(height: 16),
          const Expanded(
            child: TabBarView(
              children: [
                MyAcademies(),
                CreatedAcademies(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
