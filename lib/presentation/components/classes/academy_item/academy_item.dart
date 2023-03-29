import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/chip/info_chips.dart';
import 'package:unimastery_mobile/presentation/components/header/academy_header.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';

class AcademyItem extends StatelessWidget {
  final List<InfoModel> info;
  final bool isSingle;
  final bool? canBeShared;
  final VoidCallback? didTapShare;
  const AcademyItem({
    Key? key,
    required this.info,
    required this.isSingle,
    this.didTapShare,
    this.canBeShared,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          width: isSingle ? null : 272,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Column(
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigation.push(RouteName.academyPage),
                  child: AcademyHeader(
                    didTapShare: didTapShare,
                    canBeShared: canBeShared,
                  ),
                ),
                const Space(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: info.map((e) {
                    return InfoChip(
                      text: e.text,
                      icon: e.icon,
                      subText: e.subtext,
                    );
                  }).toList(),
                ),
                const Space(height: 24),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
