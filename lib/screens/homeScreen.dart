import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/header.dart';
import '../widgets/countryDropdownBox.dart';
import '../widgets/counter.dart';
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
                children: [
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: "Case Update\n", style: kTitleTextstyle),
                            TextSpan(
                              text: "Newest Update April 15 2021",
                              style: TextStyle(color: kTextLightColor),
                            ),
                          ],
                        ),
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
                  Row(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
