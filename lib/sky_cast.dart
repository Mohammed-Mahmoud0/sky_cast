import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cast/features/home/logic/get_weather_cubit.dart';
import 'package:sky_cast/features/home/logic/get_weather_states.dart';
import 'package:sky_cast/features/home/ui/home_screen.dart';

class SkyCast extends StatelessWidget {
  const SkyCast({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => GetWeatherCubit(),
        child: BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            final weatherModel =
                BlocProvider.of<GetWeatherCubit>(context).weatherModel;
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primaryColor: weatherModel != null
                    ? getThemeColor(
                        weatherModel.weatherCondition, weatherModel.is_day)
                    : Colors.blue,
              ),
              home: HomeScreen(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition, int isDaytime) {
  bool isDay = true;
  if (isDaytime == 0) {
    isDay = false;
  }
  if (condition == null) {
    return Colors.blue;
  }
  if ((condition == 'Sunny' && isDay) || (condition == 'Clear' && isDay)) {
    return Colors.orange;
  } else if (condition == 'Clear' && !isDay) {
    return Colors.indigo;
  } else if (condition == 'Partly cloudy') {
    return Colors.blueGrey;
  } else if (condition == 'Cloudy' || condition == 'Overcast') {
    return Colors.grey;
  } else if (condition == 'Mist' ||
      condition == 'Fog' ||
      condition == 'Freezing fog') {
    return Colors.blueGrey;
  } else if (condition == 'Patchy rain possible' ||
      condition == 'Light rain' ||
      condition == 'Patchy light rain' ||
      condition == 'Light rain shower') {
    return Colors.lightBlue;
  } else if (condition == 'Patchy snow possible' ||
      condition == 'Patchy light snow' ||
      condition == 'Light snow' ||
      condition == 'Light snow showers') {
    return Colors.lightBlue;
  } else if (condition == 'Patchy sleet possible' ||
      condition == 'Light sleet' ||
      condition == 'Light sleet showers') {
    return Colors.lightBlue;
  } else if (condition == 'Patchy freezing drizzle possible' ||
      condition == 'Light freezing drizzle' ||
      condition == 'Light freezing rain') {
    return Colors.lightBlue;
  } else if (condition == 'Thundery outbreaks possible' ||
      condition == 'Patchy light rain with thunder' ||
      condition == 'Patchy light snow with thunder') {
    return Colors.deepPurple;
  } else if (condition == 'Blowing snow' ||
      condition == 'Blizzard' ||
      condition == 'Heavy snow' ||
      condition == 'Heavy snow showers' ||
      condition == 'Moderate or heavy snow with thunder') {
    return Colors.blueGrey;
  } else if (condition == 'Freezing drizzle' ||
      condition == 'Moderate or heavy freezing drizzle' ||
      condition == 'Moderate or heavy freezing rain') {
    return Colors.cyan;
  } else if (condition == 'Light drizzle' ||
      condition == 'Patchy light drizzle') {
    return Colors.cyan;
  } else if (condition == 'Moderate rain at times' ||
      condition == 'Moderate rain' ||
      condition == 'Heavy rain at times' ||
      condition == 'Heavy rain' ||
      condition == 'Torrential rain shower' ||
      condition == 'Moderate or heavy rain shower' ||
      condition == 'Moderate or heavy rain with thunder') {
    return Colors.blue;
  } else if (condition == 'Moderate or heavy sleet' ||
      condition == 'Moderate or heavy sleet showers') {
    return Colors.cyan;
  } else if (condition == 'Moderate snow' ||
      condition == 'Patchy moderate snow' ||
      condition == 'Patchy heavy snow') {
    return Colors.blueGrey;
  } else if (condition == 'Ice pellets' ||
      condition == 'Light showers of ice pellets' ||
      condition == 'Moderate or heavy showers of ice pellets') {
    return Colors.blueGrey;
  } else {
    return Colors.blueGrey;
  }
}
