import 'package:flutter/material.dart';
import 'package:islamei/hadeth_details/hadeth_details.dart';
import 'package:islamei/home/home_layout.dart';
import 'package:islamei/provider/my_provider.dart';

import 'package:islamei/settings/Settings_tab.dart';
import 'package:islamei/my_theme.dart';
import 'package:islamei/sura_details/sura_details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English, no country code
        Locale('ar'), // Arabic, no country code
      ],
      locale: Locale(provider.languageCode),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
        sura_details_Screen.routeName: ((context) => sura_details_Screen()),
        HadethDetails.routeName: ((context) => HadethDetails()),
        SettingsTab.routName: (context) => SettingsTab(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.mode,
    );
  }
}
