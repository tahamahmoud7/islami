import 'package:flutter/material.dart';
import 'package:islamei/sura_details/sura_details.dart';

class sura_items extends StatelessWidget {
static const String routeName="sura_items";
String Name;
int index;
sura_items(this.Name,this.index);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
 Navigator.pushNamed(context,sura_details_Screen.routeName,arguments: SuraDetailsArgs(Name, index) );
      },
      child:
      Text(Name,
      textAlign: TextAlign.center,
      style:Theme.of(context).textTheme.subtitle1,),);
  }
}
