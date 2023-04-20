import 'package:json_annotation/json_annotation.dart';

part 'complete_registration.g.dart';

@JsonSerializable()
class CompleteRegistration {

  CompleteRegistration(this.firstName, this.lastName, this.phoneNumber,
      this.personalId, this.dateOfBirth);

  @JsonKey(name: "firstName")
  String firstName;

  @JsonKey(name: "lastName")
  String lastName;

  @JsonKey(name: "phoneNumber")
  String phoneNumber;

  @JsonKey(name: "personalId")
  String personalId;

  @JsonKey(name: "dateOfBirth")
  int dateOfBirth;


  factory CompleteRegistration.fromJson(Map<String, dynamic> json) =>
      _$CompleteRegistrationFromJson(json);

  Map<String, dynamic> toJson() => _$CompleteRegistrationToJson(this);
}