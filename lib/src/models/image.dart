import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable()
class ImageModel {
  ImageUrlModel url;
  int width;
  int height;

  ImageModel({
    required this.url,
    required this.width,
    required this.height,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class ImageUrlModel {
  String small;
  String medium;
  String large;
  String original;

  ImageUrlModel({
    required this.small,
    required this.medium,
    required this.large,
    required this.original,
  });

  factory ImageUrlModel.fromJson(Map<String, dynamic> json) =>
      _$ImageUrlModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageUrlModelToJson(this);
}
