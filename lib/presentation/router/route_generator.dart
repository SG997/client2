import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/app/log.dart';
import 'package:unimastery_mobile/presentation/components/navbar/primary_bottom_navbar_controller.dart';
import 'package:unimastery_mobile/presentation/components/video-player/video_player_screen.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/ui/about/cubit/about_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/about/view/about_page.dart';
import 'package:unimastery_mobile/presentation/ui/academy/cubit/academy_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/academy/view/academy_page.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/cubit/course_chat_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/model/message_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/chat_page.dart';
import 'package:unimastery_mobile/presentation/ui/course-chat/view/course_chat_image_full_screen.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/view/course_page.dart';
import 'package:unimastery_mobile/presentation/ui/create-academy/view-model/create_academy_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/create-academy/view/create_academy_page.dart';
import 'package:unimastery_mobile/presentation/ui/editor-page/view/editor_page.dart';
import 'package:unimastery_mobile/presentation/ui/home/cubit/home_page_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/home/view/home_page.dart';
import 'package:unimastery_mobile/presentation/ui/login/view-model/login_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/login/view/login_page.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/cubit/notification_settings_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/notification-setting/view/notification_settings_page.dart';
import 'package:unimastery_mobile/presentation/ui/otp/cubit/otp_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/otp/view/otp_page.dart';
import 'package:unimastery_mobile/presentation/ui/payment-history/cubit/payment_history_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/payment-history/view/payment_history_page.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/model/personal_information_model.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view-model/personal_information_view_model.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/view/personal_information_page.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/view/pre_sale_course_page.dart';
import 'package:unimastery_mobile/presentation/ui/root/root_page.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/cubit/session_creation_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/session-creation/view/main/session_creation_page.dart';
import 'package:unimastery_mobile/presentation/ui/settings/cubit/settings_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/settings/view/settings_page.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/cubit/user_detail_input_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/view/user_detail_input_page.dart';
import 'package:video_player/video_player.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = RouteName.fromString(settings.name);
    final args = settings.arguments;

    Logger.log("Navigating to :> [$route] ; Arguments are :> [$args]");

    switch (route) {
      case RouteName.login:
        return push(
          ChangeNotifierProvider<LoginViewModel>(
            create: (context) => locator.get<LoginViewModel>(),
            child: const LoginPage(),
          ),
        );

      case RouteName.otp:
        final phoneNumber = args as String;
        return push(
          ChangeNotifierProvider<OtpViewModel>(
            create: (context) => locator.get<OtpViewModel>(),
            child: OtpPage(phoneNumber: phoneNumber),
          ),
        );

      case RouteName.userDetailInput:
        return push(
          BlocProvider<UserDetailInputCubit>(
            create: (context) => locator.get<UserDetailInputCubit>(),
            child: const UserDetailInputPage(),
          ),
        );

      case RouteName.root:
        return push(
          MultiBlocProvider(
            providers: [
              BlocProvider<HomePageCubit>(
                create: (context) => locator.get<HomePageCubit>(),
              ),
              BlocProvider<AcademyPageCubit>(
                create: (context) => locator.get<AcademyPageCubit>(),
              ),
              BlocProvider<SettingsCubit>(
                create: (context) => locator.get<SettingsCubit>(),
              ),
            ],
            child: RepositoryProvider(
              create: (context) => PrimaryBottomNavbarController(),
              child: RootPage(
                controller: PrimaryBottomNavbarController(),
              ),
            ),
          ),
        );

      case RouteName.createAcademy:
        return push(
          ChangeNotifierProvider(
            create: (_) => locator.get<CreateAcademyViewModel>(),
            child: const CreateAcademyPage(),
          ),
        );

      case RouteName.sessionCreation:
        return push(
          BlocProvider<SessionCreationCubit>(
            create: (context) => locator.get<SessionCreationCubit>(),
            child: const SessionCreationPage(),
          ),
        );

      case RouteName.courseChat:
        return push(
          BlocProvider<CourseChatCubit>(
            create: (context) => locator.get<CourseChatCubit>(),
            child: const ChatPage(),
          ),
        );

      case RouteName.about:
        return push(
          BlocProvider<AboutCubit>(
            create: (context) => locator.get<AboutCubit>(),
            child: const AboutPage(),
          ),
        );

      case RouteName.settings:
        return push(
          BlocProvider<SettingsCubit>(
            create: (context) => locator.get<SettingsCubit>(),
            child: const SettingsPage(),
          ),
        );

      case RouteName.paymentHistory:
        return push(
          BlocProvider<PaymentHistoryCubit>(
            create: (context) => locator.get<PaymentHistoryCubit>(),
            child: const PaymentHistoryPage(),
          ),
        );

      case RouteName.personalInformation:
        return push(
          ChangeNotifierProvider<PersonalInformationViewModel>(
            create: (context) => locator.get<PersonalInformationViewModel>(),
            child: const PersonalInformationPage(),
          ),
        );

      case RouteName.coursePage:
        final situation = args as CoursePageSituations?;
        return push(
          MultiBlocProvider(
            providers: [
              BlocProvider<CourseChatCubit>(
                create: (context) => locator.get<CourseChatCubit>(),
              ),
              BlocProvider<AboutCubit>(
                create: (context) => locator.get<AboutCubit>(),
              ),
              BlocProvider(
                create: (context) => locator.get<CoursePageCubit>(),
              ),
              BlocProvider(
                create: (context) => locator.get<SessionCreationCubit>(),
              ),
            ],
            child: CoursePage(situation: situation ?? CoursePageSituations.normal),
          ),
        );

      case RouteName.preSaleCoursePage:
        return push(
          BlocProvider(
            create: (context) => locator.get<PreSaleCourseCubit>(),
            child: const PreSaleCoursePage(),
          ),
        );

      case RouteName.academyPage:
        return push(
          BlocProvider<AcademyPageCubit>(
            create: (context) => locator.get<AcademyPageCubit>(),
            child: const AcademyPage(),
          ),
        );

      case RouteName.useEditor:
        final personalInformation = args as PersonalInformationModel;
        return push(EditorPage(personalInformation: personalInformation));

      case RouteName.notificationSettings:
        return push(
          BlocProvider<NotificationSettingsCubit>(
            create: (context) => locator.get<NotificationSettingsCubit>(),
            child: const NotificationSettingsPage(),
          ),
        );

      case RouteName.homePage:
        return push(
          BlocProvider<HomePageCubit>(
            create: (context) => locator.get<HomePageCubit>(),
            child: const HomePage(),
          ),
        );
      case RouteName.fullScreenImage:
        final message = args as IMessage;
        return push(
          CourseChatImageFullScreen(
            message: message,
          ),
        );

      // case RouteName.sessionPage:
      //   return push(const SessionPage());

      case RouteName.videoPlayerScreen:
        final controller = args as VideoPlayerController;
        return push(
          VideoPlayerPage(
            videoPlayerController: controller,
          ),
        );
      default:
        return errorRoute();
    }
  }

  static push(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }

  static present(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget, fullscreenDialog: true);
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.warning_rounded),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "PAGE NOT EXISTS YET",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
