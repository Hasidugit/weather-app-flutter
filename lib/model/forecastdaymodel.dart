import 'package:flutter_application_weather_app/model/astromodel.dart';
import 'package:flutter_application_weather_app/model/daymodel.dart';
import 'package:flutter_application_weather_app/model/hours.dart';

class ForecastDay {
  final String date;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    var hourList = json['hour'] as List;
    List<Hour> hourListItems = hourList.map((i) => Hour.fromJson(i)).toList();

    return ForecastDay(
      date: json['date'],
      day: Day.fromJson(json['day']),
      astro: Astro.fromJson(json['astro']),
      hour: hourListItems,
    );
  }
}
