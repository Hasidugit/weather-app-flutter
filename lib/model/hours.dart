class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;
  final double sigHtMt;
  final double swellHtMt;
  final double swellHtFt;
  final double swellDir;
  final String swellDir16Point;
  final double swellPeriodSecs;
  final double waterTempC;
  final double waterTempF;

  Hour({
    required this.timeEpoch,
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
    required this.sigHtMt,
    required this.swellHtMt,
    required this.swellHtFt,
    required this.swellDir,
    required this.swellDir16Point,
    required this.swellPeriodSecs,
    required this.waterTempC,
    required this.waterTempF,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      timeEpoch: json['time_epoch'] ?? 0,
      time: json['time'] ?? '',
      tempC: (json['temp_c'] ?? 0.0).toDouble(),
      tempF: (json['temp_f'] ?? 0.0).toDouble(),
      isDay: json['is_day'] ?? 0,
      condition: Condition.fromJson(json['condition'] ?? {}),
      windMph: (json['wind_mph'] ?? 0.0).toDouble(),
      windKph: (json['wind_kph'] ?? 0.0).toDouble(),
      windDegree: json['wind_degree'] ?? 0,
      windDir: json['wind_dir'] ?? '',
      pressureMb: (json['pressure_mb'] ?? 0.0).toDouble(),
      pressureIn: (json['pressure_in'] ?? 0.0).toDouble(),
      precipMm: (json['precip_mm'] ?? 0.0).toDouble(),
      precipIn: (json['precip_in'] ?? 0.0).toDouble(),
      humidity: json['humidity'] ?? 0,
      cloud: json['cloud'] ?? 0,
      feelslikeC: (json['feelslike_c'] ?? 0.0).toDouble(),
      feelslikeF: (json['feelslike_f'] ?? 0.0).toDouble(),
      windchillC: (json['windchill_c'] ?? 0.0).toDouble(),
      windchillF: (json['windchill_f'] ?? 0.0).toDouble(),
      heatindexC: (json['heatindex_c'] ?? 0.0).toDouble(),
      heatindexF: (json['heatindex_f'] ?? 0.0).toDouble(),
      dewpointC: (json['dewpoint_c'] ?? 0.0).toDouble(),
      dewpointF: (json['dewpoint_f'] ?? 0.0).toDouble(),
      visKm: (json['vis_km'] ?? 0.0).toDouble(),
      visMiles: (json['vis_miles'] ?? 0.0).toDouble(),
      gustMph: (json['gust_mph'] ?? 0.0).toDouble(),
      gustKph: (json['gust_kph'] ?? 0.0).toDouble(),
      uv: json['uv'] ?? 0.0,
      sigHtMt: (json['sig_ht_mt'] ?? 0.0).toDouble(),
      swellHtMt: (json['swell_ht_mt'] ?? 0.0).toDouble(),
      swellHtFt: (json['swell_ht_ft'] ?? 0.0).toDouble(),
      swellDir: json['swell_dir'] ?? 0.0,
      swellDir16Point: json['swell_dir_16_point'] ?? '',
      swellPeriodSecs: (json['swell_period_secs'] ?? 0.0).toDouble(),
      waterTempC: (json['water_temp_c'] ?? 0.0).toDouble(),
      waterTempF: (json['water_temp_f'] ?? 0.0).toDouble(),
    );
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] ?? '',
      icon: json['icon'] ?? '',
      code: json['code'] ?? 0,
    );
  }
}
