import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:unimastery_mobile/app/generic/generic_state.dart';
import 'package:unimastery_mobile/presentation/router/navigation.dart';
import 'package:unimastery_mobile/presentation/ui/user-detail-input/model/user_interests_model.dart';
import 'package:unimastery_mobile/presentation/util/datetime_ext.dart';
import 'package:unimastery_mobile/presentation/util/stringx.dart';

abstract class UserDetailInputCubit extends Cubit<GenericState> {
  UserDetailInputCubit() : super(Initial());

  TextEditingController? firstNameTextController;
  TextEditingController? lastNameTextController;
  TextEditingController? birthdayTextController;
  TextEditingController? emailTextController;

  Stream<bool>? keyboardVisibilityStream;
  Stream<int>? stepperPositionStream;
  Stream<String?>? firstNameStream;
  Stream<String?>? lastNameStream;
  Stream<String?>? emailStream;
  Stream<List<UserInterestsModel>>? userInterestsStream;

  DateTime birthdayDate = DateTime.now();

  void setKeyboardVisibility(bool value);
  void setStepperPosition(int value);
  void setFirstName(String? value);
  void setLastName(String? value);
  void setEmail(String? value);
  void setBirthday(DateTime? value);
  void submitStepOne();
  void submitStepTwo();
  void submitStepThree();
  void selectUserInterests(UserInterestsModel value);
}

class UserDetailInputCubitImpl extends UserDetailInputCubit {
  final keyboardVisibilityController = BehaviorSubject<bool>();
  final stepperPositionController = BehaviorSubject<int>.seeded(0);
  final firstNameController = BehaviorSubject<String?>();
  final lastNameController = BehaviorSubject<String?>();
  final birthdayController = BehaviorSubject<DateTime>.seeded(DateTime.now());
  final emailController = BehaviorSubject<String?>();

  final userInterestsController = BehaviorSubject<List<UserInterestsModel>>.seeded([
    UserInterestsModel(id: 0, title: "Investing"),
    UserInterestsModel(id: 1, title: "Yoga"),
    UserInterestsModel(id: 2, title: "DIY"),
    UserInterestsModel(id: 3, title: "Development"),
    UserInterestsModel(id: 4, title: "Business"),
    UserInterestsModel(id: 5, title: "Finance"),
    UserInterestsModel(id: 6, title: "IT"),
    UserInterestsModel(id: 7, title: "Design"),
    UserInterestsModel(id: 8, title: "Marketing"),
    UserInterestsModel(id: 9, title: "Lifestyle"),
    UserInterestsModel(id: 10, title: "Music"),
  ]);

  final TextEditingController pFirstNameTextController;
  final TextEditingController pLastNameTextController;
  final TextEditingController pBirthdayTextController;
  final TextEditingController pEmailTextController;

  UserDetailInputCubitImpl({
    required this.pFirstNameTextController,
    required this.pLastNameTextController,
    required this.pBirthdayTextController,
    required this.pEmailTextController,
  });

  @override
  TextEditingController? get firstNameTextController => pFirstNameTextController;

  @override
  TextEditingController? get lastNameTextController => pLastNameTextController;

  @override
  TextEditingController? get birthdayTextController => pBirthdayTextController;

  @override
  TextEditingController? get emailTextController => pEmailTextController;

  @override
  Stream<bool>? get keyboardVisibilityStream => keyboardVisibilityController.stream;

  @override
  Stream<int>? get stepperPositionStream => stepperPositionController.stream;

  @override
  Stream<String?>? get firstNameStream => firstNameController.stream;

  @override
  Stream<String?>? get lastNameStream => lastNameController.stream;

  @override
  Stream<String?>? get emailStream => emailController.stream;

  @override
  DateTime get birthdayDate => birthdayController.value;

  @override
  Stream<List<UserInterestsModel>>? get userInterestsStream => userInterestsController.stream;

  @override
  void setKeyboardVisibility(bool value) {
    keyboardVisibilityController.add(value);
  }

  @override
  void setStepperPosition(int value) {
    stepperPositionController.add(value);
  }

  @override
  void setFirstName(String? value) {
    firstNameController.add(value);
  }

  @override
  void setLastName(String? value) {
    lastNameController.add(value);
  }

  @override
  void setEmail(String? value) {
    emailController.add(value);
  }

  @override
  void setBirthday(DateTime? value) {
    if (value == null) return;

    birthdayController.add(value);
    pBirthdayTextController.text = value.formattedDate;
  }

  @override
  void submitStepOne() {
    final firstName = firstNameController.valueOrNull;

    if (firstName == null || firstName.isEmpty) {
      firstNameController.addError("Firstname can not be empty");
      return;
    }

    final lastName = lastNameController.valueOrNull;

    if (lastName == null || lastName.isEmpty) {
      lastNameController.addError("Lastname can not be empty");
      return;
    }

    final email = emailController.valueOrNull;
    if (email == null) {
      emailController.addError("Email can not be empty");
      return;
    }
    if (!email.isEmailValid) {
      emailController.addError("Email is not in correct format");
      return;
    }

    setStepperPosition(2);
  }

  @override
  void submitStepTwo() {
    setStepperPosition(3);
  }

  @override
  void submitStepThree() {
    emit(Initial());
    Navigation.popToRootAndPushNamed(RouteName.root);
  }

  @override
  void selectUserInterests(UserInterestsModel value) {
    final interest = userInterestsController.value.firstWhere(
      (element) => element.id == value.id,
    );
    interest.isSelected = !interest.isSelected;
    userInterestsController.add(userInterestsController.value);
  }

  @override
  Future<void> close() {
    keyboardVisibilityController.close();
    stepperPositionController.close();
    firstNameController.close();
    lastNameController.close();
    birthdayController.close();
    emailController.close();
    userInterestsController.close();
    return super.close();
  }
}
