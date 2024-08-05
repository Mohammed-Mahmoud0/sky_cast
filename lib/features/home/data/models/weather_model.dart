class WeatherModel {
  final String cityName;
  final String time;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String WeatherCondition;

  WeatherModel(
      {required this.cityName,
      required this.time,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.WeatherCondition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      time: json['location']['localtime'],
      image: json['current']['condition']['icon'],
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      WeatherCondition: json['current']['condition']['text'],
    );
  }
}
