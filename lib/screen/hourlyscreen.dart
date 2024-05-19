import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_weather_app/fuctions/selectimage.dart';
import 'package:flutter_application_weather_app/fuctions/wind.dart';
import 'package:flutter_application_weather_app/model/forecastdaymodel.dart';
import 'package:flutter_application_weather_app/screen/widget/customertext2.dart';
import 'package:flutter_application_weather_app/screen/widget/meter.dart';

class HourlyScreen extends StatefulWidget {
  const HourlyScreen({super.key, required this.weather});
  final ForecastDay weather;

  @override
  _HourlyScreenState createState() => _HourlyScreenState();
}

class _HourlyScreenState extends State<HourlyScreen> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  now.hour < 12
                      ? "https://th.bing.com/th/id/OIP.VGyQJtvIo0WZyt7zGuKV4QHaF7?rs=1&pid=ImgDetMain"
                      : "https://cdn.dribbble.com/users/925716/screenshots/3333720/attachments/722376/after_noon.png",
                ),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Row(
                  children: [
                    BackButton(),
                    Text(""),
                  ],
                ),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 620.0,
                      initialPage: now.hour,
                      enlargeCenterPage: true,
                      autoPlay: false,
                    ),
                    items: widget.weather.hour.map((hour) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Container(
                                height: 176,
                                width: 185 * 2,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.1),
                                ),
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 1.0,
                                            sigmaY: 1.0,
                                          ),
                                          child: Container(),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.20),
                                            ),
                                            gradient: LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                Colors.white.withOpacity(0.15),
                                                Colors.white.withOpacity(0.05),
                                              ],
                                            ),
                                          ),
                                        ),
                                        CustomerText2(
                                            titile:
                                                "${hour.time.substring(10, 16)} h"),
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.asset(
                                              selectImage(hour.condition.text),
                                              width: 200,
                                              height: 100,
                                            ),
                                          ),
                                        ),
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Container(
                                            height: 120,
                                            width: 290,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.1),
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: Colors.white
                                                            .withOpacity(0.20)),
                                                    gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          Colors.white
                                                              .withOpacity(
                                                                  0.15),
                                                          Colors.white
                                                              .withOpacity(
                                                                  0.05),
                                                        ]),
                                                  ),
                                                ),
                                                Center(
                                                    child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          // CircleAvatar(
                                                          //   backgroundColor:
                                                          //       Colors.black45,
                                                          //   backgroundImage:
                                                          //       NetworkImage(
                                                          //           "https://image.pngaaa.com/675/7749675-middle.png"),
                                                          // ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Center(
                                                            child:
                                                                CustomerText2(
                                                              titile:
                                                                  "${hour.dewpointC.toString()} °C",
                                                              fontSize: 50,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      CustomerText2(
                                                        titile:
                                                            "${hour.condition.text} ",
                                                        fontSize: 20,
                                                      ),
                                                    ],
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Container(
                                                height: 140,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 1.0,
                                                          sigmaY: 1.0),
                                                      child: Container(),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.20)),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              Colors.white
                                                                  .withOpacity(
                                                                      0.15),
                                                              Colors.white
                                                                  .withOpacity(
                                                                      0.05),
                                                            ]),
                                                      ),
                                                    ),
                                                    Center(
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              // CircleAvatar(
                                                              //   backgroundColor:
                                                              //       Colors.black45,
                                                              //   backgroundImage:
                                                              //       NetworkImage(
                                                              //           "https://image.pngaaa.com/675/7749675-middle.png"),
                                                              // ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              CustomerText2(
                                                                titile: "COULD",
                                                                fontSize: 16,
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: CusMeter(
                                                                count: hour
                                                                    .cloud
                                                                    .toDouble()),
                                                          )
                                                        ],
                                                      ),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Container(
                                                height: 140,
                                                width: 140,
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    BackdropFilter(
                                                      filter: ImageFilter.blur(
                                                          sigmaX: 1.0,
                                                          sigmaY: 1.0),
                                                      child: Container(),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.20)),
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              Colors.white
                                                                  .withOpacity(
                                                                      0.15),
                                                              Colors.white
                                                                  .withOpacity(
                                                                      0.05),
                                                            ]),
                                                      ),
                                                    ),
                                                    Center(
                                                        child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              // CircleAvatar(
                                                              //   backgroundColor:
                                                              //       Colors.black45,
                                                              //   backgroundImage:
                                                              //       NetworkImage(
                                                              //           "https://image.pngaaa.com/675/7749675-middle.png"),
                                                              // ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                              CustomerText2(
                                                                titile:
                                                                    "HUMIDITY",
                                                                fontSize: 16,
                                                              ),
                                                            ],
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: CusMeter(
                                                                count: hour
                                                                    .humidity
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
                                        Row(
                                          children: [
                                            Image.network(
                                              width: 150,
                                              height: 119,
                                              "https://cdn3.iconfinder.com/data/icons/mother-earth-day-6/64/Wind_turbine-sustainability-green_energy-ecology-environment-512.png",
                                            ),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    CustomerText2(
                                                      titile:
                                                          "${hour.gustKph} ",
                                                      fontSize: 31,
                                                    ),
                                                    const Column(
                                                      children: [
                                                        CustomerText2(
                                                          titile: "kmh",
                                                          fontSize: 11,
                                                        ),
                                                        CustomerText2(
                                                          titile: "Wind",
                                                          fontSize: 15,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Container(
                                                  height: 2,
                                                  width: 130,
                                                  color: const Color.fromARGB(
                                                      255, 205, 180, 180),
                                                ),
                                                CustomerText2(
                                                  titile: getWindDirection(
                                                      hour.windDir),
                                                  fontSize: 17,
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
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
