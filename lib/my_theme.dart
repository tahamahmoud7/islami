import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MyThemeData {
  static Color colorBlack =  Color.fromRGBO(36, 36, 36, 1.0);
  static Color colorGold =  Color.fromRGBO(183, 147, 95, 1.0);

  static ThemeData ligthTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color:colorBlack ) ,
        backgroundColor: Colors.transparent,
        elevation: 0.0,

        centerTitle: true,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: colorBlack,
          ),
          subtitle1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: colorBlack,
          ),
      headline2: TextStyle(backgroundColor: Color.fromRGBO(122, 92, 58, 1.0))
      ));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      textTheme: const TextTheme(
          headline2: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      )),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor:colorGold,
  unselectedItemColor: Colors.white,
  selectedItemColor:Colors.black)
  );
}
