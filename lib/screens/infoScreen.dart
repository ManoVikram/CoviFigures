import 'package:covid19_app/config/constants.dart';
import 'package:covid19_app/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/symptomCard.dart';
import '../widgets/preventionCard.dart';

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




