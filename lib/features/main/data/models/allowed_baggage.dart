import 'carry_on_baggage.dart';
import 'checked_baggage.dart';

class AllowedBaggage {
  final CheckedBaggage? checkedBaggage;
  final CarryOnBaggage? carryOnBaggage;
  final String? additionalFees;

  AllowedBaggage({
    this.checkedBaggage,
    this.carryOnBaggage,
    this.additionalFees,
  });

  AllowedBaggage copyWith({
    CheckedBaggage? checkedBaggage,
    CarryOnBaggage? carryOnBaggage,
    String? additionalFees,
  }) =>
      AllowedBaggage(
        checkedBaggage: checkedBaggage ?? this.checkedBaggage,
        carryOnBaggage: carryOnBaggage ?? this.carryOnBaggage,
        additionalFees: additionalFees ?? this.additionalFees,
      );

  factory AllowedBaggage.fromJson(Map<String, dynamic> json) => AllowedBaggage(
        checkedBaggage: json["checkedBaggage"] == null
            ? null
            : CheckedBaggage.fromJson(json["checkedBaggage"]),
        carryOnBaggage: json["carryOnBaggage"] == null
            ? null
            : CarryOnBaggage.fromJson(json["carryOnBaggage"]),
        additionalFees: json["additionalFees"],
      );

  Map<String, dynamic> toJson() => {
        "checkedBaggage": checkedBaggage?.toJson(),
        "carryOnBaggage": carryOnBaggage?.toJson(),
        "additionalFees": additionalFees,
      };
}
