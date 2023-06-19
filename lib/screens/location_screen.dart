import 'package:flutter/material.dart';
import 'package:fore_cast/screens/city_screen.dart';
import 'package:fore_cast/services/weather.dart';
import 'package:fore_cast/utilities/constants.dart';
import 'package:fore_cast/components/text_icon.dart';
import 'package:fore_cast/components/CustomVD.dart';

DateTime now = DateTime.now();
const dayName = {
  1: 'Monday',
  2: 'Tuesday',
  3: 'Wednesday',
  4: 'Thursday',
  5: 'Friday',
  6: 'Saturday',
  7: 'Sunday',
};

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});

  final weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late double temperature;
  late String cityName;
  late String weatherIconUrl;
  late int humidity;
  late double wind_speed_kmph;
  late double pressure;
  late String condition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherData);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        cityName = 'Error';
        weatherIconUrl = '';
        humidity = 0;
        wind_speed_kmph = 0;
        pressure = 0;
        condition = 'Error';
      }
      temperature = weatherData['current']['temp_c'];
      cityName = weatherData['location']['name'];
      weatherIconUrl = weatherData['current']['condition']['icon'];
      humidity = weatherData['current']['humidity'];
      wind_speed_kmph = weatherData['current']['wind_kph'];
      pressure = weatherData['current']['pressure_mb'];
      condition = weatherData['current']['condition']['text'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/weather_bg.jpeg'),
                fit: BoxFit.cover)),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () async {
                        var data = await Weather().getWeatherData();
                        updateUI(data);
                      },
                      child: Icon(
                        Icons.assistant_navigation,
                        size: 40.0,
                        color: kDefaultTextColor,
                      )),
                  TextButton(
                      onPressed: () async {
                        var cityName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CityScreen()));

                        if (cityName != null) {
                          var data =
                              await Weather().getCityWeatherData(cityName);
                          updateUI(data);
                        }
                      },
                      child: Icon(
                        Icons.location_city,
                        size: 40.0,
                        color: kDefaultTextColor,
                      ))
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: Center(
                  child: Column(
                    children: [
                      Text(cityName, style: kLocationTextStyle),
                      Text(
                        now.year.toString() +
                            '-' +
                            now.month.toString() +
                            '-' +
                            now.day.toString(),
                        style: kDateTimeStyle,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        dayName[now.weekday].toString(),
                        style: kDateTimeStyle,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          temperature.toInt().toString() + '°',
                          style: kTemperatureTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                            Image.network(
                              'https:' + weatherIconUrl,
                              scale: 0.5,
                            ),
                            Text(
                              condition,
                              style: kDateTimeStyle,
                            )
                          ])),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Color(0x29F9F9F9),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWithIcon(
                                value: humidity,
                                icon: Icons.water_drop,
                                label: 'humidity',
                              ),
                              CustomVD(),
                              TextWithIcon(
                                value: (wind_speed_kmph.toString()),
                                icon: Icons.air,
                                label: 'wind speed',
                              ),
                              CustomVD(),
                              TextWithIcon(
                                value: (pressure.toInt()),
                                icon: Icons.electric_meter,
                                label: 'Pressure',
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//
// double temperature = decodedData['current']['temp_c'];
// String condition = decodedData['current']['condition']['text'];
// String cityName = decodedData['location']['name'];
