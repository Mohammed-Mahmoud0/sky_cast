import 'dart:developer';

import 'package:intl/intl.dart';

class WeatherModel {
  final String cityName;
  final String time;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherCondition;
  final int is_day;

  WeatherModel({
    required this.cityName,
    required this.time,
    required this.image,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherCondition,
    required this.is_day,
  });

  factory WeatherModel.fromJson(json) {
    DateTime parsedTime = DateTime.parse(json['location']['localtime']);
    String formattedTime = DateFormat('h:mm a').format(parsedTime);
    return WeatherModel(
      cityName: json['location']['name'],
      time: formattedTime,
      image: json['current']['condition']['icon'],
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      weatherCondition: json['current']['condition']['text'],
      is_day: json['current']['is_day'],
    );
  }
}
