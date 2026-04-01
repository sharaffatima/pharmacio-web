import 'package:json_annotation/json_annotation.dart';

import 'permission_model.dart';

part 'role_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RoleModel {
  final int id;
  final String name;
  final List<PermissionModel>? permissions;

  RoleModel({required this.id, required this.name, this.permissions});

  factory RoleModel.fromJson(Map<String, dynamic> json) =>
      _$RoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoleModelToJson(this);
}
