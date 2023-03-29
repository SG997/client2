import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/chip/info_chips.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';

class ClassItemList extends StatelessWidget {
  final List<InfoModel> info;

  const ClassItemList({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: info.map(
        (e) {
          {
            return InfoChip(
              text: e.text,
              icon: e.icon,
              subText: e.subtext,
              onTap: () {},
            );
          }
        },
      ).toList(),
    );
  }
}
