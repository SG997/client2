import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/session/model/session_model.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_body.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/chat_page.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_empty_session.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_sessions.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_toolbar.dart';
import 'package:unimastery_mobile/presentation/util/services/share_service.dart';

class CourseBody extends StatelessWidget {
  final CoursePageSituations situation;
  const CourseBody({Key? key, required this.situation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coursePageCubit = context.read<CoursePageCubit>();

    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        controller: coursePageCubit.scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: StreamBuilder<ImageProvider?>(
                stream: coursePageCubit.imageProviderStream,
                builder: (context, snapshot) {
                  return AcademyCourseHeader(
                    isEditable: true,
                    title: "Trading Academy",
                    subtitle: "Forex 0 to 100 get yourself together",
                    typeTitle: "Workshop",
                    containsShadowAndRadius: false,
                    onTapHeader: () {},
                    onTapUpload: () => ShareService.share(linkUrl: "https://unimastery.com/", text: "Unimastery"),
                    onTapSelectImage: coursePageCubit.pickImage,
                    coverImage: snapshot.data ?? const AssetImage(Assets.dummy1),
                    avatarImage: const NetworkImage("https://rb.gy/j0scnj"),
                  );
                },
              ),
            ),
            CourseToolBar(didTapMore: () {}),
          ];
        },
        body: TabBarView(
          children: [
            situation == CoursePageSituations.empty
                ? const EmptySession()
                : StreamBuilder<List<SessionModel>>(
                    stream: coursePageCubit.sessionListStream,
                    builder: (context, snapshot) {
                      return CourseSessions(sessions: snapshot.data ?? []);
                    },
                  ),
            const ChatPage(),
            const AboutBody(),
          ],
        ),
      ),
    );
  }
}
