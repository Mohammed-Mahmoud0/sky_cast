import 'package:flutter/material.dart';
import 'package:sky_cast/features/home/ui/widgets/no_weather_body.dart';
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
            onPressed: () {},
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
