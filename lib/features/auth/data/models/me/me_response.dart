import 'package:json_annotation/json_annotation.dart';

part 'me_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MeResponse {
  final int? id;
  final String? username;
  final String? email;

  @JsonKey(name: 'first_name')
  final String? firstName;

  @JsonKey(name: 'last_name')
  final String? lastName;

  final List<String>? roles;

  @JsonKey(name: 'phone_number')
  final String? phoneNumber;

  @JsonKey(name: 'is_active')
  final bool? isActive;

  @JsonKey(name: 'date_joined')
  final DateTime? dateJoined;

  MeResponse({
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.roles,
    this.phoneNumber,
    this.isActive,
    this.dateJoined,
  });

  factory MeResponse.fromJson(Map<String, dynamic> json) =>
      _$MeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MeResponseToJson(this);
}
