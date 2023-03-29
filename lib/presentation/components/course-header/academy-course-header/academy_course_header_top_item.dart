import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class AcademyCourseHeaderTopItem extends StatelessWidget {
  final double? imageHeight;
  final bool containsShadowAndRadius;
  final bool isEditable;
  final VoidCallback? onTapImagePicker;
  final ImageProvider? coverImage;
  const AcademyCourseHeaderTopItem({
    Key? key,
    required this.containsShadowAndRadius,
    required this.isEditable,
    this.onTapImagePicker,
    this.coverImage,
    this.imageHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: imageHeight ?? 150,
          decoration: BoxDecoration(
            image: buildCoverImage(),
            color: UIColor.spanishGray.withOpacity(0.1),
            borderRadius: containsShadowAndRadius
                ? const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  )
                : null,
          ),
          child: !isEditable
              ? coverImage == null
                  ? ImagePickerButton(onTap: onTapImagePicker)
                  : null
              : null,
        ),
        const SizedBox(height: 13),
      ],
    );
  }

  DecorationImage? buildCoverImage() {
    final cover = coverImage;

    if (cover == null) return null;

    return DecorationImage(
      image: cover,
      fit: BoxFit.cover,
    );
  }
}
