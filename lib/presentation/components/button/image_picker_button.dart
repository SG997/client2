import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class ImagePickerButton extends StatelessWidget {
  final VoidCallback? onTap;

  const ImagePickerButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: const CircleAvatar(
              backgroundColor: UIColor.white,
              radius: 33,
              child: Icon(
                Icons.add_photo_alternate_outlined,
                color: UIColor.black,
              ),
            ),
          ),
          const Space(height: 8),
          Label(
            text: ".png / .jpeg 5MB",
            color: UIColor.black.withOpacity(0.5),
            size: 10,
          )
        ],
      ),
    );
  }
}
