import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';
import 'package:unimastery_mobile/presentation/components/session/model/session_model.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/shared/assets.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/menu_model.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/model/title_icon.dart';

enum CoursePageSituations { empty, normal }

abstract class CoursePageCubit extends Cubit<GenericState> {
  CoursePageCubit() : super(Initial());

  int? currentIndex;
  List<TitleIcon>? items;
  ScrollController? scrollController;
  CoursePopUpController? coursePopUpController;
  Stream<List<SessionModel>>? sessionListStream;

  Stream<ImageProvider?>? imageProviderStream;
  Stream<int>? currentIndexStream;

  void pickImage();
  void updateIndex(int index);
  void scroll(bool needToScrollMax);
  void likeSession(int index);
}

class CoursePageCubitImpl extends CoursePageCubit {
  final ScrollController? pScrollController;
  final CoursePopUpController? pCoursePopUpController;
  final TabController? pTabController;

  CoursePageCubitImpl({
    this.pScrollController,
    this.pCoursePopUpController,
    this.pTabController,
  }) {
    listenToKeyboardVisibility();
  }

  final imageProviderController = BehaviorSubject<ImageProvider?>();
  final currentIndexController = BehaviorSubject<int>.seeded(0);
  final sessionListController = BehaviorSubject<List<SessionModel>>.seeded(
    [
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "HFirst step for success \nM-E-N-T-A-L-I-T-Y",
        id: 0,
      ),
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "HFirst step for success \nM-E-N-T-A-L-I-T-Y",
        id: 1,
      ),
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "HFirst step for success \nM-E-N-T-A-L-I-T-Y",
        id: 2,
      ),
      SessionModel(
        commentCount: "2",
        date: "10-7-22  |   07:45",
        avatar: "https://i.pravatar.cc/300",
        name: "John Terdolovsky",
        text: "HFirst step for success \nM-E-N-T-A-L-I-T-Y",
        id: 3,
      ),
    ],
  );

  StreamSubscription? keyboardSubscription;

  final List<TitleIcon> _items = [
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

  @override
  ScrollController? get scrollController => pScrollController;

  @override
  Stream<int> get currentIndexStream => currentIndexController.stream;

  @override
  List<TitleIcon> get items => _items;

  @override
  Stream<ImageProvider?>? get imageProviderStream => imageProviderController.stream;

  @override
  Stream<List<SessionModel>> get sessionListStream => sessionListController.stream;

  @override
  CoursePopUpController? get coursePopUpController => pCoursePopUpController;

  @override
  void pickImage() async {
    final picker = ImagePicker();

    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    final file = File(pickedImage.path);
    final imageProvider = FileImage(file);
    imageProviderController.add(imageProvider);
  }

  @override
  void updateIndex(int index) {
    currentIndexController.add(index);
  }

  @override
  void scroll(bool needToScrollMax) {
    final scrollController = this.scrollController;
    if (scrollController == null) return;
    scrollController.animateTo(
      needToScrollMax ? scrollController.position.maxScrollExtent : scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.linear,
    );
  }

  listenToKeyboardVisibility() {
    final keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription = keyboardVisibilityController.onChange.listen((bool visible) {
      if (visible) {
        scrollController?.jumpTo(
          scrollController?.position.maxScrollExtent ?? 0,
        );
      }
    });
  }

  @override
  likeSession(int index) {
    final list = sessionListController.value;
    final item = list[index];
    item.isLiked = true;
    item.likeCount += 1;
    sessionListController.add(list);
  }

  @override
  Future<void> close() {
    imageProviderController.close();
    currentIndexController.close();
    keyboardSubscription?.cancel();
    return super.close();
  }
}
