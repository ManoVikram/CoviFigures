import 'package:flutter/material.dart';

class StateCovidCases {
  final String state;
  final int affected;
  final int recovered;
  final int death;

   StateCovidCases({
    @required this.state,
    @required this.affected,
    @required this.recovered,
    @required this.death,
  });
}
