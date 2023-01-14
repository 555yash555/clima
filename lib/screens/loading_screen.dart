import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:weather_app/services/networking.dart';
import 'location_screen.dart';

String api_key = '086a1344c03a619bc92f33f900395a9a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void get_locationweather() async {
    try {
      Location location = Location();
      await location.get_location();
      String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric';

      Networkingg network = Networkingg(url);
      var data = await network.getdata();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherdata: data,
        );
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    get_locationweather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitDualRing(
          size: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
