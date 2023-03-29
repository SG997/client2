import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/view/course_popup.dart';
import 'package:unimastery_mobile/presentation/components/dialog/main/dialog_presenter.dart';
import 'package:unimastery_mobile/presentation/components/label/label.dart';
import 'package:unimastery_mobile/presentation/shared/l10n_dummy.dart';
import 'package:unimastery_mobile/presentation/shared/ui_color.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';
import 'package:unimastery_mobile/presentation/util/services/share_service.dart';

class CourseToolBar extends StatelessWidget {
  final VoidCallback didTapMore;
  const CourseToolBar({
    Key? key,
    required this.didTapMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coursePageCubit = context.read<CoursePageCubit>();

    return SliverAppBar(
      forceElevated: true,
      elevation: 20,
      shadowColor: UIColor.black.withOpacity(0.6),
      pinned: true,
      floating: true,
      toolbarHeight: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Row(
          children: [
            Expanded(
              child: TabBar(
                onTap: coursePageCubit.updateIndex,
                indicatorWeight: 3,
                indicatorColor: UIColor.black,
                labelPadding: const EdgeInsets.all(14),
                labelStyle: TextStyle(fontWeight: FontWeight.w600, color: UIColor.black.withOpacity(0.9)),
                unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
                tabs: const [
                  Label(text: "Sessions"),
                  Label(text: "Chat"),
                  Label(text: "About"),
                ],
                labelColor: Colors.black,
              ),
            ),
            CoursePopUp(
              onTap: (action) {
                if (action == ChatAction.leave) {
                  DialogPresenter.showCourseAlert(
                    context,
                    content: L10nDummy.dummyAlert,
                    leftButtonTitle: "Stay",
                    rightButtonTitle: "Leave",
                    didTapLeftButton: () {},
                    didTapRightButton: () {},
                  );
                } else if (action == ChatAction.share) {
                  ShareService.share(linkUrl: "https://unimastery.com/", text: "Unimastery");
                }
              },
              controller: coursePageCubit.coursePopUpController,
            ),
          ],
        ),
      ),
    );
  }
}
