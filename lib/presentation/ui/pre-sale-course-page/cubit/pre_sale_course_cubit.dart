import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/components/list/controller/team_list_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/controller/testimonials_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/model/testimonials_item_representable.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';
import 'package:unimastery_mobile/presentation/ui/pre-sale-course-page/model/student_model.dart';

enum InfoModelType {
  session,
  time,
  students,
  like,
}

class PreSaleCourseCubit extends Cubit<GenericState> {
  PreSaleCourseCubit() : super(Initial());

  List<InfoModel>? info;
  List<InfoModel>? recommendedInfo;
  List<TestimonialsItemRepresentable>? testimonials;
  List<Student>? students;
  PageController? pageController;
  TestimonialsController? carouselController;
  TeamListController? cardController;
}

class PreSaleCourseCubitImpl extends PreSaleCourseCubit {
  final PageController? pPageController;
  final TestimonialsController? pCarouselController;
  final TeamListController? pCardController;

  PreSaleCourseCubitImpl({
    this.pPageController,
    this.pCarouselController,
    this.pCardController,
  });
  @override
  List<InfoModel> get info => _info;

  final List<InfoModel> _info = [
    InfoModel(text: "12", subtext: "Sessions", icon: Assets.playOutlinedIcon, type: InfoModelType.session),
    InfoModel(text: "14", subtext: "Hours", icon: Assets.sandGlassIcon, type: InfoModelType.time),
    InfoModel(text: "1,125", subtext: "Students", icon: Assets.studentIcon, type: InfoModelType.students),
    InfoModel(text: "11,453", subtext: "Likes", icon: Assets.likeIcon, type: InfoModelType.like),
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
  List<InfoModel> get recommendedInfo => _recommendedInfo;

  @override
  TestimonialsController? get carouselController => pCarouselController;

  @override
  TeamListController? get cardController => pCardController;

  @override
  List<Student> get students => _students;
}
