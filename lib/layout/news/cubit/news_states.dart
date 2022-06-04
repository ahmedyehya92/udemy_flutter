abstract class NewsState{}

class NewsInitialState extends NewsState {}

class BottomNaveChangeState extends NewsState {}

class GetBusinessNewsLoadingState extends NewsState {}

class GetBusinessNewsSuccessState extends NewsState {}

class GetBusinessNewsFailureState extends NewsState {
  final String error;

  GetBusinessNewsFailureState(this.error);
}

class SearchNewsLoadingState extends NewsState {}

class SearchNewsSuccessState extends NewsState {}

class SearchNewsFailureState extends NewsState {
  final String error;

  SearchNewsFailureState(this.error);
}