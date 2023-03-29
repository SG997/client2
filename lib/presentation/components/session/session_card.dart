import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';

class SessionCard extends StatelessWidget {
  final String? title;
  final VideoState videoState;
  final bool? hideTopRadius;
  final String? path;
  final String? name;
  final String? date;
  final bool? hasShadow;
  final VoidCallback? didTapLike;
  final int? like;
  final bool? isLike;
  final VoidCallback? didTapMessage;

  const SessionCard({
    Key? key,
    required this.videoState,
    this.hideTopRadius,
    this.title,
    this.hasShadow,
    this.didTapLike,
    this.like,
    this.isLike,
    this.didTapMessage,
    this.path,
    this.name,
    this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: UIColor.white,
        borderRadius: hideTopRadius ?? false ? const BorderRadius.vertical(bottom: Radius.circular(24)) : BorderRadius.circular(12),
        boxShadow: hasShadow ?? false
            ? [
                BoxShadow(
                  color: UIColor.black.withOpacity(0.1),
                  blurRadius: 26,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Column(
        children: [
          SessionCardTopBackground(
            hideTopRadius: hideTopRadius,
            videoState: videoState,
          ),
          SessionCardBottom(
            date: date,
            path: path,
            name: name,
            didTapMessage: didTapMessage,
            like: like,
            didTapLike: didTapLike,
            isLike: isLike,
            text: title ?? '',
          ),
        ],
      ),
    );
  }
}
