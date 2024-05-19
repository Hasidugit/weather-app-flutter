class Day {
  final double maxTempC;
  final double minTempC;
  final double avgTempC;
  final double maxWindKph;
  final double totalPrecipMm;
  final double avgVisKm;
  final double avgHumidity;
  final String conditionText;
  final String conditionIcon;
  final double uv;
  final double totalSnowCm;

  Day({
    required this.maxTempC,
    required this.minTempC,
    required this.avgTempC,
    required this.maxWindKph,
    required this.totalPrecipMm,
    required this.avgVisKm,
    required this.avgHumidity,
    required this.conditionText,
    required this.conditionIcon,
    required this.uv,
    required this.totalSnowCm,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTempC: json['maxtemp_c'],
      minTempC: json['mintemp_c'],
      avgTempC: json['avgtemp_c'],
      maxWindKph: json['maxwind_kph'],
      totalPrecipMm: json['totalprecip_mm'],
      avgVisKm: json['avgvis_km'],
      avgHumidity: json['avghumidity'],
      conditionText: json['condition']['text'],
      conditionIcon: json['condition']['icon'],
      uv: json['uv'],
      totalSnowCm: json["totalsnow_cm"],
    );
  }
}
