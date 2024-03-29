import 'package:flutter/material.dart';
import 'package:islamei/radio/radio_tab.dart';
import 'package:islamei/provider/my_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../hadeth_details/ahadeth_tab.dart';
import '../quran/quran_tab.dart';
import '../sebha/sebha_tab.dart';
import '../settings/Settings_tab.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(
          pro.getBackGeoundImage(),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.islamiTitle,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Theme.of(context).primaryColor,
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                currentIndex = index;
                setState(() {});
              },
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/quran.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/sebha.png')),
                    label: AppLocalizations.of(context)!.tsbeh),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/ahadeth.png')),
                    label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/radio.png')),
                    label: AppLocalizations.of(context)!.radio),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings),
              ],
            ),
          ),
          body: tabs[currentIndex],
        )
      ],
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    AhadethTab(),
    RadioTab(),
    const SettingsTab(),
  ];
}
