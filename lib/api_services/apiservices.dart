import 'dart:convert';

import 'package:flutter_application_weather_app/model/wethermodel.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String apiKey = 'f5545d94473345fdb4c05855241805';

  static Future<Weather> fetchWeather(String query) async {
    final apiUrl =
        'https://api.weatherapi.com/v1/marine.json?key=$apiKey&q=$query&days=1';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return Weather.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load weather data');
    }
  }
}
