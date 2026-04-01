import 'package:json_annotation/json_annotation.dart';
import 'package:pharmacio_flutter_web/features/auth/data/models/login/login_response.dart';

part 'register_response.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponse {
  final User user;

  /// Backend key is 'tokens' (plural) for register, 'token' (singular) for login.
  @JsonKey(name: 'tokens')
  final Token token;

  final String message;

  RegisterResponse({
    required this.user,
    required this.token,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
