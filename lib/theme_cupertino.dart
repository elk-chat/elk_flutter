import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  static String appName = "Social app";

  //Colors for theme
  static Color themeColor = Color(0xff376bfb);
  static Color blue = Color(0xff376bfb);
  static Color red = Color(0xfffc4173);
  static Color green = Color(0xff0fd279);
  static Color cyan = Color(0xff21e7da);
  static Color yellow = Color(0xffffec3d);
  static Color orange = Color(0xfffda929);
  static Color purple = Color(0xffa700fd);

  static Color pageBGColor = Color(0xffeeeeee);
  static Color borderColor = Color(0xffefefef);

  // static Color myBubbleColor = Color(0xff0a8cff);
  static Color myBubbleColor = Color(0xffe1f1ff);
  static Color myBubbleTextColor = Colors.black87;
  
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.blue;
  static Color darkAccent = Colors.blueAccent;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color badgeColor = Colors.red;
  
  static CupertinoThemeData lightTheme = CupertinoThemeData(
    // backgroundColor: lightBG,
    primaryColor: Colors.blue,
    // accentColor: lightAccent,
    // cursorColor: lightAccent,
    barBackgroundColor: Colors.black,
    scaffoldBackgroundColor: lightBG,
    // pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
    // appBarTheme: AppBarTheme(
    //   elevation: 0,
    //   textTheme: TextTheme(
    //     title: TextStyle(
    //       color: darkBG,
    //       fontSize: 18.0,
    //       fontWeight: FontWeight.w800,
    //     ),
    //   ),
    // ),
  );

  static CupertinoThemeData darkTheme = CupertinoThemeData(
    brightness: Brightness.dark,
    // backgroundColor: darkBG,
    primaryColor: darkPrimary,
    // accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent,
    // pageTransitionsTheme: PageTransitionsTheme(builders: _defaultBuilders),
    // appBarTheme: AppBarTheme(
    //   elevation: 0,
    //   textTheme: TextTheme(
    //     title: TextStyle(
    //       color: lightBG,
    //       fontSize: 18.0,
    //       fontWeight: FontWeight.w800,
    //     ),
    //   ),
    // ),
  );
}
