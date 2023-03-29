import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:unimastery_mobile/presentation/components/components.dart';
import 'package:unimastery_mobile/presentation/components/dropdown/controller/dropdown_controller.dart';
import 'package:unimastery_mobile/presentation/ui/create-academy/model/create_academy_model.dart';

abstract class CreateAcademyViewModel extends ChangeNotifier {
  String? priceError;
  PageController? createAcademyPageController;
  int? currentStep;
  ImageProvider? imageProvider;
  List<CreateAcademyModel>? list;
  DropdownController? dropdownController;
  bool? isToggleCard;
  String? registrationDate;
  String? expirationDate;
  DateTime? selectRegistrationDate;
  DateTime? selectExpirationDate;
  String? workshopNameError;
  String? workshopName;
  String? workshopDescription;
  String? workshopDescriptionError;

  void setPrice(String value);
  void setPage(int index);
  void toggleCard(bool value);
  void pickImage();
  void selectedRegistrationDate(BuildContext context);
  void selectedExpirationDate(BuildContext context);
  void setWorkshopName(String value);
  void setWorkshopDescription(String value);
}

class CreateAcademyViewModelImpl extends CreateAcademyViewModel {
  String? _priceError;
  String? price;
  PageController? _createAcademyPageController;
  int? _currentStep;
  ImageProvider? _imageProvider;
  DropdownController? _dropdownController;
  bool? _isToggleCard;
  String? _registrationDate;
  String? _expirationDate;
  DateTime? _selectExpirationDate;
  DateTime? _selectRegistrationDate;
  String? _workshopError;
  String? _workshopName;
  String? _workshopDescription;
  String? _workshopDescriptionError;

  CreateAcademyViewModelImpl({
    PageController? createAcademyPageController,
    DropdownController? dropdownController,
  }) {
    _createAcademyPageController = createAcademyPageController;
    _dropdownController = dropdownController;
  }

  final List<CreateAcademyModel> _list = [
    CreateAcademyModel(text: "Workshop"),
    CreateAcademyModel(text: "Program"),
    CreateAcademyModel(text: "1 on 1"),
    CreateAcademyModel(text: "Recorded courses"),
  ];

  @override
  int? get currentStep => _currentStep;

  @override
  ImageProvider? get imageProvider => _imageProvider;

  @override
  List<CreateAcademyModel>? get list => _list;

  @override
  DropdownController? get dropdownController => _dropdownController;

  @override
  bool? get isToggleCard => _isToggleCard;

  @override
  PageController? get createAcademyPageController => _createAcademyPageController;

  @override
  String? get priceError => _priceError;

  @override
  String? get workshopNameError => _workshopError;

  @override
  String? get workshopDescriptionError => _workshopDescriptionError;

  @override
  void setWorkshopDescription(String value) => _workshopDescription = value;

  @override
  void setWorkshopName(String value) => _workshopName = value;

  @override
  String? get registrationDate => _registrationDate;

  @override
  String? get expirationDate => _expirationDate;

  @override
  void setPrice(String? value) {
    price = value;
    if (value == "0") {
      _priceError = "The workshop will be open to everyone ";
    } else {
      _priceError = null;
    }
    notifyListeners();
  }

  @override
  void setPage(int index) {
    if (!isAllowedToMoveNext(index)) return;

    _currentStep = index;

    _createAcademyPageController?.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    notifyListeners();
  }

  @override
  void pickImage() async {
    final picker = ImagePicker();

    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;

    final file = File(pickedImage.path);
    final imageProvider = FileImage(file);
    _imageProvider = imageProvider;
    notifyListeners();
  }

  bool isAllowedToMoveNext(int page) {
    if (page == 2) {
      final String? workshopName = _workshopName;

      if (workshopName == null || workshopName.isEmpty) {
        _workshopError = "Workshop name is required";
        notifyListeners();
        return false;
      }
    } else if (page == 3) {
      final String? workshopDescription = _workshopDescription;

      if (workshopDescription == null || workshopDescription.isEmpty) {
        _workshopDescriptionError = "Workshop description is required";
        notifyListeners();
        return false;
      }
    }

    return true;
  }

  @override
  void toggleCard(bool value) {
    _isToggleCard = !value;
    notifyListeners();
  }

  @override
  void selectedRegistrationDate(BuildContext context) async {
    final DateTime date = await DatePicker.show(context, selectedDay: _selectRegistrationDate);
    _selectRegistrationDate = date;
    String dateFormat = DateFormat("dd/MM/yyyy").format(date);
    setRegistrationDate(dateFormat);
  }

  @override
  void selectedExpirationDate(BuildContext context) async {
    final DateTime date = await DatePicker.show(context, selectedDay: _selectExpirationDate);
    _selectExpirationDate = date;
    String dateFormat = DateFormat("dd/MM/yyyy").format(date);
    setExpirationDate(dateFormat);
  }

  void setRegistrationDate(String date) {
    _registrationDate = date;
    notifyListeners();
  }

  void setExpirationDate(String date) {
    _expirationDate = date;
    notifyListeners();
  }
}
