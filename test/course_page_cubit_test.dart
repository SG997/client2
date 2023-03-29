import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unimastery_mobile/app/di.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/ui/course-page/cubit/course_page_cubit.dart';

void main() {
  Injector.register();

  group("Course Page Cubit Test", () {
    late CoursePageCubit coursePageCubit;

    setUp(() {
      coursePageCubit = locator.get<CoursePageCubit>();
    });

    test("Test state to be initial", () {
      expect(coursePageCubit.state, Initial());
    });

    test("Test currrent index stream initialized", () {
      expect(coursePageCubit.currentIndexStream, isInstanceOf<BehaviorSubject<int>>());
    });

    test("Test image provider stream initialized", () {
      expect(coursePageCubit.imageProviderStream, isInstanceOf<BehaviorSubject<ImageProvider?>>());
    });

    test("Test for checking item list is not empty ", () {
      expect(coursePageCubit.items?.isNotEmpty, true);
    });

    test("Test to update current index", () {
      const int index = 2;

      coursePageCubit.updateIndex(index);

      expect(coursePageCubit.currentIndexStream, emitsInOrder([index]));
    });
  });
}
