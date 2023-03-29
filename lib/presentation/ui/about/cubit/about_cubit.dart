import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/components/list/controller/team_list_controller.dart';
import 'package:unimastery_mobile/presentation/components/testimonials/controller/testimonials_controller.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';

abstract class AboutCubit extends Cubit<GenericState> {
  AboutCubit() : super(Initial());

  PageController? pageController;
  TestimonialsController? carouselController;
  TeamListController? cardController;
  List<InfoModel>? info;
}

class AboutCubitImpl extends AboutCubit {
  final PageController? pPageController;
  final TestimonialsController? pCarouselController;
  final TeamListController? pCardController;

  AboutCubitImpl({
    this.pPageController,
    this.pCarouselController,
    this.pCardController,
  });

  @override
  TestimonialsController? get carouselController => pCarouselController;

  @override
  TeamListController? get cardController => pCardController;

  @override
  List<InfoModel> get info => _info;

  final List<InfoModel> _info = [
    InfoModel(text: "12", subtext: "Sessions", icon: Assets.playOutlinedIcon),
    InfoModel(text: "14", subtext: "Hours", icon: Assets.sandGlassIcon),
    InfoModel(text: "1,125", subtext: "Students", icon: Assets.studentIcon),
    InfoModel(text: "11,453", subtext: "Likes", icon: Assets.likeIcon),
  ];
}
