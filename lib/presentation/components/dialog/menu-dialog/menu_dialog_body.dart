import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/dialog/menu-dialog/menu_dialog_list.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';

class MenuDialogBody extends StatelessWidget {
  final List<TitleIcon> items;
  final Function(TitleIcon) onTap;
  const MenuDialogBody({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 76,
          right: 16,
          child: Container(
            decoration: const BoxDecoration(
              color: UIColor.white,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: MenuDialogList(items: items, onTap: onTap),
          ),
        ),
      ],
    );
  }
}
