import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String weatherMapUrl = "http://api.openweathermap.org/data/2.5/weather";
// const String apiKey = "e72ca729af228beabd5d20e3b7749713";
const String apiKey = "df685081c24c0e0f3677e5acc3df50bb";

// String cityName;

class WeatherModel {
// api.openweathermap.org/data/2.5/weather?q=London
// api.openweathermap.org/data/2.5/weather?id={city id}&appid={your api key}
  Future<dynamic> getCityweather(String selectedCity) async {
    String url = "$weatherMapUrl?q=$selectedCity&appid=$apiKey&units=metric";
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    // latitude = location.latitude;
    // longitude = location.longitude;
    String url =
        '$weatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);
    var whetherData = await networkHelper.getData();
    return whetherData;
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
