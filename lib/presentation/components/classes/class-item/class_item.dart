import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/classes/class-item/class_item_body.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';

class ClassItem extends StatelessWidget {
  final List<InfoModel> info;
  const ClassItem({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: UIColor.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          width: 272,
          child: ClassItemBody(
            info: info,
            onTapHeader: () => Navigation.push(RouteName.coursePage),
          ),
        ),
      ],
    );
  }
}
