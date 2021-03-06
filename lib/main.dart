import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/shared/bloc_observer.dart';
import 'package:movie_app/shared/style/themes.dart';

import 'modules/home/home_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: defaultTheme,
      home: HomeScreen(),
    );
  }
}

