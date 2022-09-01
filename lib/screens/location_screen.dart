// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather/services/weather.dart';
import 'package:weather/utilities/constants.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  final dynamic weatherData;

  const LocationScreen({required this.weatherData});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  late IconData weatherIcon;
  late int temp;
  late String city;
  late String description;
  late int minTemp;
  late int maxTemp;
  late int humidity;
  late int wind;

  @override
  void initState() {
    super.initState();
    updateUi(widget.weatherData);
  }

  void updateUi(weatherData) {
    setState(() {
      int id = weatherData["weather"][0]["id"];
      weatherIcon = weatherModel.getWeatherIcon(id);
      print(id);
      print(weatherIcon);
      double temprature = weatherData["main"]["temp"];
      temp = temprature.toInt();
      print(temp);
      city = weatherData["name"];
      print(city);
      description = weatherData["weather"][0]["main"];
      print(description);
      double minTemprature = weatherData["main"]["temp_min"];
      minTemp = minTemprature.toInt();
      double maxTemprature = weatherData["main"]["temp_max"];
      maxTemp = maxTemprature.toInt();
      humidity = weatherData["main"]["humidity"];
      // humidity = humid.toInt();
      double windSpeed = weatherData["wind"]["speed"];
      wind = windSpeed.toInt();
    });
  }

  displaySnackBar(String message, Color color) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          constraints: BoxConstraints.expand(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      ScaffoldMessenger.of(context).showSnackBar(
                        displaySnackBar("Updating Location", Color(0XFF0B0C1E)),
                      );
                      var weather = await weatherModel.getLocationWeather();
                      updateUi(weather);

                      ScaffoldMessenger.of(context).showSnackBar(
                        displaySnackBar("Location Updated", Color(0XFF0B0C1E)),
                      );
                    },
                    child: Icon(
                      Icons.near_me_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: null,
                    icon: Icon(
                      Icons.location_on_outlined,
                      size: 26,
                      color: Colors.blue,
                    ),
                    label: Text(
                      city,
                      style: kLocationStyle,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedCityName != null) {
                        var cityWeather =
                            await weatherModel.getCityWeather(typedCityName);

                        if (cityWeather == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            displaySnackBar(
                              "Wrong City entered. Try again!",
                              Colors.red,
                            ),
                          );
                        }

                        updateUi(cityWeather);
                      }
                      print(typedCityName);
                    },
                    child: Icon(
                      Icons.location_city_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Today's Report",
                  style: kHeadingStyle,
                ),
              ),
              Expanded(
                flex: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Icon(
                        weatherIcon,
                        size: 150,
                      ),
                    ),
                    Text(
                      description,
                      style: kTempFeedbackStyle,
                    ),
                    Text(
                      "$temp°",
                      style: kTempStyle,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.fromLTRB(30, 0, 30, 60),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff171829),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.droplet,
                            size: 36,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "$humidity %",
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            "Humidity",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.temperatureHalf,
                            size: 36,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "$maxTemp° / $minTemp°",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "Max / Min",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(
                            FontAwesomeIcons.wind,
                            size: 36,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "$wind km/h",
                            style: TextStyle(fontSize: 22),
                          ),
                          Text(
                            "Wind",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
