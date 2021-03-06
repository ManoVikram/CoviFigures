import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/constants.dart';

class PreventionCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  
  const PreventionCard({
    Key key, this.image, this.title, this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 160.0,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 136.0,
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
            ),
            Image.asset(image),
            Positioned(
              left: 130.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                height: 140.0,
                width: MediaQuery.of(context).size.width - 170,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kTitleTextstyle.copyWith(fontSize: 16.0),
                    ),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    /* Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ), */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}