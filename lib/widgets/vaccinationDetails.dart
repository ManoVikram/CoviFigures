import 'package:flutter/material.dart';

import '../config/constants.dart';

class VaccintionDetails extends StatelessWidget {
  const VaccintionDetails({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 8),
            blurRadius: 24.0,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: Image.asset("assets/images/vaccintion.jpg"),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Get Vaccinated 💉",
              style: kTitleTextstyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(
              "COVID-19 vaccines are safe, and getting vaccinated will help protect you against developing severe COVID-19 disease and dying from COVID-19. You may experience some mild side effects after getting vaccinated, which are signs that your body is building protection.",
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(
              "How long does it take to develop an adequate immune response after receiving the COVID-19 vaccine?",
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Text(
              "Adequate immune response takes 2-3 weeks after completion of entire vaccination schedule i.e., after the second dose of COVISHIELD® and COVAXIN®.",
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 14.0),
            ),
          ),
          /* Expanded(
            flex: 3,
            child: Container(),
          ), */
        ],
      ),
    );
  }
}
