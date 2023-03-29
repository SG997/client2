import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class SessionCreationBottomCardButtons extends StatelessWidget {
  final VoidCallback? didTapLike;
  final VoidCallback? didTapMessage;
  final int? like;
  final bool isLiked;
  const SessionCreationBottomCardButtons({
    Key? key,
    this.didTapLike,
    this.didTapMessage,
    this.like,
    this.isLiked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                splashRadius: 1,
                onPressed: didTapLike,
                icon: Icon(
                  isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                  color: isLiked ? UIColor.unitedNationsBlue : null,
                ),
              ),
              Label(
                text: "$like Likes",
                size: 12,
                weight: FontWeight.w400,
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                splashRadius: 1,
                onPressed: didTapMessage,
                icon: const Icon(Icons.message_outlined),
              ),
              const Label(
                text: "2 Comments",
                size: 12,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
