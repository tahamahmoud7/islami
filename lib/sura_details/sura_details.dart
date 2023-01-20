import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamei/my_theme.dart';
import 'package:islamei/sura_details/aya.dart';


class sura_details_Screen extends StatefulWidget {
  static const String routeName = "sura_details";

  @override
  State<sura_details_Screen> createState() => _sura_details_ScreenState();
}

class _sura_details_ScreenState extends State<sura_details_Screen> {
  List<String> ayaat = [];

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as SuraDetailsArgs;
    if (ayaat.isEmpty) {
      loadFile(args.Index);
    }
    return Stack(children: [
      Image.asset(
        "assets/images/background.png",
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
          appBar: AppBar(
            title: Text(args.SuraName,
                style: Theme.of(context).textTheme.headline1),
          ),
          body: Container(margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(color: MyThemeData.primaryColor, width: 3),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            padding: const EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 25,
            ),
            child: ayaat.length == 0
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    separatorBuilder: (context, index) {
                      return Divider(
                        color: MyThemeData.primaryColor,
                        endIndent: 20,
                        indent: 20,
                      );
                    },
                    itemCount: ayaat.length,
                    itemBuilder: (context, index) {
                      return AyaItem(ayaat[index]);
                    },
                  ),
          ))
    ]);
  }

  void loadFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split('\n');
    print(lines);
    ayaat = lines;
    setState(() {});
  }
}

class SuraDetailsArgs {
  String SuraName;
  int Index;

  SuraDetailsArgs(this.SuraName, this.Index, );
}
