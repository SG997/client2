import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unimastery_mobile/app/viewmodel/app_view_model.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';
import 'package:unimastery_mobile/presentation/components/dropdown/controller/dropdown_controller.dart';
import 'package:unimastery_mobile/presentation/components/list/controller/team_list_controller.dart';
import 'package:unimastery_mobile/presentation/components/session/session_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/controller/testimonials_controller.dart';
import 'package:unimastery_mobile/presentation/service/deep_link_service.dart';
import 'package:unimastery_mobile/presentation/ui/about/cubit/about_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/about/model/about_card_item.dart';
import 'package:unimastery_mobile/presentation/ui/about/model/about_item.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/cubit/course_chat_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/create-academy/model/date_selector_item.dart';
import 'package:unimastery_mobile/presentation/ui/create-academy/view-model/create_academy_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/home/cubit/home_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/login/view-model/login_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/cubit/notification_settings_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/otp/cubit/otp_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/payment-history/cubit/payment_history_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view-model/personal_information_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/settings/cubit/settings_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/cubit/user_detail_input_cubit.dart';
import 'package:unimastery_mobile/presentation/util/datetime_ext.dart';

GetIt locator = GetIt.instance;

class Injector {
  static register() {
    _registerServices();
    _registerCubits();
  }

  static _registerServices() {
    locator.registerSingleton<DeepLinkService>(DeepLinkService());
  }

  static _registerCubits() {
    locator.registerFactory<LoginViewModel>(() => LoginViewModelImpl());
    locator.registerFactory<CreateAcademyViewModel>(
      () => CreateAcademyViewModelImpl(
        createAcademyPageController: PageController(initialPage: 0),
        dropdownController: DropdownController(
          currencyItem: [
            DateSelectorItem(title: "₪ Shekel", id: 0),
            DateSelectorItem(title: "\$ Dollar", id: 1),
            DateSelectorItem(title: "€ Euro", id: 2),
          ],
          dateItem: [
            DateSelectorItem(title: "One Time", id: 0),
            DateSelectorItem(title: "Monthly", id: 1),
          ],
        ),
      ),
    );

    locator.registerFactory<AppViewModel>(() => AppViewModelImpl());
    locator.registerFactory<OtpViewModel>(() => OtpViewModelImpl());
    locator.registerFactory<AcademyPageCubit>(
      () => AcademyPageCubitImpl(
        pPageController: PageController(initialPage: 0),
        pCarouselController: TestimonialsController(
          items: [1, 2, 3, 4, 5].map((e) {
            return AboutItem(
              imagePath: "https://picsum.photos/202",
              userName: "Amy Bishbashovich, 27",
              description:
                  "I took this class and created a wonderfull Portfolio with my bank account and it absolutly worked for me - Thanks for a lovely master class.",
            );
          }).toList(),
        ),
        pCardController: TeamListController(
          items: [1, 2, 3].map((e) {
            return AboutCardItem(
              imagePath: "https://picsum.photos/200",
              userName: "Noa\nVellenksy",
              description: "MENTOR",
            );
          }).toList(),
        ),
      ),
    );

    locator.registerFactory<UserDetailInputCubit>(() {
      return UserDetailInputCubitImpl(
        pEmailTextController: TextEditingController(),
        pFirstNameTextController: TextEditingController(),
        pLastNameTextController: TextEditingController(),
        pBirthdayTextController: TextEditingController()..text = DateTime.now().formattedDate,
      );
    });

    locator.registerFactory<CoursePageCubit>(() {
      return CoursePageCubitImpl(
        pScrollController: ScrollController(),
        pCoursePopUpController: CoursePopUpController(
          items: [
            ChatAction.files,
            ChatAction.report,
            ChatAction.share,
            ChatAction.leave,
            ChatAction.contactUs,
          ],
        ),
      );
    });

    locator.registerFactory<SessionCreationCubit>(() {
      return SessionCreationImpl(
        pSessionCreationPageController: PageController(initialPage: 0),
        imagePicker: ImagePicker(),
      );
    });

    locator.registerFactory<CourseChatCubit>(() {
      return CourseChatImpl(
        pCourseChatAdditionPopUpController: CoursePopUpController(
          items: [ChatAction.files, ChatAction.addVideo],
        ),
      );
    });

    locator.registerFactory<AboutCubit>(() {
      return AboutCubitImpl(
        pPageController: PageController(initialPage: 0),
        pCarouselController: TestimonialsController(
          items: [1, 2, 3, 4, 5].map((e) {
            return AboutItem(
              imagePath: "https://picsum.photos/202",
              userName: "Amy Bishbashovich, 27",
              description:
                  "I took this class and created a wonderfull Portfolio with my bank account and it absolutly worked for me - Thanks for a lovely master class.",
            );
          }).toList(),
        ),
        pCardController: TeamListController(
          items: [1, 2, 3].map((e) {
            return AboutCardItem(
              imagePath: "https://picsum.photos/200",
              userName: "Noa\nVellenksy",
              description: "MENTOR",
            );
          }).toList(),
        ),
      );
    });

    locator.registerFactory<SessionController>(
      () => SessionController(
        imagePicker: ImagePicker(),
      ),
    );

    locator.registerFactory<SettingsCubit>(() {
      return SettingsCubitImpl();
    });

    locator.registerFactory<PersonalInformationViewModel>(() {
      return PersonalInformationViewModelImpl();
    });

    locator.registerFactory<PaymentHistoryCubit>(() {
      return PaymentHistoryCubitImpl();
    });
    locator.registerFactory<HomePageCubit>(() {
      return HomePageCubitImpl();
    });

    locator.registerFactory<NotificationSettingsCubit>(() {
      return NotificationSettingsCubitImpl();
    });

    locator.registerFactory<PreSaleCourseCubit>(
      () => PreSaleCourseCubitImpl(
        pPageController: PageController(initialPage: 0),
        pCarouselController: TestimonialsController(
          items: [1, 2, 3, 4, 5].map((e) {
            return AboutItem(
              imagePath: "https://picsum.photos/202",
              userName: "Amy Bishbashovich, 27",
              description:
                  "I took this class and created a wonderfull Portfolio with my bank account and it absolutly worked for me - Thanks for a lovely master class.",
            );
          }).toList(),
        ),
        pCardController: TeamListController(
          items: [1, 2, 3].map((e) {
            return AboutCardItem(
              imagePath: "https://picsum.photos/200",
              userName: "Noa\nVellenksy",
              description: "MENTOR",
            );
          }).toList(),
        ),
      ),
    );
  }
}
