import '../enums/currencies.dart';
import '../enums/flight_classes.dart';

class FlightModel {
  final int? id;
  final String? flightName;
  final String? flightNumber;
  final FlightClasses? flightClass;
  final String? flightLogo;
  final String? origin;
  final String? destination;
  final String? originAirport;
  final String? destinationAirport;
  final DateTime? startTime;
  final DateTime? endTime;
  final int? remainTickets;
  final int? price;
  final Currencies? currency;

  FlightModel({
    this.id,
    this.flightName,
    this.flightNumber,
    this.flightClass,
    this.flightLogo,
    this.origin,
    this.destination,
    this.originAirport,
    this.destinationAirport,
    this.startTime,
    this.endTime,
    this.remainTickets,
    this.price,
    this.currency,
  });

  FlightModel copyWith({
    int? id,
    String? flightName,
    String? flightNumber,
    FlightClasses? flightClass,
    String? flightLogo,
    String? origin,
    String? destination,
    String? originAirport,
    String? destinationAirport,
    DateTime? startTime,
    DateTime? endTime,
    int? remainTickets,
    int? price,
    Currencies? currency,
  }) =>
      FlightModel(
        id: id ?? this.id,
        flightName: flightName ?? this.flightName,
        flightNumber: flightNumber ?? this.flightNumber,
        flightClass: flightClass ?? this.flightClass,
        flightLogo: flightLogo ?? this.flightLogo,
        origin: origin ?? this.origin,
        destination: destination ?? this.destination,
        originAirport: originAirport ?? this.originAirport,
        destinationAirport: destinationAirport ?? this.destinationAirport,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        remainTickets: remainTickets ?? this.remainTickets,
        price: price ?? this.price,
        currency: currency ?? this.currency,
      );

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
        id: json["id"],
        flightName: json["flightName"],
        flightNumber: json["flightNumber"],
        flightClass: FlightClasses.fromName(json["flightClass"]),
        flightLogo: json["flightLogo"],
        origin: json["origin"],
        destination: json["destination"],
        originAirport: json["originAirport"],
        destinationAirport: json["destinationAirport"],
        startTime: _parseDateTime(json["startTime"]),
        endTime: _parseDateTime(json["endTime"]),
        remainTickets: json["remainTickets"],
        price: json["price"],
        currency: Currencies.fromName(json["currency"]),
      );

  static DateTime? _parseDateTime(String? dateString) {
    if (dateString == null) return null;

    try {
      return DateTime.parse(dateString);
    } catch (e) {
      final fixedDate = dateString.replaceAllMapped(
        RegExp(r"(\d{4})-(\d{1,2})-(\d{1,2})"),
        (match) {
          final year = match.group(1);
          final month = match.group(2)?.padLeft(2, '0');
          final day = match.group(3)?.padLeft(2, '0');
          return "$year-$month-$day";
        },
      );

      try {
        return DateTime.parse(fixedDate);
      } catch (_) {
        return null;
      }
    }
  }

  @override
  String toString() {
    return 'FlightModel{id: $id, flightName: $flightName, flightNumber: $flightNumber, flightClass: $flightClass, flightLogo: $flightLogo, origin: $origin, destination: $destination, originAirport: $originAirport, destinationAirport: $destinationAirport, startTime: $startTime, endTime: $endTime, remainTickets: $remainTickets, price: $price, currency: $currency}';
  }
}
