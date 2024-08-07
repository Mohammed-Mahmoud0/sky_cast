import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/core/networking/weather_service.dart';
import 'package:sky_cast/features/home/data/models/weather_model.dart';
import 'package:sky_cast/features/home/logic/get_weather_states.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());

  WeatherModel? weatherModel;

  void getWeather({required String cityName}) async {
    try {
      weatherModel = await WeatherService(Dio()).getWeather(cityName: cityName);
      emit(GetWeatherLoadedState());
    } on Exception catch (e) {
      emit(GetWeatherErrorState(
        e.toString(),
      ));
    }
  }
}
