import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/dialog/menu-dialog/menu_dialog_body.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';

class MenuDialog extends StatelessWidget {
  final List<TitleIcon> items;
  final Function(TitleIcon) onTap;

  const MenuDialog({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: UIColor.clear,
        body: MenuDialogBody(
          items: items,
          onTap: onTap,
        ),
      ),
    );
  }
}
