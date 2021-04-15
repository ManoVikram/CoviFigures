import 'package:covid19_app/config/constants.dart';
import 'package:covid19_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/symptomCard.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Header(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "about COVID-19",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SymptomCard(
                        symptomTitle: "Headache",
                        image: "assets/images/headache.png",
                        isActive: true,
                      ),
                      SymptomCard(
                        symptomTitle: "Cough",
                        image: "assets/images/cough.png",
                      ),
                      SymptomCard(
                        symptomTitle: "Fever",
                        image: "assets/images/fever.png",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Prevention",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PreventionCard(
                    image: "assets/images/wear_mask.png",
                    title: "Wear Face Mask",
                    description: "Since the start of the Corona virus outbreak, some places have fully embraced wearing face masks.",
                  ),
                  PreventionCard(
                    image: "assets/images/wash_hands.png",
                    title: "Wash Your Hands",
                    description: "Since the start of the Corona virus outbreak, some places have fully embraced wearing face masks.",
                  ),
                  SizedBox(height: 50.0,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset("assets/icons/forward.svg"),
                    ),
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


