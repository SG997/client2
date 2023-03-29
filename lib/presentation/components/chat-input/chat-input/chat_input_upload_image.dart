import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class ChatInputUploadImage extends StatelessWidget {
  final bool? isUpload;
  final VoidCallback? onClosedTap;
  final ImageProvider? image;
  const ChatInputUploadImage({
    Key? key,
    this.isUpload,
    this.onClosedTap,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      child: Visibility(
        visible: isUpload ?? false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: buildCoverImage(),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  splashRadius: 20,
                  iconSize: 28,
                  onPressed: onClosedTap,
                  icon: const Icon(
                    CupertinoIcons.clear_thick_circled,
                    color: UIColor.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DecorationImage? buildCoverImage() {
    final upload = image;

    if (upload == null) return null;

    return DecorationImage(
      image: upload,
      fit: BoxFit.cover,
    );
  }
}
