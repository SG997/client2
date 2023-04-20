// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authenticate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticateVM _$AuthenticateVMFromJson(Map<String, dynamic> json) =>
    AuthenticateVM(
      UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      json['token'] as String,
    );

Map<String, dynamic> _$AuthenticateVMToJson(AuthenticateVM instance) =>
    <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
    };
