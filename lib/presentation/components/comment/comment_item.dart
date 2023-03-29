import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class CommentItem extends StatelessWidget {
  final String text;
  final String name;
  final String date;
  final String avatar;
  final int likeCount;
  final String commentCount;
  final VoidCallback? didTapLike;
  final bool isLiked;

  const CommentItem({
    Key? key,
    required this.text,
    required this.name,
    required this.date,
    required this.avatar,
    required this.likeCount,
    required this.commentCount,
    this.didTapLike,
    this.isLiked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: UIColor.white,
        boxShadow: [
          BoxShadow(
            color: UIColor.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 26,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage(
                avatar,
              ),
            ),
            title: Label(
              size: 12,
              text: name,
              weight: FontWeight.w400,
              color: UIColor.black.withOpacity(0.5),
            ),
            trailing: Label(
              size: 12,
              weight: FontWeight.w400,
              color: UIColor.black.withOpacity(0.5),
              text: date,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Label(
              text: text,
              size: 14,
              weight: FontWeight.w400,
              color: UIColor.black.withOpacity(0.7),
            ),
          ),
          Padding(
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
                        isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: isLiked ? UIColor.unitedNationsBlue : null,
                      ),
                    ),
                    Label(
                      text: "$likeCount Likes",
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      splashRadius: 1,
                      onPressed: () {},
                      icon: const Icon(Icons.message_outlined),
                    ),
                    Label(
                      text: "$commentCount Comments",
                      size: 12,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
