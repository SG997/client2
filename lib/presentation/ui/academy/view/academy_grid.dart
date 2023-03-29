import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/button/option_selector_button.dart';

class AcademyCategoriesGrid extends StatelessWidget {
  const AcademyCategoriesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(childCount: 6, (_, index) {
          return Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: OptionSelectorButton(
              onTap: () {},
              title: "Category $index",
            ),
          );
        }),
      ),
    );
  }
}
