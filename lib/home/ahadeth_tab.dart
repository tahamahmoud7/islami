import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamei/hadeth_details/hadeth_details.dart';
import 'package:islamei/my_theme.dart';

class AhadethTab extends StatefulWidget {
  static const String routeName = "Ahadeth";

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<HadethDate> Ahadeth = [];

  @override
  Widget build(BuildContext context) {
    if (Ahadeth.isEmpty) loadHadethFile();
    return Scaffold(
      body: Column(children: [
        Image.asset("assets/images/image_ahades.png"),
        Divider(
          color: MyThemeData.colorGold,
          indent: 10,
          height: 9,
          endIndent: 10,thickness: 3,
        ),
        Text(
          "Ahadeth",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Divider(
          color: MyThemeData.colorGold,
          indent: 10,
          height: 20,thickness: 3,
          endIndent: 10,
        ),
        Ahadeth.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.colorGold,
                  ),
                  itemCount: Ahadeth.length,
                  itemBuilder: (context, index) {
                    return InkWell(onTap: (){
                      Navigator.pushNamed(context, HadethDetails.routeName,
                      arguments: Ahadeth[index]);
                    },
                      child: Text(
                        Ahadeth[index].title,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              )
      ]),
    );
  }

  void loadHadethFile() async {
    String content = await rootBundle.loadString("assets/files/ahadeth .txt");
    List<String> AllAhadeth = content.trim().split('#\r\n');
    //for loop
    for (int i = 0; i < AllAhadeth.length; i++) {
      String hadeth = AllAhadeth[i];
      print(hadeth);

      List<String> HadethLiens = hadeth.split('\n');
      String title = HadethLiens[0];
      HadethLiens.removeAt(0);
      HadethDate hadethDate = HadethDate(title, HadethLiens);
      Ahadeth.add(hadethDate);
      setState(() {});

    }
  }
}

class HadethDate {
  String title;
  List<String> content;

  HadethDate(this.title, this.content);
}
