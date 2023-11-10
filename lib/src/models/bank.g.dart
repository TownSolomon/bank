// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListBankResponse _$ListBankResponseFromJson(Map<String, dynamic> json) =>
    ListBankResponse(
      page: PageResponse.fromJson(json['page'] as Map<String, dynamic>),
      list: (json['list'] as List<dynamic>)
          .map((e) => BankModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListBankResponseToJson(ListBankResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'list': instance.list,
    };

ListInterestRateResponse _$ListInterestRateResponseFromJson(
        Map<String, dynamic> json) =>
    ListInterestRateResponse(
      page: PageResponse.fromJson(json['page'] as Map<String, dynamic>),
      list: (json['list'] as List<dynamic>)
          .map((e) => InterestRateItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListInterestRateResponseToJson(
        ListInterestRateResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'list': instance.list,
    };

InterestRateItemModel _$InterestRateItemModelFromJson(
        Map<String, dynamic> json) =>
    InterestRateItemModel(
      interestRate: InterestRateModel.fromJson(
          json['interest_rate'] as Map<String, dynamic>),
      bank: BankModel.fromJson(json['bank'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InterestRateItemModelToJson(
        InterestRateItemModel instance) =>
    <String, dynamic>{
      'interest_rate': instance.interestRate,
      'bank': instance.bank,
    };

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      id: json['id'] as int,
      label: json['label'] as String,
      isCredible: json['is_credible'] as bool? ?? false,
      icon: ImageModel.fromJson(json['icon'] as Map<String, dynamic>),
      interestRateGroups: (json['interest_rate_groups'] as List<dynamic>?)
              ?.map((e) =>
                  InterestRateGroupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'is_credible': instance.isCredible,
      'icon': instance.icon,
      'interest_rate_groups': instance.interestRateGroups,
    };

InterestRateGroupModel _$InterestRateGroupModelFromJson(
        Map<String, dynamic> json) =>
    InterestRateGroupModel(
      type: $enumDecode(_$RateTypeEnumMap, json['type']),
      label: json['label'] as String,
      interestRates: (json['interest_rates'] as List<dynamic>?)
              ?.map(
                  (e) => InterestRateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$InterestRateGroupModelToJson(
        InterestRateGroupModel instance) =>
    <String, dynamic>{
      'type': _$RateTypeEnumMap[instance.type]!,
      'label': instance.label,
      'interest_rates': instance.interestRates,
    };

const _$RateTypeEnumMap = {
  RateType.current: 0,
  RateType.regularWhole: 1,
  RateType.regularPiecemeal: 2,
  RateType.currentRegular: 3,
  RateType.agreement: 4,
  RateType.notion: 5,
};

InterestRateModel _$InterestRateModelFromJson(Map<String, dynamic> json) =>
    InterestRateModel(
      id: json['id'] as int,
      label: json['label'] as String,
      type: $enumDecode(_$RateTypeEnumMap, json['type']),
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$InterestRateModelToJson(InterestRateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': _$RateTypeEnumMap[instance.type]!,
      'rate': instance.rate,
    };
