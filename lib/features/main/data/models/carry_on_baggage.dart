class CarryOnBaggage {
  final String? weight;
  final String? dimensions;
  final String? note;

  CarryOnBaggage({
    this.weight,
    this.dimensions,
    this.note,
  });

  CarryOnBaggage copyWith({
    String? weight,
    String? dimensions,
    String? note,
  }) =>
      CarryOnBaggage(
        weight: weight ?? this.weight,
        dimensions: dimensions ?? this.dimensions,
        note: note ?? this.note,
      );

  factory CarryOnBaggage.fromJson(Map<String, dynamic> json) => CarryOnBaggage(
    weight: json["weight"],
    dimensions: json["dimensions"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "weight": weight,
    "dimensions": dimensions,
    "note": note,
  };
}