enum FlightClasses {
  none(null),
  business("بیزینس"),
  economy("اکونومی");

  final String? name;

  const FlightClasses(this.name);

  static FlightClasses fromName(String name) {
    try {
      return FlightClasses.values.firstWhere((e) => e.name == name);
    } catch (e) {
      return FlightClasses.none;
    }
  }
}
