import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';
import '../auth/key.dart';

class WeatherModel {
  Future<dynamic> getCity(dynamic cityname) async {
    String url = 'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=${Key.apiKey}&units=metric';
    Network n = Network(url: url);
    var weatherData = await n.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherData() async {
    Location l = Location();
    await l.getCurrentLocation();
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=${l.latitude}&lon=${l.longitude}&appid=${Key.apiKey}&units=metric';
    Network n = Network(url: url);
    dynamic weatherData = await n.getData();
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
