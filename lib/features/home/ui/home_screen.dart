import 'package:flutter/material.dart';
import 'package:sky_cast/features/search_for_city/search_for_weather.dart';
import 'package:sky_cast/features/home/ui/widgets/weather_info_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: WeatherInfoBody(),
    );
  }
}
