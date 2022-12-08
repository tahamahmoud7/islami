import 'package:flutter/material.dart';
import 'package:islamei/home/ahadeth_tab.dart';
import 'package:islamei/quran/quran_tab.dart';
import 'package:islamei/home/radio_tab.dart';
import 'package:islamei/sebha/sebha_tab.dart';
import 'package:islamei/my_theme.dart';

import 'Settings_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/background.png",
        fit: BoxFit.fill,
        width: double.infinity,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text("Islami", style: Theme.of(context).textTheme.headline1),
        ),
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (Index) {
              currentIndex = Index;

              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/quran.png"),
                    size: 35),
                label: 'Quran',
                backgroundColor: MyThemeData.colorGold,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/sebha.png"),
                    size: 35),
                label: 'sebha',
                backgroundColor: MyThemeData.colorGold,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/ahadeth.png"),
                    size: 35),
                label: 'ahadeth',
                backgroundColor: MyThemeData.colorGold,
              ),
              BottomNavigationBarItem(
                icon: const ImageIcon(AssetImage("assets/images/radio.png"),
                    size: 35),
                label: 'Radio',
                backgroundColor: MyThemeData.colorGold,
              ),
              BottomNavigationBarItem(
                  icon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        size: 35,
                      )),label:"Settings")
            ]),
      ),
    ]);
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    AhadethTab(),
    RadioTab(),
    SettingsTab(),
  ];
}
