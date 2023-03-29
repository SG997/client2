import 'package:flutter/material.dart';
import 'package:unimastery_mobile/presentation/components/chat-input/chat-input/chat_input.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/session/model/session_model.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/controller/chat_input_controller.dart';
import 'package:unimastery_mobile/presentation/ui/session-page/view/session_comment_list.dart';

class SessionBody extends StatelessWidget {
  final SessionModel session;
  final VoidCallback? didTapLike;
  final VoidCallback? didTapMessage;
  const SessionBody({
    Key? key,
    this.didTapLike,
    this.didTapMessage,
    required this.session,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              cacheExtent: 3500,
              slivers: [
                SliverToBoxAdapter(
                  child: SessionCard(
                    path: session.avatar,
                    isLike: session.isLiked,
                    didTapLike: didTapLike,
                    like: session.likeCount,
                    didTapMessage: didTapMessage,
                    hasShadow: true,
                    title: "PART 04: \nThe Power of Mental Toughness",
                    hideTopRadius: true,
                    videoState: VideoState.uploaded,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Space(height: 20),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Label(
                          text: "Comments",
                          size: 22,
                          weight: FontWeight.w700,
                        ),
                        Row(
                          children: [
                            Label(text: "News first", size: 12, color: UIColor.black.withOpacity(0.5)),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SessionCommentList()
              ],
            ),
          ),
          ChatInput(
            inputController: ChatInputController(),
          ),
        ],
      ),
    );
  }
}
