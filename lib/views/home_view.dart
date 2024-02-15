import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app2/cubit/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app2/cubit/get%20weather%20cubit/get_weather_state.dart';
import 'package:weather_app2/views/search_view.dart';
import 'package:weather_app2/widgets/no_weather.dart';
import 'package:weather_app2/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SearchView(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body:
          BlocBuilder<GetWeatherCubit, WeatherState>(
            builder:  (context, state) {
        if (state is WeatherInitialState) {
          return const NoWeatherBody();
        } else if (state is WeatherLoadedState) {
          return WeatherInfoBody(
            weather: state.weatherModel,
          );
        } else {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Opps there is an error, try latter',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          );
        }
      }),
    );
  }
}
