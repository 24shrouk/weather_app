import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app2/cubit/get%20weather%20cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Search a city'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherModel = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherModel.getWeather(cityName: value);
              Navigator.pop(context);
              log(value);
            },
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                label: Text('Search'),
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter city name'),
          ),
        ),
      ),
    );
  }
}
