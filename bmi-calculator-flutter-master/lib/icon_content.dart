import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.icons, this.title);
  final IconData icons;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          this.icons,
          size: 80.0,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          this.title,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
