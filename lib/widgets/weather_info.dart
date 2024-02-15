import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app2/cubit/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app2/main.dart';
import 'package:weather_app2/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    var weatherModel = BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          getThemeColor(weatherModel.weatherStateName)[500]!,
          getThemeColor(weatherModel.weatherStateName)[50]!,
          getThemeColor(weatherModel.weatherStateName),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      )),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (weatherModel.image.contains('https:'))
                Image.network(
                  weatherModel.image,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
              else
                Image.network(
                  'https:${weatherModel.image}',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              Text(
                weatherModel.temp.toString(),
                style:
                    const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                weatherModel.cityName.toString(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                weatherModel.weatherStateName,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              if (weatherModel.date.hour >= 12)
                Text(
                  'update at  ${weatherModel.date.hour - 12} : ${weatherModel.date.minute} PM',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                )
              else
                Text(
                  'update at  ${weatherModel.date.hour} : ${weatherModel.date.minute} AM',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.thermostat_outlined,
                    color: Colors.orangeAccent,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      const Text(
                        'MaxTemp ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            '${weatherModel.maxTemp.round()}°C',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Icon(
                    Icons.thermostat_outlined,
                    color: Color.fromARGB(255, 41, 157, 245),
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      const Text(
                        'MinTemp ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' ${weatherModel.minTemp.round()}°C ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
