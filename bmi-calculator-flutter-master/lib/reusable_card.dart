import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.childCard});

  final Color colour;
  final Widget childCard;
  // final Function onPress;
  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   // onTap: onPress(),
    //   child:
    return Container(
      child: childCard,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
    // );
  }
}
