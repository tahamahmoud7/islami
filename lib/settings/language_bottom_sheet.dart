import 'package:flutter/material.dart';
import 'package:islamei/my_theme.dart';
import 'package:islamei/provider/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeLanuage("en");
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "English",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: provider.languageCode == "en"
                          ? MyThemeData.primaryColor
                          : MyThemeData.BlackColor),
                ),
                const Spacer(),
                Icon(Icons.done,
                    color: provider.languageCode == "en"
                        ? MyThemeData.primaryColor
                        : MyThemeData.BlackColor),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              provider.ChangeLanuage("ar");
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "Arabic",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: provider.languageCode == "ar"
                          ? MyThemeData.primaryColor
                          : MyThemeData.BlackColor),
                ),
                const Spacer(),
                Icon(
                  Icons.done,
                  size: 30,
                  color:  provider.languageCode == "ar"
                        ? MyThemeData.primaryColor: MyThemeData.BlackColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
