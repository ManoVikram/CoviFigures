import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/header.dart';
import '../widgets/countryDropdownBox.dart';
import '../widgets/counter.dart';
import '../widgets/preventionCard.dart';
import '../widgets/footer.dart';
import '../widgets/vaccinationDetails.dart';
import '../business_logic/blocs/covidCasesIndiaBloc/covid_cases_india_bloc.dart';

import '../config/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Future<void> _launchURL(String url) async => await canLaunch(url)
        ? await launch(url)
        : throw 'Could not launch $url';

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Header(
              image: "assets/icons/Drcorona.svg",
              textTop: "All you need is",
              textBottom: "stay at home.",
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              height: 60.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26.0),
                border: Border.all(
                  color: Color(0xFFE5E5E5),
                ),
              ),
              child: CountryDropdownBox(),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      BlocBuilder<CovidCasesIndiaBloc, CovidCasesIndiaState>(
                        builder: (context, state) {
                          if (state is CovidCasesDone) {
                            return RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Case Update\n",
                                      style: kTitleTextstyle),
                                  TextSpan(
                                    text:
                                        "Last Updated ${state.covidCases.lastUpdated}",
                                    style: TextStyle(color: kTextLightColor),
                                  ),
                                ],
                              ),
                            );
                          } else if (state is CovidCasesWaiting) {
                            return Container();
                          } else {
                            return Center(
                              child: Text("ERROR"),
                            );
                          }
                        },
                      ),
                      Spacer(),
                      /* Text(
                        "See Details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ), */
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 30.0,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child:
                        BlocBuilder<CovidCasesIndiaBloc, CovidCasesIndiaState>(
                      builder: (context, state) {
                        if (state is CovidCasesWaiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is CovidCasesDone) {
                          return SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Counter(
                                  // number: 1807,
                                  number: state.covidCases.affected,
                                  title: "Infected",
                                  color: kInfectedColor,
                                ),
                                SizedBox(
                                  width: size.width * 0.1,
                                ),
                                Counter(
                                  // number: 102,
                                  number: state.covidCases.death,
                                  title: "Deaths",
                                  color: kDeathColor,
                                ),
                                SizedBox(
                                  width: size.width * 0.05,
                                ),
                                Counter(
                                  // number: 204,
                                  number: state.covidCases.recovered,
                                  title: "Recovered",
                                  color: kRecovercolor,
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Center(
                            child: Text(
                                "Error while fetching data. Try again later."),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Safety Measures",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  PreventionCard(
                    image: "assets/images/wear_mask.png",
                    title: "Wear Face Mask 😷",
                    description:
                        "Masks should be used as part of a comprehensive strategy of measures to suppress transmission and save lives.",
                  ),
                  PreventionCard(
                    image: "assets/images/wash_hands.png",
                    title: "Wash Your Hands 🧼",
                    description:
                        "To stop the spread of COVID-19, the practice of handwashing at regular intervals is a must.",
                  ),
                  VaccintionDetails(),
                  SizedBox(
                    height: 10.0,
                  ),
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Spread of Virus",
                        style: kTitleTextstyle,
                      ),
                      Text(
                        "See Details",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0),
                    padding: EdgeInsets.all(20.0),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 30.0,
                          color: kShadowColor,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/images/map.png",
                      fit: BoxFit.contain,
                    ),
                  ), */
                ],
              ),
            ),
            Divider(),
            Footer(
              urlLauncher: _launchURL,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}




