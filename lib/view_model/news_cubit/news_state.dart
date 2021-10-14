abstract class NewsState {}

class NewsInitialState extends NewsState {}

class NewsLoadState extends NewsState {}

class NewsSuccessState extends NewsState {}

class NewsErrorState extends NewsState {}

// class NewsLoadPageState extends NewsState {}
//
// class NewsSuccessPageState extends NewsState {}
//
// class NewsErrorPageState extends NewsState {
//   dynamic error;
//   NewsErrorPageState(this.error);
// }
