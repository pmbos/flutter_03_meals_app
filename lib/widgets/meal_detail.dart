import 'package:flutter/material.dart';

class MealDetail extends StatelessWidget {
  final IconData icon;
  final String text;

  MealDetail({this.icon, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(
          width: 6,
        ),
        Text(text),
      ],
    );
  }
}
