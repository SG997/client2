import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/academy/model/info_model.dart';

abstract class HomePageCubit extends Cubit<GenericState> {
  HomePageCubit() : super(Initial());

  List<InfoModel>? recommendedInfo;
  List<InfoModel>? featuredInfo;
  final key = GlobalKey();
}

class HomePageCubitImpl extends HomePageCubit {
  final List<InfoModel> _recommendedInfo = [
    InfoModel(text: "1,125", subtext: "Students", icon: Assets.studentIcon),
    InfoModel(text: "14", subtext: "Classes", icon: Assets.bookIcon),
  ];

  final List<InfoModel> _featuredInfo = [
    InfoModel(text: "12", subtext: "Sessions", icon: Assets.playOutlinedIcon),
    InfoModel(text: "14", subtext: "Hours", icon: Assets.sandGlassIcon),
    InfoModel(text: "1,125", subtext: "Students", icon: Assets.studentIcon),
  ];

  @override
  List<InfoModel> get recommendedInfo => _recommendedInfo;

  @override
  List<InfoModel> get featuredInfo => _featuredInfo;
}
