import 'package:flutter/cupertino.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class AcademyCourseHeader extends StatelessWidget {
  final double? imageHeight;
  final ImageProvider? avatarImage;
  final ImageProvider? coverImage;
  final String title;
  final String subtitle;
  final String? typeTitle;
  final bool containsShadowAndRadius;
  final bool? containsOnlyRadius;
  final bool isEditable;
  final bool? hasBookmark;
  final bool? isAvatarSmall;
  final VoidCallback? onTapHeader;
  final VoidCallback? onTapImagePicker;
  final VoidCallback? onTapUpload;
  final VoidCallback? onTapBookmark;
  final VoidCallback? onTapSelectImage;

  const AcademyCourseHeader({
    Key? key,
    this.avatarImage,
    this.coverImage,
    this.containsOnlyRadius,
    this.imageHeight,
    this.isAvatarSmall,
    required this.title,
    required this.subtitle,
    this.typeTitle,
    this.containsShadowAndRadius = true,
    this.onTapHeader,
    this.onTapImagePicker,
    this.onTapBookmark,
    required this.isEditable,
    this.onTapUpload,
    this.hasBookmark = false,
    this.onTapSelectImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(),
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(containsShadowAndRadius ? 12 : 0),
        color: UIColor.white,
        padding: EdgeInsets.zero,
        pressedOpacity: 0.6,
        onPressed: onTapHeader,
        child: AcademyCourseHeaderItem(
          isAvatarSmall: isAvatarSmall ?? false,
          imageHeight: imageHeight,
          hasBookmark: hasBookmark,
          isEditable: isEditable,
          avatarImage: avatarImage,
          coverImage: coverImage,
          title: title,
          subtitle: subtitle,
          typeTitle: typeTitle,
          containsShadowAndRadius: containsShadowAndRadius,
          onTapUpload: onTapUpload,
          onTapBookmark: onTapBookmark,
          onTapSelectImage: onTapSelectImage,
        ),
      ),
    );
  }

  BoxDecoration? decoration() {
    if (!containsShadowAndRadius) return null;
    if (containsOnlyRadius ?? false) return null;
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: UIColor.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 30,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}
