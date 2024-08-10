import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sky_cast/features/get_current_location/get_current_location.dart';
import 'package:sky_cast/features/home/logic/get_weather_cubit.dart';
import 'package:sky_cast/features/home/logic/get_weather_states.dart';
import 'package:sky_cast/features/home/ui/widgets/no_weather_body.dart';
import 'package:sky_cast/features/search_for_city/search_for_weather.dart';
import 'package:sky_cast/features/home/ui/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Future<void> _getCurrentLocation(BuildContext context) async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Handle the case when location services are not enabled
  //     return;
  //   }
  //
  //   // Check for location permission
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission != LocationPermission.whileInUse &&
  //         permission != LocationPermission.always) {
  //       // Handle the case when permission is not granted
  //       return;
  //     }
  //   }
  //
  //   // Get the current position
  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   double latitude = position.latitude;
  //   double longitude = position.longitude;
  //   String location = '$latitude $longitude';
  //   var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
  //   getWeatherCubit.getWeather(cityName: location);
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Sky Cast',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              GetCurrentLocation location = GetCurrentLocation();
              String? locationName = await location.getCurrentLocation(context);
              BlocProvider.of<GetWeatherCubit>(context)
                  .getWeather(cityName: locationName!);
              // _getCurrentLocation(context);
            },
            icon: Icon(
              Icons.location_on,
            ),
          ),
          IconButton(
            onPressed: () {
              showSearchBottomSheet(context);
            },
            icon: Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return NoWeatherBody();
          } else if (state is GetWeatherLoadedState) {
            return WeatherInfoBody();
          } else {
            return const Text('opps something went wrong! 😔');
          }
        },
      ),
    );
  }
}
