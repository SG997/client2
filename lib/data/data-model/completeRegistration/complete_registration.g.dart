// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complete_registration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompleteRegistration _$CompleteRegistrationFromJson(
        Map<String, dynamic> json) =>
    CompleteRegistration(
      json['firstName'] as String,
      json['lastName'] as String,
      json['phoneNumber'] as String,
      json['personalId'] as String,
      json['dateOfBirth'] as int,
    );

Map<String, dynamic> _$CompleteRegistrationToJson(
        CompleteRegistration instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'personalId': instance.personalId,
      'dateOfBirth': instance.dateOfBirth,
    };
