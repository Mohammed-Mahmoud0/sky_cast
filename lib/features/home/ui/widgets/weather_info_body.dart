import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cast/features/home/data/models/weather_model.dart';
import 'package:sky_cast/features/home/logic/get_weather_cubit.dart';
import 'package:sky_cast/sky_cast.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            getThemeColor(weatherModel.weatherCondition, weatherModel.is_day),
            getThemeColor(weatherModel.weatherCondition, weatherModel.is_day)[300]!,
            getThemeColor(weatherModel.weatherCondition, weatherModel.is_day)[50]!,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                weatherModel.cityName,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'updated at ${weatherModel.time}',
                style: TextStyle(
                  fontSize: 24.sp,
                ),
              ),
              SizedBox(
                height: 32.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https:${weatherModel.image}',
                  ),
                  Text(
                    weatherModel.temp.toString().split('.')[0] + '°C',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'H: ${weatherModel.maxTemp.toString().split('.')[0]}°C\n'
                    'L: ${weatherModel.minTemp.toString().split('.')[0]}°C',
                    style: TextStyle(
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.w,
              ),
              Text(
                '${weatherModel.weatherCondition}',
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
