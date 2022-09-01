// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'location_fetch.dart';
import '../services/networking.dart';

const apiKey = '5283fae723b4b96e02725780442a2b58';
late double latitude;
late double longitude;

class WeatherModel {
  Future getCityWeather(String cityName) async {
    Networking networking = Networking(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );
    var weather = await networking.getDatafromApi();
    // print("PRINTING WEATHER GET DATA FROM API" + weather);
    return weather;
  }

  Future getLocationWeather() async {
    LocationFetch location = LocationFetch();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    Networking networking = Networking(
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric',
    );
    var weather = await networking.getDatafromApi();
    return weather;
  }

  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return FontAwesomeIcons.cloudBolt;
    } else if (condition < 400) {
      return FontAwesomeIcons.cloudShowersHeavy;
    } else if (condition < 600) {
      return FontAwesomeIcons.cloudRain;
    } else if (condition < 700) {
      return FontAwesomeIcons.snowflake;
    } else if (condition < 800) {
      return FontAwesomeIcons.smog;
    } else if (condition == 800) {
      return FontAwesomeIcons.solidSun;
    } else if (condition <= 804) {
      return FontAwesomeIcons.cloud;
    } else {
      return FontAwesomeIcons.question;
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
