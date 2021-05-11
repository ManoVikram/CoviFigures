part of 'covid_cases_india_bloc.dart';

abstract class CovidCasesIndiaEvent extends Equatable {
  const CovidCasesIndiaEvent();
}

class FetchCovidCasesDataEvent extends CovidCasesIndiaEvent {
  final String state;

  const FetchCovidCasesDataEvent({
    @required this.state,
  });

  @override
  List<Object> get props => [state];
}
