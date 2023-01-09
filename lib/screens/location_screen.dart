import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:climate/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.locationweather});

  final dynamic locationweather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel wm = WeatherModel();
  int temp = 1;
  int cond = 1;
  String city = 'a', icn = 'b', messg = 'm';

  @override
  void initState() {
    super.initState();
    dynamic decode = widget.locationweather;
    updateUI(decode);
  }

  void updateUI(dynamic decode){
    setState(() {
      if (decode != null){
        double tempt = decode['main']['temp'];
        temp = tempt.toInt();
        cond = decode['weather'][0]['id'];
        city = decode['name'];
        icn = wm.getWeatherIcon(cond);
        messg = wm.getMessage(temp);
      }
    });
  }

  dynamic x = 'a';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TextButton(
                      onPressed: () async {
                        dynamic finalweather = await wm.getWeatherData();
                        updateUI(finalweather);
                      },
                      child: const Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        var typeName = await Navigator.push(context, MaterialPageRoute(builder: (context) => const CityScreen()));
                        if (typeName != x){
                          // //ignore: avoid_print
                          // print(typeName);
                          var cityw = await wm.getCity(typeName);
                          updateUI(cityw);
                        }
                        else {
                          //ignore: avoid_print
                          print('***');
                        }
                      },
                      child: const Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$icn️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  "$messg in $city",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
