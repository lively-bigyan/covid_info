import 'package:flutter/material.dart';

final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff434343),
    primaryColor: Color(0xff242224),
    accentColor: Color(0xff242224),
    brightness: Brightness.dark,
    fontFamily: 'Abel',
    hintColor: Colors.white70,
    buttonColor: Color(0xff242224).withOpacity(0.4),
    canvasColor: Color(0xff474547),
    cardColor: Colors.blueGrey,
    textTheme: Typography.blackMountainView.apply(fontFamily: 'Abel').copyWith(
        headline5: TextStyle(
            fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        headline6: TextStyle(
            fontFamily: 'OpenSans',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff4a4a4a)),
        subtitle1: TextStyle(
            fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w500),
        subtitle2: TextStyle(fontSize: 14, color: Color(0xff4a4a4a)),
        bodyText1: TextStyle(fontSize: 14, color: Color(0xff4a4a4a)),
        bodyText2: TextStyle(fontSize: 12)),
    primaryTextTheme:
        Typography.whiteMountainView.apply(fontFamily: 'Montserrat'),
    accentTextTheme: Typography.whiteCupertino.apply(fontFamily: 'Montserrat'),
    bottomAppBarColor: Color(0xff242224));

final lightTheme = ThemeData(
  bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white, elevation: 6, shape: CircularNotchedRectangle()),
  fontFamily: 'Montserrat',
  scaffoldBackgroundColor: Color(0xffF4F6FC),
  primaryColor: Color(0xff0061A5),
  accentColor: Color(0xff333B6D),
  brightness: Brightness.light,
  hintColor: Color(0xffCCCED1),
  canvasColor: Colors.grey[200],
  buttonColor: Colors.grey[300],
  cardColor: Colors.white,
  primaryTextTheme: Typography.whiteMountainView.apply(fontFamily: 'Abel'),
  accentTextTheme: Typography.blackMountainView.apply(fontFamily: 'Abel'),
  textTheme: Typography.blackMountainView.apply(fontFamily: 'Abel').copyWith(
      headline5: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
      headline6: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xff4a4a4a)),
      subtitle1: TextStyle(
          fontFamily: 'OpenSans', fontSize: 16, fontWeight: FontWeight.w500),
      subtitle2: TextStyle(fontSize: 14, color: Color(0xff4a4a4a))
          .copyWith(fontFamily: 'Abel'),
      bodyText1: TextStyle(fontSize: 14, color: Color(0xff4a4a4a)),
      bodyText2: TextStyle(fontSize: 12)),
);
