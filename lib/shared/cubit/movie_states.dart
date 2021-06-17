abstract class MovieStates{}

class MovieInitialState extends MovieStates{}

class MovieOnLoadAllDataState extends MovieStates{}

class MovieONSuccessAllDataState extends MovieStates{}



class MovieONSuccessDataState extends MovieStates{}

class MovieONErrorDataState extends MovieStates{
  final String error;

  MovieONErrorDataState(this.error);
}




class MovieONSuccessSuggestionDataState extends MovieStates{}

class MovieONErrorSuggestionDataState extends MovieStates{
  final String error;

  MovieONErrorSuggestionDataState(this.error);
}