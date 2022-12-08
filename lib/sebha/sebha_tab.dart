import 'package:flutter/material.dart';
import 'settins_sebha.dart';

class SebhaTab extends StatelessWidget {
  static const String routeName = "sebha";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(children: [
            Image.asset(
              "assets/images/sebha_main_pg.png",
            ),
            SizedBox(
              height: 20,
            ),
            Text("adad el tasbehat",
                style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height:20),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      Color.fromRGBO(183, 148, 96, 1.0))),
              onPressed: () {},
              child: Text(
                "",
                style: TextStyle(color: Color.fromRGBO(122, 92, 58, 1.0)),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {},
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "alhamdalalah",
                      style: TextStyle(color: Colors.white),
                    )),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromRGBO(183, 147, 95, 1.0)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))))),
          ]),
        ),
      ),
    );
  }
}
