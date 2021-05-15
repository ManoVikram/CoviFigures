import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

import '../../../models/stateCovidCasesData.dart';

part 'covid_cases_india_event.dart';
part 'covid_cases_india_state.dart';

class CovidCasesIndiaBloc
    extends Bloc<CovidCasesIndiaEvent, CovidCasesIndiaState> {
  CovidCasesIndiaBloc() : super(CovidCasesIndiaInitial());

  @override
  Stream<CovidCasesIndiaState> mapEventToState(
    CovidCasesIndiaEvent event,
  ) async* {
    if (event is FetchCovidCasesDataEvent) {
      yield CovidCasesWaiting();
      try {
        final Uri url = Uri.parse(
            "https://covid-api.mmediagroup.fr/v1/cases?country=India");

        final response = await http.get(url);

        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        StateCovidCases stateCovidCases = StateCovidCases(
          state: event.state,
          affected: extractedData[event.state]["confirmed"],
          recovered: extractedData[event.state]["recovered"],
          death: extractedData[event.state]["deaths"],
          lastUpdated: extractedData["Delhi"]["updated"],
        );

        yield CovidCasesDone(
          covidCases: stateCovidCases,
        );
      } catch (_) {
        yield CovidCasesFailure();
      }
    }
  }
}
