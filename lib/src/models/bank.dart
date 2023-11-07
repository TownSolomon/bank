import 'package:bank/src/enums/bank.dart';
import 'package:bank/src/models/page_info.dart';
import 'package:json_annotation/json_annotation.dart';

import 'image.dart';

part 'bank.g.dart';

@JsonSerializable()
class ListBankResponse {
  PageResponse page;
  List<BankModel> list;

  ListBankResponse({
    required this.page,
    required this.list,
  });

  factory ListBankResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBankResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListBankResponseToJson(this);
}

@JsonSerializable()
class BankModel {
  int id;
  String label;
  @JsonKey(name: 'is_credible', defaultValue: false)
  bool isCredible;
  ImageModel icon;
  @JsonKey(name: 'interest_rate_groups', defaultValue: [])
  List<InterestRateGroupModel> interestRateGroups;

  BankModel({
    required this.id,
    required this.label,
    required this.isCredible,
    required this.icon,
    required this.interestRateGroups,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  Map<String, dynamic> toJson() => _$BankModelToJson(this);
}

@JsonSerializable()
class InterestRateGroupModel {
  RateType type;
  String label;
  @JsonKey(name: 'interest_rates', defaultValue: [])
  List<InterestRateModel> interestRates;

  InterestRateGroupModel({
    required this.type,
    required this.label,
    required this.interestRates,
  });

  factory InterestRateGroupModel.fromJson(Map<String, dynamic> json) =>
      _$InterestRateGroupModelFromJson(json);

  Map<String, dynamic> toJson() => _$InterestRateGroupModelToJson(this);
}

@JsonSerializable()
class InterestRateModel {
  int id;
  String label;
  double rate;

  InterestRateModel({
    required this.id,
    required this.label,
    required this.rate,
  });

  factory InterestRateModel.fromJson(Map<String, dynamic> json) =>
      _$InterestRateModelFromJson(json);

  Map<String, dynamic> toJson() => _$InterestRateModelToJson(this);
}
