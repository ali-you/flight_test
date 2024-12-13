import 'allowed_baggage.dart';
import 'flight_conditions.dart';

class FlightDetailsModel {
  final Map<String, String>? refundPolicy;
  final AllowedBaggage? allowedBaggage;
  final FlightConditions? flightConditions;

  FlightDetailsModel({
    this.refundPolicy,
    this.allowedBaggage,
    this.flightConditions,
  });

  FlightDetailsModel copyWith({
    Map<String, String>? refundPolicy,
    AllowedBaggage? allowedBaggage,
    FlightConditions? flightConditions,
  }) =>
      FlightDetailsModel(
        refundPolicy: refundPolicy ?? this.refundPolicy,
        allowedBaggage: allowedBaggage ?? this.allowedBaggage,
        flightConditions: flightConditions ?? this.flightConditions,
      );

  factory FlightDetailsModel.fromJson(Map<String, dynamic> json) => FlightDetailsModel(
    refundPolicy: Map.from(json["flightDetails"]["refundPolicy"]!).map((k, v) => MapEntry<String, String>(k, v)),
    allowedBaggage: json["flightDetails"]["allowedBaggage"] == null ? null : AllowedBaggage.fromJson(json["flightDetails"]["allowedBaggage"]),
    flightConditions: json["flightDetails"]["flightConditions"] == null ? null : FlightConditions.fromJson(json["flightDetails"]["flightConditions"]),
  );

  Map<String, dynamic> toJson() => {
    "refundPolicy": Map.from(refundPolicy!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "allowedBaggage": allowedBaggage?.toJson(),
    "flightConditions": flightConditions?.toJson(),
  };
}