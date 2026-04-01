// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleModel _$RoleModelFromJson(Map<String, dynamic> json) => RoleModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  permissions: (json['permissions'] as List<dynamic>?)
      ?.map((e) => PermissionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RoleModelToJson(RoleModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'permissions': instance.permissions?.map((e) => e.toJson()).toList(),
};
