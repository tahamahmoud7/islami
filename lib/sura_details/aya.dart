import 'package:flutter/material.dart';

class AyaItem extends StatelessWidget {
  String aya;

  AyaItem(this.aya);

  @override
  Widget build(BuildContext context) {
    return Text(aya,
      style: Theme
          .of(context)
          .textTheme
          .headline1
          ?.copyWith(fontStyle: FontStyle.normal,
          letterSpacing: .2,

      ),
      textAlign: TextAlign.center,);
  }
}
