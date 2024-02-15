import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app2/cubit/get%20weather%20cubit/get_weather_cubit.dart';
import 'package:weather_app2/cubit/get%20weather%20cubit/get_weather_state.dart';

import 'package:weather_app2/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  color: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStateName,
                  ),
                ),
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherStateName,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? dayCondition) {
  switch (dayCondition) {
    case "Sunny":
    case "Clear":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.yellow;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
      return Colors.blueGrey;
    case "Mist":
      return Colors.lightBlue;
    case "Patchy rain possible":
      return Colors.lightBlue;
    case "Patchy snow possible":
      return Colors.lightBlue;
    case "Patchy sleet possible":
      return Colors.lightBlue;
    case "Patchy freezing drizzle possible":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blowing snow":
      return Colors.blue;
    case "Blizzard":
      return Colors.indigo;
    case "Fog":
      return Colors.grey;
    case "Freezing fog":
      return Colors.grey;
    case "Patchy light drizzle":
      return Colors.lightBlue;
    case "Light drizzle":
      return Colors.lightBlue;
    case "Freezing drizzle":
      return Colors.lightBlue;
    case "Heavy freezing drizzle":
      return Colors.lightBlue;
    case "Patchy light rain":
      return Colors.lightBlue;
    case "Light rain":
      return Colors.lightBlue;
    case "Moderate rain at times":
      return Colors.lightBlue;
    case "Moderate rain":
      return Colors.lightBlue;
    case "Heavy rain at times":
      return Colors.lightBlue;
    case "Heavy rain":
      return Colors.lightBlue;
    case "Light freezing rain":
      return Colors.lightBlue;
    case "Moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "Light sleet":
      return Colors.lightBlue;
    case "Moderate or heavy sleet":
      return Colors.lightBlue;
    case "Patchy light snow":
      return Colors.lightBlue;
    case "Light snow":
      return Colors.lightBlue;
    case "Patchy moderate snow":
      return Colors.lightBlue;
    case "Moderate snow":
      return Colors.lightBlue;
    case "Patchy heavy snow":
      return Colors.lightBlue;
    case "Heavy snow":
      return Colors.lightBlue;
    case "Ice pellets":
      return Colors.lightBlue;
    case "Light rain shower":
      return Colors.lightBlue;
    case "Moderate or heavy rain shower":
      return Colors.lightBlue;
    case "Torrential rain shower":
      return Colors.lightBlue;
    case "Light sleet showers":
      return Colors.lightBlue;
    case "Moderate or heavy sleet showers":
      return Colors.lightBlue;
    case "Light snow showers":
      return Colors.lightBlue;
    case "Moderate or heavy snow showers":
      return Colors.lightBlue;
    case "Light showers of ice pellets":
      return Colors.lightBlue;
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;
    case "Patchy light rain with thunder":
      return Colors.deepPurple;
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;
    case "Patchy light snow with thunder":
      return Colors.deepPurple;
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    default:
      return Colors.blue;
  }
}


// MaterialColor getThemeColor(String? condition) {
//   if (condition == 'Sunny' ||
//       condition == 'Clear' ||
//       condition == 'partly cloudy') {
//     return Colors.orange;
//   } else if (condition == 'Blizzard' ||
//       condition == 'Patchy snow possible' ||
//       condition == 'Patchy sleet possible' ||
//       condition == 'Patchy freezing drizzle possible' ||
//       condition == 'Blowing snow') {
//     return Colors.blue;
//   } else if (condition == 'Freezing fog' ||
//       condition == 'Fog' ||
//       condition == 'Heavy Cloud' ||
//       condition == 'Mist' ||
//       condition == 'Fog') {
//     return Colors.blueGrey;
//   } else if (condition == 'Patchy rain possible' ||
//       condition == 'Heavy Rain' ||
//       condition == 'Showers	') {
//     return Colors.blue;
//   } else if (condition == 'Thundery outbreaks possible' ||
//       condition == 'Moderate or heavy snow with thunder' ||
//       condition == 'Patchy light snow with thunder' ||
//       condition == 'Moderate or heavy rain with thunder' ||
//       condition == 'Patchy light rain with thunder') {
//     return Colors.deepPurple;
//   } else {
//     return Colors.blue;
//   }
// }




// MaterialColor getThemeColor(String? condition) {
//   if (condition != null) {
//     if (condition == "Sunny" || condition == "Partly cloudy") {
//       return Colors.orange;
//     } else if (condition == "Cloudy") {
//       return Colors.grey;
//     } else if (condition == "Overcast") {
//       return Colors
//           .grey; // or any other appropriate color for overcast conditions
//     } else if (condition == "Mist") {
//       return Colors.blueGrey;
//     } else if (condition == "Patchy rain possible" ||
//         condition == "Thundery outbreaks possible") {
//       return Colors.indigo;
//     } else if (condition == "Blowing snow" ||
//         condition == "Blizzard" ||
//         condition == "Fog") {
//       return Colors.grey;
//     } else if (condition == "Freezing fog" ||
//         condition == "Patchy light drizzle" ||
//         condition == "Light drizzle") {
//       return Colors.lightBlue;
//     } else if (condition == "Freezing drizzle" ||
//         condition == "Heavy freezing drizzle" ||
//         condition == "Patchy light rain") {
//       return Colors.blue;
//     } else if (condition == "Light rain" ||
//         condition == "Moderate rain" ||
//         condition == "Heavy rain") {
//       return Colors.deepPurple;
//     }
//   }
//   return Colors.purple;
// }
