import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'network.dart';
import 'dart:convert';
import 'LocationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class myapp extends StatefulWidget {
  const myapp({Key? key}) : super(key: key);

  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  Position? position;
  double? lat;
  double? lon;

  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    permission = await Geolocator.requestPermission();

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    lat = position!.latitude;
    lon = position!.longitude;
    networkhelper helper = networkhelper(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?units=metric&lat=$lat&lon=$lon&appid=931e8bdeccb205992200128a5f3a3e95'));

    var weatherdata = await helper.getdata();
    print(weatherdata);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherdata);
    }));
  }

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:
            Center(child: SpinKitDoubleBounce(color: Colors.white, size: 50)),
      ),
    );
  }
}
