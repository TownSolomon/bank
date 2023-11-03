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

BankModel _$BankModelFromJson(Map<String, dynamic> json) => BankModel(
      id: json['id'] as int,
      label: json['label'] as String,
      isCredible: json['is_credible'] as bool? ?? false,
      icon: ImageModel.fromJson(json['icon'] as Map<String, dynamic>),
      interestRates: (json['interest_rates'] as List<dynamic>?)
              ?.map(
                  (e) => InterestRateModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BankModelToJson(BankModel instance) => <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'is_credible': instance.isCredible,
      'icon': instance.icon,
      'interest_rates': instance.interestRates,
    };

InterestRateModel _$InterestRateModelFromJson(Map<String, dynamic> json) =>
    InterestRateModel(
      id: json['id'] as int,
      label: json['label'] as String,
      rate: (json['rate'] as num).toDouble(),
    );

Map<String, dynamic> _$InterestRateModelToJson(InterestRateModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'rate': instance.rate,
    };