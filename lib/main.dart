import 'package:flutter/material.dart';
import 'package:islamei/home/HomeScreen.dart';
import 'package:islamei/my_theme.dart';
import 'package:islamei/sura_details/sura_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (context) => HomeScreen(),
        sura_details_Screen.routeName:((context) => sura_details_Screen())
    },
theme: MyThemeData.ligthTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.light ,
    );
  }
}
