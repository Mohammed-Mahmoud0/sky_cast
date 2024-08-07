import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_cast/core/networking/weather_service.dart';
import 'package:sky_cast/features/home/data/models/weather_model.dart';
import 'package:sky_cast/features/home/logic/get_weather_cubit.dart';
import 'package:sky_cast/features/search_for_city/widgets/search_text_field.dart';

class SearchForWeather extends StatelessWidget {
  const SearchForWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 250.h,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter city name',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32.h),
            SearchTextField(
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context, value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showSearchBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    showDragHandle: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SearchForWeather(),
      );
    },
  );
}
