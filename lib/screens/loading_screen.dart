import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climate/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double longitude = 1.1, latitude = 1.1;

  @override
  void initState() {
    super.initState();
    getLocationdata();
  }

  void getLocationdata() async {
    WeatherModel wm = WeatherModel();
    dynamic weatherData = await wm.getWeatherData();

    if (! mounted) return;
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationweather: weatherData,)));
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 100.0,
        ),
        ),
      );
  }
}
