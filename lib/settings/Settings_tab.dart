import 'package:flutter/material.dart';
import 'package:islamei/my_theme.dart';
import 'package:islamei/provider/my_provider.dart';
import 'package:islamei/settings/language_bottom_sheet.dart';
import 'package:islamei/settings/themeModeBottomSheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatelessWidget {
  static const String routName = "Settings";

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "Language",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: MyThemeData.primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            showLanguageBottomSheet(context);
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyThemeData.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(pro.languageCode == "en" ? "English" : "Arabic",
                style: Theme.of(context).textTheme.subtitle1),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Theme",
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(color: MyThemeData.primaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            showThemeModeBottomSheet(context);
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              border: Border.all(
                color: MyThemeData.primaryColor,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(pro.mode == ThemeMode.light ? "Light" : "Dark",
                style: Theme.of(context).textTheme.subtitle1),

          ),
        ),

      ]),
    );
  }

  void showThemeModeBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return  ShowThemeBottomSheet();
      },
    );
  }

  void showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const LanguageBottomSheet();
      },
    );
  }
}
