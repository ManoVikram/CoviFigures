import 'package:flutter/material.dart';

class StateCovidCases {
  final String state;
  final int affected;
  final int recovered;
  final int death;
  final String lastUpdated;

  StateCovidCases({
    @required this.state,
    @required this.affected,
    @required this.recovered,
    @required this.death,
    @required this.lastUpdated,
  });
}
