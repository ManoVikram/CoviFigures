import 'package:flutter/material.dart';

import '../config/constants.dart';

class SymptomCard extends StatelessWidget {
  final String symptomTitle;
  final String image;
  final bool isActive;

  const SymptomCard({
    Key key,
    this.symptomTitle,
    this.image,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.white,
        boxShadow: [
          isActive
              ? BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 20.0,
                  color: kActiveShadowColor,
                )
              : BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 6.0,
                  color: kShadowColor,
                ),
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 90.0,
          ),
          Text(
            symptomTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
