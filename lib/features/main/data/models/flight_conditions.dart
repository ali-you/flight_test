class FlightConditions {
  final String? boardingTime;
  final String? passportRequirement;
  final String? specialServices;
  final String? cancellationPolicy;

  FlightConditions({
    this.boardingTime,
    this.passportRequirement,
    this.specialServices,
    this.cancellationPolicy,
  });

  FlightConditions copyWith({
    String? boardingTime,
    String? passportRequirement,
    String? specialServices,
    String? cancellationPolicy,
  }) =>
      FlightConditions(
        boardingTime: boardingTime ?? this.boardingTime,
        passportRequirement: passportRequirement ?? this.passportRequirement,
        specialServices: specialServices ?? this.specialServices,
        cancellationPolicy: cancellationPolicy ?? this.cancellationPolicy,
      );

  factory FlightConditions.fromJson(Map<String, dynamic> json) => FlightConditions(
    boardingTime: json["boardingTime"],
    passportRequirement: json["passportRequirement"],
    specialServices: json["specialServices"],
    cancellationPolicy: json["cancellationPolicy"],
  );

  Map<String, dynamic> toJson() => {
    "boardingTime": boardingTime,
    "passportRequirement": passportRequirement,
    "specialServices": specialServices,
    "cancellationPolicy": cancellationPolicy,
  };
}
