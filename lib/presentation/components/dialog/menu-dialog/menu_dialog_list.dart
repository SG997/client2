import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';

class MenuDialogList extends StatelessWidget {
  final List<TitleIcon> items;
  final Function(TitleIcon) onTap;
  const MenuDialogList({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map(
        (e) {
          return InkWell(
            onTap: () {
              onTap(e);
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  SvgPicture.asset(e.icon),
                  const Space(width: 8),
                  Label(
                    text: e.title,
                    size: 12,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
