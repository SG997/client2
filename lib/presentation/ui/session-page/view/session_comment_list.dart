import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/comment/comment_item.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/session/model/session_model.dart';

class SessionCommentList extends StatelessWidget {
  const SessionCommentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sessionController = context.read<SessionController>();
    return StreamBuilder<List<SessionModel>>(
      stream: sessionController.commentListStream,
      builder: (context, snapshot) {
        final list = snapshot.data ?? [];
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final item = list[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: CommentItem(
                  commentCount: item.commentCount,
                  likeCount: item.likeCount,
                  isLiked: item.isLiked,
                  didTapLike: item.isLiked ? null : () => sessionController.likeComment(index),
                  avatar: item.avatar,
                  date: item.date,
                  name: item.name,
                  text: item.text,
                ),
              );
            },
            childCount: list.length,
          ),
        );
      },
    );
  }
}
