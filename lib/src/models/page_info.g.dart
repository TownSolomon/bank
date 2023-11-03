// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageRequest _$PageRequestFromJson(Map<String, dynamic> json) => PageRequest(
      current: json['current'] as int? ?? 1,
      size: json['size'] as int? ?? 10,
    );

Map<String, dynamic> _$PageRequestToJson(PageRequest instance) =>
    <String, dynamic>{
      'current': instance.current,
      'size': instance.size,
    };

PageResponse _$PageResponseFromJson(Map<String, dynamic> json) => PageResponse(
      hasMore: json['has_more'] as bool? ?? false,
    );

Map<String, dynamic> _$PageResponseToJson(PageResponse instance) =>
    <String, dynamic>{
      'has_more': instance.hasMore,
    };
