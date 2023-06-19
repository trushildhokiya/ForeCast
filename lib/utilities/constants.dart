import 'package:flutter/material.dart';

const kGradientButtonStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w600,
  color: Color(0xFFBBD6FD),
  fontFamily: 'Poppins',
);

const kLargeButtonTextStyle = TextStyle(
    color: Color(0xFFBBD6fD),
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 25.0);

const kDateTimeStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w800,
);

const kTemperatureTextStyle = TextStyle(
    fontSize: 100, fontWeight: FontWeight.bold, fontFamily: 'Poppins');

const kClimateIconStyle = TextStyle(
  fontSize: 75,
);
const kTextInfoStyle = TextStyle(fontSize: 30.0, fontFamily: 'Poppins');

const kLocationTextStyle = TextStyle(
    fontSize: 30.0,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
    color: Colors.white);

const kInputDecorationStyle = InputDecoration(
    icon: Icon(
      Icons.location_city_rounded,
      color: Colors.white,
    ),
    fillColor: Colors.white,
    filled: true,
    hintText: 'Enter city name',
    hintStyle: TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(100))));

const kDefaultTextColor = Color(0xFFBBD6fD);
const kBackArrowIconColor = Color(0xFF8b8bdb);
