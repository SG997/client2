import 'package:json_annotation/json_annotation.dart';

part 'user-entity.g.dart';

@JsonSerializable()
class UserEntity {

  UserEntity(this.id, this.firstName, this.lastName, this.phone,
      this.personalId, this.dateOfBirth);

  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "firstName")
  String? firstName;

  @JsonKey(name: "lastName")
  String? lastName;

  @JsonKey(name: "phone")
  String phone;

  @JsonKey(name: "personalId")
  String? personalId;

  @JsonKey(name: "dateOfBirth")
  int? dateOfBirth;

  @JsonKey(name: "userStatus")
  UserStatus? userStatus;


  /*@JsonKey(name: "createdAt")
  Date createdAt;*/


  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}

enum UserStatus {

  @JsonKey(name: "OTP")
  OTP('0'),

  @JsonKey(name: "ACTIVE")
  ACTIVE('1');

  const UserStatus(this.value);
  final String value;
  static UserStatus getByValue(num i){
    return UserStatus.values.firstWhere((x) => x.value == i);
  }
}
