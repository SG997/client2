import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/presentation/components/other/space.dart';
import 'package:unimastery_mobile/presentation/components/session/model/session_model.dart';
import 'package:unimastery_mobile/presentation/components/session/session_card.dart';
import 'package:unimastery_mobile/presentation/components/session/session_controller.dart';
import 'package:unimastery_mobile/presentation/shared/shared.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_empty_session.dart';
import 'package:unimastery_mobile/presentation/ui/session-page/view/session_page.dart';

class CourseSessions extends StatelessWidget {
  final List<SessionModel> sessions;
  const CourseSessions({Key? key, required this.sessions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coursePageCubit = context.read<CoursePageCubit>();
    return Container(
      color: UIColor.white,
      child: Column(
        children: [
          Expanded(
            child: sessions.isEmpty
                ? const EmptySession()
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                    separatorBuilder: (context, index) => const Space(height: 40),
                    cacheExtent: 1000,
                    itemCount: sessions.length,
                    itemBuilder: (_, index) {
                      final session = sessions[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: UIColor.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: UIColor.black.withOpacity(0.05),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: OpenContainer(
                          closedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          closedBuilder: (context, action) {
                            return RepositoryProvider(
                              create: (context) => locator.get<SessionController>(),
                              child: SessionCard(
                                name: session.name,
                                path: session.avatar,
                                date: session.date,
                                title: session.text,
                                isLike: session.isLiked,
                                didTapLike: session.isLiked ? null : () => coursePageCubit.likeSession(index),
                                like: session.likeCount,
                                didTapMessage: () {},
                                hasShadow: true,
                                videoState: VideoState.uploaded,
                              ),
                            );
                          },
                          openBuilder: (context, action) {
                            return StreamBuilder<List<SessionModel>>(
                              stream: coursePageCubit.sessionListStream,
                              builder: (context, snapshot) {
                                return SessionPage(
                                  session: session,
                                  didTapLike: session.isLiked ? null : () => coursePageCubit.likeSession(index),
                                  didTapMessage: () {},
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
