import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/fuctions/hour_color_function.dart';
import 'package:flutter_application_weather_app/model/hours.dart';
import 'package:flutter_application_weather_app/screen/widget/customer_text.dart';

class WeatherHourlyList extends StatefulWidget {
  final List<Hour> hours;
  final String currentTime;

  const WeatherHourlyList(
      {super.key, required this.hours, required this.currentTime});

  @override
  _WeatherHourlyListState createState() => _WeatherHourlyListState();
}

class _WeatherHourlyListState extends State<WeatherHourlyList> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToCurrentHour());
  }

  void _scrollToCurrentHour() {
    final int currentIndex = widget.hours.indexWhere(
        (hour) => hour.time.substring(11, 16) == widget.currentTime);
    if (currentIndex != -1) {
      setState(() {
        _currentIndex = currentIndex;
      });
      _scrollController.animateTo(
        currentIndex *
            128.0, // Adjust this value to fit your item width + padding
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: widget.hours.length,
        itemBuilder: (context, index) {
          final hour = widget.hours[index];

          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              child: Container(
                height: 100,
                width: 120,
                decoration: getWeatherDecoration(hour.condition.text),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.access_time_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                              CustomerText(
                                title: hour.time.substring(11, 16),
                                fontSize: 15,
                                color2: Colors.white,
                                strokeWidth: 1,
                              ),
                            ],
                          ),
                          Image.network(
                            'https:${hour.condition.icon}',
                            width: 60,
                            height: 60,
                          ),
                          Container(
                            height: 109,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 198, 202, 208),
                              border: Border.all(
                                color: const Color.fromARGB(255, 33, 74, 171),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: const LinearGradient(colors: [
                                Colors.indigo,
                                Colors.indigo,
                                Color.fromARGB(255, 70, 109, 181),
                              ]),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(2.0, 2.0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CustomerText(
                                    title: hour.condition.text,
                                    fontSize: 13,
                                    color2: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                  const Spacer(),
                                  CustomerText(
                                    title: "${hour.dewpointC.toString()}°C",
                                    fontSize: 24,
                                    color2: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
