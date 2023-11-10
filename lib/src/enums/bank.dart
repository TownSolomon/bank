import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: "value")
enum RateType {
  current(0, "current"),
  regularWhole(1, "regularWhole"),
  regularPiecemeal(2, "regularPiecemeal"),
  currentRegular(3, "currentRegular"),
  agreement(4, "agreement"),
  notion(5, "notion"),
  ;

  final int value;
  final String label;

  const RateType(this.value, this.label);
}

@JsonEnum(valueField: "value")
enum RateDuration {
  other(0, "other"),
  threeMonths(1, "threeMonths"),
  sixMonths(2, "sixMonths"),
  oneYears(3, "oneYears"),
  twoYears(4, "twoYears"),
  threeYears(5, "threeYears"),
  fiveYears(6, "fiveYears"),
  ;

  final int value;
  final String label;

  const RateDuration(this.value, this.label);
}
