import 'dart:convert';
import 'package:flutter/material.dart';
import 'weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  double? temperature;
  String? cityName;
  String? weatherIcon;
  String? weatherMsg;

  @override
  void initState() {
    super.initState();
    print(widget.locationWeather);
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic locationWeather) {
    temperature = locationWeather['main']['temp'];

    var weathercode = locationWeather['weather'][0]['id'];
    weatherIcon = weatherModel.getWeatherIcon(weathercode);

    cityName = locationWeather['name'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'Current Weather App',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {},
                    child: Icon(
                      Icons.near_me,
                      size: 60.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {},
                    child: Icon(
                      Icons.location_city,
                      size: 60.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                    ),
                    Text(
                      "$weatherIcon",
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  'Weather of $cityName!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
