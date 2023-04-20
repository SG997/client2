
import 'package:json_annotation/json_annotation.dart';

import '../user/user-entity.dart';


part 'authenticate.g.dart';

@JsonSerializable()
class AuthenticateVM {

  AuthenticateVM(this.user, this.token);

  @JsonKey(name: "user")
  UserEntity user;

  @JsonKey(name: "token")
  String token;



  factory AuthenticateVM.fromJson(Map<String, dynamic> json) =>
      _$AuthenticateVMFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticateVMToJson(this);
}