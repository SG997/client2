import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';

class AcademyCourseHeaderItem extends StatelessWidget {
  final double? imageHeight;
  final ImageProvider? avatarImage;
  final ImageProvider? coverImage;
  final String title;
  final String subtitle;
  final String? typeTitle;
  final bool containsShadowAndRadius;
  final bool isEditable;
  final bool? hasBookmark;
  final bool isAvatarSmall;
  final VoidCallback? onTapUpload;
  final VoidCallback? onTapBookmark;
  final VoidCallback? onTapSelectImage;
  const AcademyCourseHeaderItem({
    Key? key,
    this.imageHeight,
    this.avatarImage,
    this.coverImage,
    this.isAvatarSmall = false,
    required this.title,
    required this.subtitle,
    this.typeTitle,
    required this.containsShadowAndRadius,
    required this.isEditable,
    this.hasBookmark,
    this.onTapUpload,
    this.onTapBookmark,
    this.onTapSelectImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            AcademyCourseHeaderTopItem(
              imageHeight: imageHeight,
              containsShadowAndRadius: containsShadowAndRadius,
              isEditable: isEditable,
              coverImage: coverImage,
              onTapImagePicker: onTapSelectImage,
            ),
            AcademyCourseHeaderProfile(
              avatarImage: avatarImage,
              isAvatarSmall: isAvatarSmall,
            ),
            Positioned(
              left: 16,
              top: 16,
              child: LabelChip(
                title: typeTitle ?? "",
              ),
            ),
            if (isEditable)
              AcademyCourseHeaderBookmark(
                hasBookmark: hasBookmark,
                onTapBookmark: onTapBookmark,
                onTapSelectImage: onTapSelectImage,
                onTapUpload: onTapUpload,
              ),
          ],
        ),
        AcademyCourseHeaderBottomItem(
          title: title,
          subtitle: subtitle,
        ),
        Space(height: !containsShadowAndRadius ? 12 : 32),
      ],
    );
  }
}
