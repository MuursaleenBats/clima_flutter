import 'package:clima_flutter/services/location.dart';
import 'package:clima_flutter/services/networking.dart';
import 'package:clima_flutter/utilities/constants.dart';

const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future getCityWeather(String cityName) async {
    NetworkHelper netHelp =
        NetworkHelper('$baseUrl?q=$cityName&appid=$kApiKey&units=metric');
    var weatherData = await netHelp.getData();
    return weatherData;
  }

  Future getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    // latitude = location.latitude;
    // longitude = location.longitude;
    NetworkHelper netHelp = NetworkHelper(
        '$baseUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric');
    var weatherData = await netHelp.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
