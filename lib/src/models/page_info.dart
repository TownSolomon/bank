import 'package:json_annotation/json_annotation.dart';

part 'page_info.g.dart';

@JsonSerializable()
class PageRequest {
  @JsonKey(name: 'current', defaultValue: 1)
  int current;

  @JsonKey(name: 'size', defaultValue: 10)
  int size;

  PageRequest({
    required this.current,
    required this.size,
  });

  PageRequest nextPage() {
    current = current + 1;
    return this;
  }

  factory PageRequest.fromJson(Map<String, dynamic> json) =>
      _$PageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PageRequestToJson(this);
}

@JsonSerializable()
class PageResponse {
  @JsonKey(name: 'has_more', defaultValue: false)
  bool hasMore;

  PageResponse({
    required this.hasMore,
  });

  factory PageResponse.fromJson(Map<String, dynamic> json) =>
      _$PageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PageResponseToJson(this);
}
