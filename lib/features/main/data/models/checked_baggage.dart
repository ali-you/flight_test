class CheckedBaggage {
  final String? weight;
  final String? note;

  CheckedBaggage({
    this.weight,
    this.note,
  });

  CheckedBaggage copyWith({
    String? weight,
    String? note,
  }) =>
      CheckedBaggage(
        weight: weight ?? this.weight,
        note: note ?? this.note,
      );

  factory CheckedBaggage.fromJson(Map<String, dynamic> json) => CheckedBaggage(
    weight: json["weight"],
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "weight": weight,
    "note": note,
  };
}
