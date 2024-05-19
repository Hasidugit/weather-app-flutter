// import 'package:flutter/material.dart';
// import 'package:flutter_application_weather_app/api_services/apiservices.dart';
// import 'package:flutter_application_weather_app/model/wethermodel.dart';
// import 'package:flutter_application_weather_app/screen/widget/customer_text.dart';
// import 'package:flutter_application_weather_app/screen/widget/list_sizebox.dart';
// import 'package:flutter_application_weather_app/screen/widget/meter.dart';
// import 'package:flutter_application_weather_app/screen/widget/thermometer.dart';
// import 'package:flutter_application_weather_app/screen/widget/weather_hourly_list.dart'; // Import the new widget

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   late Future<Weather> futureWeather;

//   @override
//   void initState() {
//     super.initState();
//     futureWeather = ApiService.fetchWeather();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Colombo Weather Forecast'),
//       ),
//       body: Center(
//         child: FutureBuilder<Weather>(
//           future: futureWeather,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return buildWeatherInfo(snapshot.data!);
//             } else if (snapshot.hasError) {
//               return Text("${snapshot.error}");
//             }
//             return const CircularProgressIndicator();
//           },
//         ),
//       ),
//     );
//   }

//   String selectImage(String condition) {
//     switch (condition) {
//       case "Torrential rain shower":
//         return "images/vecteezy_3d-weather-icon-day-with-rain_24825182.png";
//       case "Moderate or heavy rain shower":
//         return "images/vecteezy_3d-weather-icon-moderate-rain_24825182.png";
//       default:
//         return ""; // Default image if condition is not matched
//     }
//   }

//   Widget buildWeatherInfo(Weather weather) {
//     final hours = weather.forecastDays[0].hour;
//     final currentTime = DateTime.now().toIso8601String().substring(11, 16); // Adjust to your current time format

//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 470,
//             width: MediaQuery.sizeOf(context).width * 0.95,
//             decoration: BoxDecoration(
//               color: Colors.blueAccent,
//               border: Border.all(
//                 color: const Color.fromARGB(255, 33, 74, 171),
//                 width: 2.0,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//               gradient: const LinearGradient(colors: [
//                 Colors.indigo,
//                 Colors.indigo,
//                 Color.fromARGB(255, 70, 109, 181),
//               ]),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 2.0,
//                   offset: Offset(2.0, 2.0),
//                 )
//               ],
//             ),
//             child: Stack(
//               children: [
//                 Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Icon(
//                           Icons.location_on_outlined,
//                           size: 30,
//                         ),
//                         const SizedBox(width: 10),
//                         CustomerText(
//                           title: weather.location.name.toString(),
//                           color2: Colors.white,
//                         ),
//                       ],
//                     ),
//                     Image.asset(
//                       selectImage(weather.forecastDays[0].day.conditionText),
//                       width: 200,
//                       height: 200,
//                     ),
//                     CustomerText(
//                       title: ' ${weather.forecastDays[0].day.avgTempC}°C',
//                       fontSize: 42,
//                       color1: Colors.blue,
//                       color2: Colors.white70,
//                     ),
//                     CustomerText(
//                       title: weather.forecastDays[0].day.conditionText,
//                       strokeWidth: 1,
//                       fontSize: 18,
//                     ),
//                     Row(
//                       children: [
//                         ThermometerWidget(
//                           max: weather.forecastDays[0].day.maxTempC,
//                           min: weather.forecastDays[0].day.minTempC,
//                         ),
//                         const Spacer(),
//                         Image.network(
//                           width: 150,
//                           height: 120,
//                           "https://cdn3.iconfinder.com/data/icons/mother-earth-day-6/64/Wind_turbine-sustainability-green_energy-ecology-environment-512.png",
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             const CustomerText(
//                               title: "Wind :",
//                               fontSize: 15,
//                               color2: Colors.white,
//                               strokeWidth: 1,
//                             ),
//                             CustomerText(
//                               title: "${weather.forecastDays[0].day.maxWindKph}Kmh",
//                               fontSize: 14,
//                               color2: Colors.white,
//                               strokeWidth: 2,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 15),
//           Container(
//             height: 110,
//             width: MediaQuery.sizeOf(context).width * 0.95,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 198, 202, 208),
//               border: Border.all(
//                 color: const Color.fromARGB(255, 33, 74, 171),
//                 width: 1.0,
//               ),
//               borderRadius: BorderRadius.circular(10.0),
//               gradient: const LinearGradient(colors: [
//                 Colors.indigo,
//                 Colors.indigo,
//                 Color.fromARGB(255, 70, 109, 181),
//               ]),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 2.0,
//                   offset: Offset(2.0, 2.0),
//                 ),
//               ],
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CusMeter(
//                   count: "${weather.forecastDays[0].day.avgHumidity} %",
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         SizedBox(
//                           height: 52,
//                           width: 60,
//                           child: Image.network("https://cdn-icons-png.flaticon.com/512/8179/8179067.png"),
//                         ),
//                         CustomerText(
//                           title: " SunRise:  ${weather.forecastDays[0].astro.sunrise}",
//                           fontSize: 15,
//                           color2: Colors.white,
//                           strokeWidth: 1,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         SizedBox(
//                           height: 52,
//                           width: 60,
//                           child: Image.network("https://cdn-icons-png.flaticon.com/512/414/414944.png"),
//                         ),
//                         CustomerText(
//                           title: " MoonRise:  ${weather.forecastDays[0].astro.moonrise}",
//                           fontSize: 15,
//                           color2: Colors.white,
//                           strokeWidth: 1,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Image.network(
//             'https:${weather.forecastDays[0].day.conditionIcon}',
//             width: 64,
//             height: 64,
//           ),
//           const Text(
//             'Hourly Forecast:',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           WeatherHourlyList(hours: hours, currentTime: currentTime),
//         ],
//       ),
//     );
//   }
// }
