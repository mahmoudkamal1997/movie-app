import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';


ThemeData defaultTheme = ThemeData(
  primarySwatch: defaultColor,
  scaffoldBackgroundColor: HexColor('2B3856'),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('2B3856'),
      statusBarIconBrightness: Brightness.light),
    backgroundColor: HexColor('2B3856'),
    elevation: 0.0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 24.0,
      color: Colors.white,
      fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(
     color: Colors.white,
    ),
  ),

  );

