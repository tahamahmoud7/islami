import 'package:flutter/material.dart';
import 'package:islamei/hadeth_details/ahadeth_tab.dart';
import 'package:islamei/my_theme.dart';

class HadethDetails extends StatelessWidget {
  static const String routeName = "HadethDetails";

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethDate;
    return Stack(children: [
      Image.asset(
        "assets/images/background.png",
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(args.title, style: Theme.of(context).textTheme.headline2),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
          decoration: BoxDecoration(color: Colors.blueGrey,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              border: Border.all(
                color: MyThemeData.primaryColor,width: 2
              )),
          child: ListView.builder(
              itemCount: args.content.length,
              itemBuilder: ((context, index) {
                return Text(args.content[index],
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.center);
              })),
        ),
      )
    ]);
  }
}
