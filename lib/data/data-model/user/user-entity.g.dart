// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      json['id'] as String,
      json['firstName'] as String?,
      json['lastName'] as String?,
      json['phone'] as String,
      json['personalId'] as String?,
      json['dateOfBirth'] as int?,
    )..userStatus =
        $enumDecodeNullable(_$UserStatusEnumMap, json['userStatus']);

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'personalId': instance.personalId,
      'dateOfBirth': instance.dateOfBirth,
      'userStatus': _$UserStatusEnumMap[instance.userStatus],
    };

const _$UserStatusEnumMap = {
  UserStatus.OTP: 'OTP',
  UserStatus.ACTIVE: 'ACTIVE',
};
