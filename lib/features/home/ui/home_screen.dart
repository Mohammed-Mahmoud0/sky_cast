import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sky_cast/features/home/logic/get_weather_cubit.dart';
import 'package:sky_cast/features/home/logic/get_weather_states.dart';
import 'package:sky_cast/features/home/ui/widgets/no_weather_body.dart';
import 'package:sky_cast/features/search_for_city/search_for_weather.dart';
import 'package:sky_cast/features/home/ui/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          }
          else if (state is GetWeatherLoadedState) {
            return WeatherInfoBody();
          }
          else {
            return const Text('opps something went wrong! 😔');
          }
        },
      ),
    );
  }
}
