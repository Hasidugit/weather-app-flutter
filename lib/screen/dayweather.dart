import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/fuctions/selectimage.dart';
import 'package:flutter_application_weather_app/fuctions/uvrange.dart';
import 'package:flutter_application_weather_app/model/wethermodel.dart';
import 'package:flutter_application_weather_app/screen/widget/customertext2.dart';
import 'package:flutter_application_weather_app/screen/widget/lineargraph.dart';
import 'package:flutter_application_weather_app/screen/widget/meter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DayWeather extends StatefulWidget {
  const DayWeather({super.key, required this.weather});
  final Weather weather;

  @override
  State<DayWeather> createState() => _DayWeatherState();
}

class _DayWeatherState extends State<DayWeather> {
  DateTime now = DateTime.now();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('AppBar Example'),
      // ),
      body: SafeArea(
          child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              now.hour < 12
                  ? "https://i.pinimg.com/736x/4a/f8/cb/4af8cbc21abc069c53e3c3cf4e543e2c.jpg"
                  : "https://i.pinimg.com/474x/33/27/5f/33275f8daa46af9d6798d807edda0fed.jpg",
            ),
          ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      const BackButton(),
                      CustomerText2(
                        titile: widget.weather.forecastDays[0].date,
                        fontSize: 24,
                        color: const Color.fromARGB(115, 186, 174, 174),
                      )
                    ],
                  ),
                  Image.asset(
                    selectImage(
                        widget.weather.forecastDays[0].day.conditionText),
                    width: 200,
                    height: 200,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 170.0,
                            width: 185,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 17, 11, 202)
                                  .withOpacity(0.1),
                            ),
                            child: Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 1.0, sigmaY: 1.0),
                                  child: Container(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.15),
                                          Colors.white.withOpacity(0.05),
                                        ]),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.black45,
                                            child: Icon(
                                              Icons.light_mode,
                                              color: Colors.white70,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CustomerText2(
                                            titile: "UV INDEX",
                                            fontSize: 16,
                                          ),
                                        ],
                                      ),
                                      CustomerText2(
                                        titile: widget
                                            .weather.forecastDays[0].day.uv
                                            .toString(),
                                        fontSize: 28,
                                        color: Colors.white70,
                                      ),
                                      CustomerText2(
                                        titile: getUVIndexLevel(widget
                                            .weather.forecastDays[0].day.uv),
                                        fontSize: 18,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      LinearPercentIndicator(
                                        width: 160.0,
                                        lineHeight: 10.0,
                                        percent: widget.weather.forecastDays[0]
                                                .day.uv /
                                            10,
                                        backgroundColor: const Color.fromARGB(
                                            255, 240, 234, 234),
                                        linearGradient: const LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 11, 39,
                                                200), // Start color
                                            Color.fromARGB(255, 16, 2, 45),
                                            Color.fromARGB(255, 218, 220,
                                                231), // End color
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                        barRadius: const Radius.circular(10),
                                        clipLinearGradient: true,
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      CustomerText2(
                                        titile: getUVIndexMessage(widget
                                            .weather.forecastDays[0].day.uv),
                                        color: Colors.white70,
                                        fontSize: 20,
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 82,
                                width: 185,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.0, sigmaY: 1.0),
                                      child: Container(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.20)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white.withOpacity(0.15),
                                              Colors.white.withOpacity(0.05),
                                            ]),
                                      ),
                                    ),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.black45,
                                                backgroundImage: NetworkImage(
                                                    "https://cdn-icons-png.flaticon.com/512/8179/8179067.png"),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomerText2(
                                                titile: "SUNRISE",
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                          CustomerText2(
                                            titile: widget.weather
                                                .forecastDays[0].astro.sunrise
                                                .toString(),
                                            fontSize: 18,
                                            color: Colors.white70,
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 83,
                                width: 185,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.0, sigmaY: 1.0),
                                      child: Container(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.20)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white.withOpacity(0.15),
                                              Colors.white.withOpacity(0.05),
                                            ]),
                                      ),
                                    ),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.black45,
                                                backgroundImage: NetworkImage(
                                                    "https://cdn-icons-png.flaticon.com/512/414/414944.png"),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomerText2(
                                                titile: "SUNSET",
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                          CustomerText2(
                                            titile: widget.weather
                                                .forecastDays[0].astro.sunset
                                                .toString(),
                                            fontSize: 18,
                                            color: Colors.white70,
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 170,
                      width: 185 * 2,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Stack(
                        children: [
                          //Blur Effect
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                            child: Container(),
                          ),
                          //Gradient Effect
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.20)),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.15),
                                    Colors.white.withOpacity(0.05),
                                  ]),
                            ),
                          ),
                          //Child
                          Center(
                              child: Row(children: [
                            SizedBox(
                              child: Image.network(
                                  height: 170,
                                  "https://cdn4.iconfinder.com/data/icons/physics-22/56/44-512.png"),
                            ),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        CustomerText2(
                                          titile:
                                              "${widget.weather.forecastDays[0].day.maxWindKph.toString()} ",
                                          fontSize: 50,
                                          color: Colors.white70,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomerText2(
                                              titile: "kmh",
                                              fontSize: 15,
                                            ),
                                            CustomerText2(
                                              titile: "Wind",
                                              fontSize: 18,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 160,
                                      height: 2,
                                      color: Colors.amberAccent,
                                    ),
                                    Row(
                                      children: [
                                        CustomerText2(
                                          titile:
                                              "${widget.weather.forecastDays[0].day.avgTempC.toString()} ",
                                          fontSize: 50,
                                          color: Colors.white70,
                                        ),
                                        const Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CustomerText2(
                                              titile: "C",
                                              fontSize: 15,
                                            ),
                                            CustomerText2(
                                              titile: "Tem..",
                                              fontSize: 18,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ]))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 82,
                                width: 185,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.0, sigmaY: 1.0),
                                      child: Container(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.20)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white.withOpacity(0.15),
                                              Colors.white.withOpacity(0.05),
                                            ]),
                                      ),
                                    ),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Color.fromARGB(
                                                    115, 163, 141, 141),
                                                // backgroundImage: NetworkImage(
                                                //     "https://cdn1.iconfinder.com/data/icons/security-flat-vol-1/104/eye__view__look__see__show-512.png"),
                                                child: Icon(
                                                  Icons.visibility,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomerText2(
                                                titile: "VISIBILITY",
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: CustomerText2(
                                              titile:
                                                  "${widget.weather.forecastDays[0].day.avgVisKm.toString()} km",
                                              fontSize: 18,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 83,
                                width: 185,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Stack(
                                  children: [
                                    BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 1.0, sigmaY: 1.0),
                                      child: Container(),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.20)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Colors.white.withOpacity(0.15),
                                              Colors.white.withOpacity(0.05),
                                            ]),
                                      ),
                                    ),
                                    Center(
                                        child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor: Colors.white24,
                                                child: Icon(
                                                  Icons.severe_cold_outlined,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              CustomerText2(
                                                titile: "SNOW",
                                                fontSize: 16,
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: CustomerText2(
                                              titile:
                                                  "${widget.weather.forecastDays[0].day.totalSnowCm.toString()} cm",
                                              fontSize: 18,
                                              color: Colors.white70,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Container(
                            height: 170,
                            width: 185,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                            ),
                            child: Stack(
                              children: [
                                BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 1.0, sigmaY: 1.0),
                                  child: Container(),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.white.withOpacity(0.20)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          Colors.white.withOpacity(0.15),
                                          Colors.white.withOpacity(0.05),
                                        ]),
                                  ),
                                ),
                                Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.black45,
                                            backgroundImage: NetworkImage(
                                                "https://image.pngaaa.com/675/7749675-middle.png"),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          CustomerText2(
                                            titile: "HUMIDITY",
                                            fontSize: 16,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: CusMeter(
                                            count: widget.weather
                                                .forecastDays[0].day.avgHumidity
                                                .toDouble()),
                                      )
                                    ],
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      height: 176,
                      width: 185 * 2,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                      ),
                      child: Stack(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                            child: Container(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.20)),
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.15),
                                    Colors.white.withOpacity(0.05),
                                  ]),
                            ),
                          ),
                          const Center(
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.white24,
                                      backgroundImage: NetworkImage(
                                          "https://cdn-icons-png.flaticon.com/512/3963/3963173.png"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    CustomerText2(
                                      titile: "TEMPERTURE",
                                      fontSize: 16,
                                    ),
                                  ],
                                ),
                                LineChartSample2(),
                              ],
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
