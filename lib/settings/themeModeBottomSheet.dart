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
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.ChangeThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "Light",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: provider.mode == ThemeMode.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.BlackColor),
                ),
                const Spacer(),
                Icon(Icons.done,
                    color: provider.mode == ThemeMode.light
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
              provider.ChangeThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Text(
                  "Dark",
                  style: Theme.of(context).textTheme.headline1?.copyWith(
                      color: provider.mode == ThemeMode.dark
                          ? MyThemeData.primaryColor
                          : MyThemeData.BlackColor),
                ),
                const Spacer(),
                Icon(
                  Icons.done,
                  size: 30,
                  color: provider.mode == ThemeMode.dark
                      ? MyThemeData.primaryColor
                      : MyThemeData.BlackColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
