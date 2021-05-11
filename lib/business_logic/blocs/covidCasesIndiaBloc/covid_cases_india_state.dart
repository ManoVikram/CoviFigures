part of 'covid_cases_india_bloc.dart';

abstract class CovidCasesIndiaState extends Equatable {
  const CovidCasesIndiaState();

  @override
  List<Object> get props => [];
}

class CovidCasesIndiaInitial extends CovidCasesIndiaState {}

class CovidCasesWaiting extends CovidCasesIndiaState {}

class CovidCasesDone extends CovidCasesIndiaState {
  final StateCovidCases covidCases;

  CovidCasesDone({
    this.covidCases,
  });

  @override
  List<Object> get props => [covidCases];
}

class CovidCasesFailure extends CovidCasesIndiaState {}
