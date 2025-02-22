enum WindSpeed {
  km("Km/h"),
  mph("Mph"),
  m("M/s");

  const WindSpeed(this.speedUnit);
  final String speedUnit;
}
