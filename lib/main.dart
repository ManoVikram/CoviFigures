import 'package:covid19_app/business_logic/blocs/covidCasesIndiaBloc/covid_cases_india_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './screens/homeScreen.dart';

import './config/constants.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CovidCasesIndiaBloc>(
      create: (_) => CovidCasesIndiaBloc(),
      child: MaterialApp(
        title: "COVID 19",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme: TextTheme(
            bodyText1: TextStyle(
              color: kBodyTextColor,
            ),
          ),
        ),
        home: Covid19(),
      ),
    );
  }
}

class Covid19 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}

void main() {
  runApp(MyApp());
}
