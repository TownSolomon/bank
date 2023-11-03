// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      url: ImageUrlModel.fromJson(json['url'] as Map<String, dynamic>),
      width: json['width'] as int,
      height: json['height'] as int,
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };

ImageUrlModel _$ImageUrlModelFromJson(Map<String, dynamic> json) =>
    ImageUrlModel(
      small: json['small'] as String,
      medium: json['medium'] as String,
      large: json['large'] as String,
      original: json['original'] as String,
    );

Map<String, dynamic> _$ImageUrlModelToJson(ImageUrlModel instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
      'original': instance.original,
    };
