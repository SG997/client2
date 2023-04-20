import 'package:json_annotation/json_annotation.dart';

part 'verify_otp.g.dart';

@JsonSerializable()
class VerifyingOtp {
  VerifyingOtp(this.phoneNumber, this.code);

  @JsonKey(name: "phoneNumber")
  String? phoneNumber;

  @JsonKey(name: "code")
  String? code;


  factory VerifyingOtp.fromJson(Map<String, dynamic> json) => _$VerifyingOtpFromJson(json);
  Map<String, dynamic> toJson() => _$VerifyingOtpToJson(this);
}
