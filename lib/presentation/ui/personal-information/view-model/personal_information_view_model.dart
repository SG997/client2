import 'package:flutter/cupertino.dart';
import 'package:unimastery_mobile/presentation/ui/personal-information/model/personal_information_model.dart';

abstract class PersonalInformationViewModel extends ChangeNotifier {
  List<PersonalInformationModel>? personalInformation;

  void updatePersonalInformation();
}

class PersonalInformationViewModelImpl extends PersonalInformationViewModel {
  final List<PersonalInformationModel> _personalInformation = [
    PersonalInformationModel("Noam", "Last Name"),
    PersonalInformationModel("Altshuler-Cohen", "First Name"),
    PersonalInformationModel("12-12-1986", "Birthday"),
    PersonalInformationModel("+972-523-449900", "Phone Number"),
    PersonalInformationModel("noamiko86@gmail.com", "Email"),
  ];

  @override
  List<PersonalInformationModel> get personalInformation => _personalInformation;

  @override
  void updatePersonalInformation() {
    notifyListeners();
  }
}
