import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable()
class ErrorResponse {
  int code;
  String message;
  String description;

  ErrorResponse({
    required this.code,
    required this.message,
    required this.description,
  });

  static ErrorResponse fromError(DioException e) {
    if (e.response != null && e.response!.data is Map<String, dynamic>) {
      return ErrorResponse.fromJson(e.response!.data);
    }

    return ErrorResponse(
      code: 1,
      message: e.message ?? "",
      description: "",
    );
  }

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}
