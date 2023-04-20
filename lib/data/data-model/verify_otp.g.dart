// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyingOtp _$VerifyingOtpFromJson(Map<String, dynamic> json) => VerifyingOtp(
      json['phoneNumber'] as String?,
      json['code'] as String?,
    );

Map<String, dynamic> _$VerifyingOtpToJson(VerifyingOtp instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'code': instance.code,
    };
