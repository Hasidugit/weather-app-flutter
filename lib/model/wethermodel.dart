import 'package:flutter_application_weather_app/model/forecastdaymodel.dart';
import 'package:flutter_application_weather_app/model/locationmodel.dart'; // Make sure this path is correct

class Weather {
  final Location location;
  final List<ForecastDay> forecastDays;

  Weather({required this.location, required this.forecastDays});

  factory Weather.fromJson(Map<String, dynamic> json) {
    var list = json['forecast']['forecastday'] as List;
    List<ForecastDay> forecastDays =
        list.map((i) => ForecastDay.fromJson(i)).toList();

    return Weather(
      location: Location.fromJson(json['location']),
      forecastDays: forecastDays,
    );
  }
}
