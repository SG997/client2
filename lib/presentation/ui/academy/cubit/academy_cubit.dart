import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/components/list/controller/team_list_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/controller/testimonials_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/model/testimonials_item_representable.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/menu_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/cubit/pre_sale_course_cubit.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/model/student_model.dart';

class AcademyPageCubit extends Cubit<GenericState> {
  AcademyPageCubit() : super(Initial());

  List<InfoModel>? info;
  List<InfoModel>? featuredInfo;
  List<InfoModel>? recommendedInfo;
  List<Student> students = [];
  List<TestimonialsItemRepresentable>? testimonials;
  List<TitleIcon>? menuItems;
  PageController? pageController;
  TestimonialsController? carouselController;
  TeamListController? cardController;
}

class AcademyPageCubitImpl extends AcademyPageCubit {
  final PageController? pPageController;
  final TestimonialsController? pCarouselController;
  final TeamListController? pCardController;

  AcademyPageCubitImpl({
    this.pCardController,
    this.pPageController,
    this.pCarouselController,
  }) : super();

  final List<TitleIcon> _menuItems = [
    MenuModel(
      title: 'Dashboard',
      icon: Assets.dashboardIcon,
      route: RouteName.none,
    ),
    MenuModel(
      title: 'Create',
      icon: Assets.addIcon,
      route: RouteName.sessionCreation,
    ),
    MenuModel(
      title: 'Edit Mode',
      icon: Assets.editIcon,
      route: RouteName.none,
    ),
  ];

  final List<InfoModel> _info = [
    InfoModel(text: "1,125", subtext: "Students", icon: Assets.studentIcon, type: InfoModelType.students),
    InfoModel(text: "14", subtext: "Classes", icon: Assets.bookIcon),
    InfoModel(text: "5", subtext: "Mentors", icon: Assets.communityIcon),
    InfoModel(text: "Contact", subtext: "Us", icon: Assets.mailIcon),
  ];

  final List<InfoModel> _featuredInfo = [
    InfoModel(text: "12", subtext: "Sessions", icon: Assets.playOutlinedIcon),
    InfoModel(text: "14", subtext: "Hours", icon: Assets.sandGlassIcon),
    InfoModel(text: "1,125", subtext: "Students", icon: Assets.studentIcon),
  ];

  final List<InfoModel> _recommendedInfo = [
    InfoModel(text: "1,125", subtext: "Students", icon: Assets.studentIcon),
    InfoModel(text: "14", subtext: "Classes", icon: Assets.bookIcon),
  ];

  final List<Student> _students = List.generate(
    20,
    (index) => Student(
      name: "Kaylynn",
      surname: "Siphron",
      avatar: "https://i.pravatar.cc/200",
    ),
  );

  @override
  List<InfoModel> get info => _info;

  @override
  List<InfoModel> get featuredInfo => _featuredInfo;

  @override
  List<InfoModel> get recommendedInfo => _recommendedInfo;

  @override
  TestimonialsController? get carouselController => pCarouselController;

  @override
  TeamListController? get cardController => pCardController;

  @override
  List<Student> get students => _students;

  @override
  List<TitleIcon> get menuItems => _menuItems;

  @override
  Future<void> close() {
    pPageController?.dispose();
    pCarouselController?.close();
    pCardController?.close();
    return super.close();
  }
}
