import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/shared/cubit/movie_states.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/shared/network/remote/dio_helper.dart';

class MovieCubit extends Cubit<MovieStates>{
  
  MovieCubit(): super(MovieInitialState());

  List<dynamic> moviesList;
  List<dynamic> suggestionList;
  
 static MovieCubit get(context)=> BlocProvider.of(context);



  void getAllMovies(){
    http.get(Uri.parse('https://yts.mx/api/v2/list_movies.json'))
        .then((value) {
         var jsonResponce = json.decode(value.body);
         moviesList = jsonResponce['data']['movies'];
         //print(moviesList[0]);
          emit(MovieONSuccessDataState());
    }).catchError((error){
      print(error.toString());
      emit(MovieONErrorDataState(error.toString()));

    });
  }
  void getSuggestionMovies(){

    http.get(Uri.parse('https://yts.mx/api/v2/movie_suggestions.json?movie_id=10'))
        .then((value) {
      var jsonResponce = json.decode(value.body);
      suggestionList = jsonResponce['data']['movies'];
      print(suggestionList.length);
      emit(MovieONSuccessSuggestionDataState());
    }).catchError((error){
      print(error.toString());
      emit(MovieONErrorSuggestionDataState(error.toString()));

    });
  }
}