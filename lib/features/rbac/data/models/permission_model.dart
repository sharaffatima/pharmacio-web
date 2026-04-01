import 'package:json_annotation/json_annotation.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  final int id;
  final String name;
  final String? description;

  PermissionModel({required this.id, required this.name, this.description});

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);
}
