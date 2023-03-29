enum PersonalInformationType {
  firstName("Noam", "Last Name"),
  lastName("Altshuler-Cohen", "First Name"),
  birthday("12-12-1986", "Birthday"),
  number("+972-523-449900", "Phone Number"),
  email("noamiko86@gmail.com", "Email");

  final String titleText;
  final String headerText;
  const PersonalInformationType(this.titleText, this.headerText);
}

class PersonalInformationItem {
  final PersonalInformationType type;

  PersonalInformationItem({required this.type});

  String get titleText {
    return type.titleText;
  }

  String get headText {
    return type.headerText;
  }
}

class PersonalInformationModel {
  String titleText;
  String headText;

  PersonalInformationModel(this.titleText, this.headText);
}
