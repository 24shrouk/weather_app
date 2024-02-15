class WeatherModel {
  final String cityName;
  final DateTime date;
  final String image;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String weatherStateName;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});
  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        weatherStateName: json['forecast']['forecastday'][0]['day']['condition']
            ['text']);
  }
  // String getImage() {
  //   if (weatherStateName == 'Sunny' ||
  //       weatherStateName == 'Clear' ||
  //       weatherStateName == 'partly cloudy') {
  //     return 'assets/images/clear.png';
  //   } else if (weatherStateName == 'Blizzard' ||
  //       weatherStateName == 'Patchy snow possible' ||
  //       weatherStateName == 'Patchy sleet possible' ||
  //       weatherStateName == 'Patchy freezing drizzle possible' ||
  //       weatherStateName == 'Blowing snow') {
  //     return 'assets/images/snow.png';
  //   } else if (weatherStateName == 'Freezing fog' ||
  //       weatherStateName == 'Fog' ||
  //       weatherStateName == 'Heavy Cloud' ||
  //       weatherStateName == 'Mist' ||
  //       weatherStateName == 'Fog') {
  //     return 'assets/images/cloudy.png';
  //   } else if (weatherStateName == 'Patchy rain possible' ||
  //       weatherStateName == 'Heavy Rain' ||
  //       weatherStateName == 'Showers	') {
  //     return 'assets/images/rainy.png';
  //   } else if (weatherStateName == 'Thundery outbreaks possible' ||
  //       weatherStateName == 'Moderate or heavy snow with thunder' ||
  //       weatherStateName == 'Patchy light snow with thunder' ||
  //       weatherStateName == 'Moderate or heavy rain with thunder' ||
  //       weatherStateName == 'Patchy light rain with thunder') {
  //     return 'assets/images/thunderstorm.png';
  //   } else {
  //     return 'assets/images/clear.png';
  //   }
  //}
}
