import 'package:flutter/material.dart';

class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherState;

  WeatherModel({required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonDate = data['forecast']['forecastday'][0]['day'];




    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonDate['avgtemp_c'],
        maxTemp: jsonDate['maxtemp_c'],
        minTemp: jsonDate['mintemp_c'],
        weatherState: jsonDate["condition"]['text']);
  }

  // @override
  // String toString() {
  //   return "temp = $temp date = $date minTemp = $minTemp";
  // }

  String getImageName() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return 'assets/images/snow.png';
    } else if (weatherState == 'Showers' ||
        weatherState == 'Heavy Rain ' ||
        weatherState == 'Light Rain') {
      return 'assets/images/rainy.png';
    } else if (weatherState == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    }
    else if (weatherState == 'Thunderstorm') {
      return 'assets/images/thunderstorm.png';
    } else{
      return 'assets/images/clear.png';
  }
}

  MaterialColor getThemeColor() {
    if (weatherState == 'Clear' || weatherState == 'Light Cloud') {
      return Colors.orange;
    } else if (weatherState == 'Sleet' ||
        weatherState == 'Snow' ||
        weatherState == 'Hail') {
      return Colors.blue;
    } else if (weatherState == 'Showers' ||
        weatherState == 'Heavy Rain ' ||
        weatherState == 'Light Rain') {
      return Colors.blue;
    } else if (weatherState == 'Heavy Cloud') {
      return Colors.blueGrey;
    }
    else if (weatherState == 'Thunderstorm') {
      return Colors.blueGrey;
    } else{
      return Colors.orange;
    }
  }



}