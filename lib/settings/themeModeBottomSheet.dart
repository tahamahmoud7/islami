import 'package:flutter/material.dart';
import 'package:islamei/my_theme.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class ShowThemeBottomSheet extends StatefulWidget {
  const ShowThemeBottomSheet({Key? key}) : super(key: key);

  @override
  State<ShowThemeBottomSheet> createState() => _ShowThemeBottomSheetState();
}

class _ShowThemeBottomSheetState extends State<ShowThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Container(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.ChangeThemeMode(ThemeMode.light);
                Navigator.pop(context);
              },
              child: showThemeSelected("Light", ThemeMode.light, context)),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                provider.ChangeThemeMode(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: showThemeSelected("Dark", ThemeMode.dark, context))
        ],
      ),
    );
  }

  Widget? showThemeSelected(
      String text, ThemeMode themeMode, BuildContext context) {
    if (ThemeMode.light == themeMode) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Light',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Theme.of(context).primaryColorDark),
          ),
          Icon(
            Icons.check,
            color: Theme.of(context).primaryColor,
          ),
        ],
      );
    } else {
      const SizedBox(
        height: 10,
      );
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.headline1?.copyWith(
                color: Theme.of(context) == ThemeMode.dark
                    ? MyThemeData.primaryColor
                    : MyThemeData.BlackColor),
          ),
          Icon(Icons.done,
              color: Theme.of(context) == "Dark"
                  ? MyThemeData.primaryColor
                  : MyThemeData.BlackColor),
        ],
      );
    }
  }
}
