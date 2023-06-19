import 'package:fore_cast/services/location.dart';
import 'package:fore_cast/services/networking.dart';

const API_KEY = <API_KEY>;

class Weather {
  Future getWeatherData() async {
    Location location = Location();
    await location.getCurrentLocation();
    Uri url = Uri.http('api.weatherapi.com', '/v1/current.json', {
      'key': API_KEY,
      'q': '${location.latitude},${location.longitude}',
      'aqi': 'yes'
    });

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var data = await networkHelper.getData();
    return data;
  }

  Future getCityWeatherData(dynamic cityName) async {
    Uri url = Uri.http('api.weatherapi.com', '/v1/current.json',
        {'key': API_KEY, 'q': '$cityName', 'aqi': 'yes'});

    NetworkHelper networkHelper = NetworkHelper(url: url);

    var data = await networkHelper.getData();
    return data;
  }
}
