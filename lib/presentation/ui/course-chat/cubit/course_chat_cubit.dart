import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/components/dialog/chat-popup/controller/course_popup_controller.dart';

enum PickType { gallery, camera }

abstract class CourseChatCubit extends Cubit<GenericState> {
  CourseChatCubit() : super(Initial());

  Stream<bool>? sendingAvailabilityStream;

  ScrollController? scrollController;

  CoursePopUpController? courseAdditionPopUpController;

  TextEditingController? textEditingController;

  double scrollOffset = 0.0;

  void setKeyboardVisibility(bool value);
}

class CourseChatImpl extends CourseChatCubit {
  final textController = TextEditingController();

  final keyboardVisibilityController = BehaviorSubject<bool>();

  final CoursePopUpController? pCourseChatAdditionPopUpController;

  CourseChatImpl({
    this.pCourseChatAdditionPopUpController,
  });

  @override
  Stream<bool>? get keyboardVisibilityStream => keyboardVisibilityController.stream;

  @override
  CoursePopUpController? get courseAdditionPopUpController => pCourseChatAdditionPopUpController;

  @override
  void setKeyboardVisibility(bool value) {
    keyboardVisibilityController.add(value);
  }

  @override
  Future<void> close() {
    keyboardVisibilityController.close();
    return super.close();
  }
}
