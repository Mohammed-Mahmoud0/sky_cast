class WeatherState {}

class WeatherInitialState extends WeatherState {}

class GetWeatherLoadedState extends WeatherState {}

class GetWeatherErrorState extends WeatherState {
  final String errorMessage;

  GetWeatherErrorState(this.errorMessage);

}
