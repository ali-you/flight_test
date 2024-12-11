enum Currencies {
  none(null),
  toman("تومان");

  final String? name;

  const Currencies(this.name);

  static Currencies fromName(String name) {
    try {
      return Currencies.values.firstWhere((e) => e.name == name);
    } catch (e) {
      return Currencies.none;
    }
  }
}
