import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class AcademyCourseHeaderBookmark extends StatelessWidget {
  final bool? hasBookmark;
  final VoidCallback? onTapUpload;
  final VoidCallback? onTapBookmark;
  final VoidCallback? onTapSelectImage;
  const AcademyCourseHeaderBookmark({
    Key? key,
    this.hasBookmark,
    this.onTapUpload,
    this.onTapBookmark,
    this.onTapSelectImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: Row(
        children: [
          if (!(hasBookmark ?? false))
            CircleAvatar(
              radius: 15,
              backgroundColor: UIColor.white,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onTapUpload,
                child: const Icon(
                  Icons.share_outlined,
                  size: 18,
                  color: UIColor.black,
                ),
              ),
            ),
          const Space(width: 8),
          if (!(hasBookmark ?? false))
            CircleAvatar(
              radius: 15,
              backgroundColor: UIColor.white,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onTapSelectImage,
                child: const Icon(
                  Icons.add_photo_alternate_outlined,
                  color: UIColor.black,
                  size: 20,
                ),
              ),
            ),
          const Space(width: 8),
          if (hasBookmark ?? false)
            CircleAvatar(
              radius: 15,
              backgroundColor: UIColor.white,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: onTapBookmark,
                child: Icon(
                  CupertinoIcons.bookmark_fill,
                  color: UIColor.black.withOpacity(0.2),
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
