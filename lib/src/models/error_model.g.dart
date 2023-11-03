// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      code: json['code'] as int,
      message: json['message'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'description': instance.description,
    };
