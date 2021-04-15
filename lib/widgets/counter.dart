import 'package:flutter/material.dart';

import '../config/constants.dart';

class Counter extends StatelessWidget {
  final int number;
  final String title;
  final Color color;

  const Counter({
    Key key,
    this.number,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6.0),
          height: 26.0,
          width: 26.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(0.3),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 44.0,
            color: color,
          ),
        ),
        Text(
          title,
          style: kSubTextStyle,
        ),
      ],
    );
  }
}
