import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';

class CoursePopUp extends StatelessWidget {
  final CoursePopUpController? controller;
  final Color? iconColor;
  final Function(ChatAction)? onTap;
  final IconData? icon;
  final double? iconSize;
  final double? dx;
  final double? dy;
  final EdgeInsets? padding;
  const CoursePopUp({
    Key? key,
    this.controller,
    this.onTap,
    this.iconColor,
    this.icon,
    this.iconSize,
    this.padding,
    this.dx,
    this.dy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChatAction>>(
      stream: controller?.itemsStream,
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];
        return PopupMenuButton(
          iconSize: 24,
          color: Colors.white,
          icon: Icon(
            icon ?? Icons.more_vert,
            color: iconColor,
            size: iconSize ?? 24,
          ),
          position: PopupMenuPosition.under,
          splashRadius: 1,
          constraints: const BoxConstraints(),
          offset: Offset(dx ?? -20, dy ?? -4),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          onSelected: onTap,
          padding: padding ?? EdgeInsets.zero,
          itemBuilder: (context) {
            return items.map(
              (e) {
                return PopupMenuItem(
                  padding: const EdgeInsets.all(16),
                  value: e,
                  child: Row(
                    children: [
                      SvgPicture.asset(e.icon ?? ""),
                      const Space(width: 8),
                      Label(
                        text: e.title ?? "",
                        size: 12,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                );
              },
            ).toList();
          },
        );
      },
    );
  }
}
