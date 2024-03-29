import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 55.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 75.0,
);

const kinputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.location_city, size: 40.0, color: Colors.white,),
  hintText: 'Enter the city name',
  hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
);
