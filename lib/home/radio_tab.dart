import 'package:flutter/material.dart';
import 'package:islamei/my_theme.dart';

class RadioTab extends StatelessWidget {
  static const String routeName = "radio";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column( mainAxisAlignment: MainAxisAlignment.center,children: [
        Image.asset("assets/images/radio_pg.png"),
        const Center(
          child: Text(
            "radio",
            style: TextStyle(fontSize: 30),
          ),
        ),
        const SizedBox(
          height:20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.keyboard_double_arrow_left, size: 50,color: MyThemeData.primaryColor),
            Icon(Icons.play_arrow, size: 70,color: MyThemeData.primaryColor),
            Icon(
              Icons.keyboard_double_arrow_right,
              size: 50,color: MyThemeData.primaryColor
            )
          ],
        )
      ]),
    );
  }
}
