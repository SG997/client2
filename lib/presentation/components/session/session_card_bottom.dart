import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/session/session_bottom_card_buttons.dart';
import 'package:unimastery_mobile/presentation/components/session/session_card_bottom_credentials.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';

class SessionCardBottom extends StatelessWidget {
  final String text;
  final String? path;
  final String? name;
  final String? date;
  final VoidCallback? didTapLike;
  final int? like;
  final bool? isLike;
  final VoidCallback? didTapMessage;
  const SessionCardBottom({
    Key? key,
    required this.text,
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Space(height: 12),
          SessionCardBottomCredentials(
            name: name,
            path: path,
            date: date,
          ),
          const Space(height: 16),
          Label(
            text: text,
            size: 15,
            color: UIColor.black.withOpacity(0.9),
          ),
          const Space(height: 12),
          SessionCreationBottomCardButtons(
            isLiked: isLike ?? false,
            like: like,
            didTapLike: didTapLike,
            didTapMessage: didTapMessage,
          ),
        ],
      ),
    );
  }
}
