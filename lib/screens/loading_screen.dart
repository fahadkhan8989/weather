// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weather = await weatherModel.getLocationWeather();
    print(weather);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return LocationScreen(weatherData: weather);
        },
      ),
      (route) {
        return false;
      },
    );
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => LoginPage(),
    //   ),
    //   (route) => false,
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 7,
              child: Icon(
                Icons.sunny,
                size: 200,
                color: Colors.yellow[800],
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Discover The Weather in Your City",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "Get to know your weather maps and radar precipitation forecast",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff888992),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: SpinKitRotatingCircle(
                color: Colors.white,
                size: 50,
              ),
            ),
            Spacer(),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Text(
                  "Fetching Your Location",
                  style: TextStyle(
                    color: Color(0XFF0B0C1E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
