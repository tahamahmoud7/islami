import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                provider.ChangeThemeMode(ThemeMode.light);
                Navigator.pop(context);
              },
              child: showThemeSelected(AppLocalizations.of(context)!.light,
                  provider.mode == ThemeMode.light ? true : false)),
          const SizedBox(
            height: 15,
          ),
          InkWell(
              onTap: () {
                provider.ChangeThemeMode(ThemeMode.dark);
                Navigator.pop(context);
              },
              child: showThemeSelected(AppLocalizations.of(context)!.dark,
                  provider.mode == ThemeMode.light ? false : true)),
        ],
      ),
    );
  }

  Widget showThemeSelected(String text, bool selected) {
    if (selected) {
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
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Dark', style: Theme.of(context).textTheme.bodyText1),
          const Icon(Icons.check),
        ],
      );
    }
  }
}
