import 'package:flutter/material.dart';

class MyTheme{


  static final MyTheme instance=MyTheme();

  ThemeData light=ThemeData.light().copyWith(
    buttonTheme: const ButtonThemeData(
        colorScheme:ColorScheme.light(
            background: Colors.orange,
        ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 10,
        color: Colors.blue
      ),
      bodyLarge: TextStyle(
          color: Colors.red,
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Colors.red
      ),
    ),
  );
  ThemeData dark=ThemeData.dark().copyWith(
    buttonTheme: const ButtonThemeData(
      colorScheme:ColorScheme.dark(
        background: Colors.blue,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize:18,
          color: Colors.orange
      ),
      bodyLarge: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold
      ),
      labelLarge: TextStyle(
          fontSize: 16,
          color: Colors.grey
      ),
    ),
  );
}