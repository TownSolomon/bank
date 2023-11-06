import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: "value")
enum RateType {
  current(0),
  regularWhole(1),
  regularPiecemeal(2),
  currentRegular(3),
  agreement(4),
  notion(5),
  ;

  final int value;

  const RateType(this.value);
}
