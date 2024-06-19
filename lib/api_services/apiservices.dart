import 'dart:convert';

import 'package:flutter_application_weather_app/model/wethermodel.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {
  static const String apiKey = '757ac092759d44bfab514028241906';

  static Future<Weather> fetchWeather(String query) async {
    final apiUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$query&days=1&aqi=yes&alerts=no';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return Weather.fromJson(json.decode(response.body));
    } else {
      Logger().e(response);
      throw Exception('Failed to load weather data');
    }
  }
}
