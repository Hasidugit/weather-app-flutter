import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/api_services/apiservices.dart';
import 'package:flutter_application_weather_app/fuctions/selectimage.dart';
import 'package:flutter_application_weather_app/model/wethermodel.dart';
import 'package:flutter_application_weather_app/screen/dayweather.dart';
import 'package:flutter_application_weather_app/screen/hourlyscreen.dart';
import 'package:flutter_application_weather_app/screen/widget/customer_text.dart';
import 'package:flutter_application_weather_app/screen/widget/list_sizebox.dart';
import 'package:flutter_application_weather_app/screen/widget/meter.dart';
import 'package:flutter_application_weather_app/screen/widget/thermometer.dart';
import 'package:logger/logger.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller =
      TextEditingController(text: 'Sri Lanka');
  Weather? _weather;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchWeather('Sri Lanka');
  }

  void _fetchWeather(String query) async {
    setState(() {
      _isLoading = true;
    });
    try {
      final weather = await ApiService.fetchWeather(query);
      Logger().f('Weather fetched successfully: $weather');
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      Logger().e(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : _weather != null
                ? buildWeatherInfo(_weather!)
                : const Text('Enter a country to search weather'),
      ),
    );
  }

  Widget buildWeatherInfo(Weather weather) {
    final hours = weather.forecastDays[0].hour;
    final currentTime = DateTime.now().toIso8601String().substring(11, 16);

    DateTime now = DateTime.now();
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://th.bing.com/th/id/OIP.yfDr9DMCUUQNJgGTmnPq3AHaJQ?w=600&h=750&rs=1&pid=ImgDetMain"),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: const BoxDecoration(color: Colors.black12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 20, top: 10, bottom: 10),
                        child: Center(
                          child: TextField(
                            cursorColor:
                                Colors.white, // Set cursor color to white
                            style: const TextStyle(
                                backgroundColor: Colors.black38,
                                color: Colors.white,
                                fontSize: 18.0), // Set text color and size
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: 'Search country...',
                              hintStyle: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.5)), // Set hint text color
                              border: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.white), // Set border side color
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .white), // Set enabled border color
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors
                                        .white), // Set focused border color
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25)),
                              ),
                            ),
                            onSubmitted: (value) {
                              if (value.isNotEmpty) {
                                _fetchWeather(value);
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
              ),
              Container(
                height: 470,
                width: MediaQuery.of(context).size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 44, 43, 94)
                          .withOpacity(0.5), // Shadow color with opacity
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                    stops: const [
                      0.0,
                      0.5,
                      1.0
                    ], // Adjust the stops as needed for gradient effect
                  ),
                  border: Border.all(
                    color: const Color.fromARGB(255, 33, 74, 171),
                    width: 2.0,
                  ),
                ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 30,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 10),
                            CustomerText(
                              title: weather.location.name.toString(),
                              color2: Colors.white,
                            ),
                          ],
                        ),
                        Image.asset(
                          selectImage(
                              weather.forecastDays[0].day.conditionText),
                          width: 200,
                          height: 200,
                        ),
                        CustomerText(
                          title: ' ${weather.forecastDays[0].day.avgTempC}°C',
                          fontSize: 42,
                          color1: Colors.blue,
                          color2: Colors.white70,
                        ),
                        CustomerText(
                          title: weather.forecastDays[0].day.conditionText,
                          color1: Colors.blue,
                          color2: Colors.white70,
                          strokeWidth: 1,
                          fontSize: 18,
                        ),
                        Row(
                          children: [
                            ThermometerWidget(
                              max: weather.forecastDays[0].day.maxTempC,
                              min: weather.forecastDays[0].day.minTempC,
                            ),
                            const Spacer(),
                            Image.network(
                              "https://cdn3.iconfinder.com/data/icons/mother-earth-day-6/64/Wind_turbine-sustainability-green_energy-ecology-environment-512.png",
                              width: 150,
                              height: 120,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const CustomerText(
                                  title: "Wind :",
                                  fontSize: 15,
                                  color2: Colors.white,
                                  strokeWidth: 1,
                                ),
                                CustomerText(
                                  title:
                                      "${weather.forecastDays[0].day.maxWindKph}Kmh",
                                  fontSize: 14,
                                  color2: Colors.white,
                                  strokeWidth: 2,
                                ),
                                CustomerText(
                                  title: weather
                                      .forecastDays[0].hour[now.hour].windDir,
                                  fontSize: 14,
                                  color2: Colors.white,
                                  strokeWidth: 2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DayWeather(
                          weather: weather,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width * 0.95,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(
                          255, 24, 63, 122), // Base color of the container
                      borderRadius:
                          BorderRadius.circular(10.0), // Rounded corners
                      border: Border.all(
                        color: const Color.fromARGB(
                            255, 112, 122, 144), // Border color
                        width: 1.0,
                      ),
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 62, 64, 76)
                              .withOpacity(0.5), // Adjust opacity as needed
                          const Color.fromARGB(255, 39, 40, 47)
                              .withOpacity(0.5), // Adjust opacity as needed
                          const Color.fromARGB(255, 35, 39, 48)
                              .withOpacity(0.5), // Adjust opacity as needed
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey
                              .withOpacity(0.5), // Shadow color with opacity
                          blurRadius: 2.0,
                          offset: const Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CusMeter(
                          count: weather.forecastDays[0].day.avgHumidity,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 52,
                                  width: 60,
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/8179/8179067.png",
                                  ),
                                ),
                                CustomerText(
                                  title:
                                      " SunRise:  ${weather.forecastDays[0].astro.sunrise}",
                                  fontSize: 15,
                                  color2: Colors.white,
                                  strokeWidth: 1,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  height: 52,
                                  width: 60,
                                  child: Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/414/414944.png",
                                  ),
                                ),
                                CustomerText(
                                  title:
                                      " MoonRise:  ${weather.forecastDays[0].astro.moonrise}",
                                  fontSize: 15,
                                  color2: Colors.white,
                                  strokeWidth: 1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HourlyScreen(
                        weather: weather.forecastDays[0],
                      ),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomerText(
                      title: "Hourly Forecast:",
                      color1: Color.fromARGB(255, 4, 0, 0),
                      color2: Colors.yellow,
                      fontSize: 25,
                    ),
                    const SizedBox(height: 8),
                    WeatherHourlyList(hours: hours, currentTime: currentTime),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
