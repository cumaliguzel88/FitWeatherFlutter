class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json["name"],
      temperature:
          json["main"]["temp"].toDouble(), // Burada toDouble() çağrısı var
      mainCondition: json["weather"][0]["main"],
    );
  }
}
