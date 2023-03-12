import 'package:flutter/material.dart';
import 'package:nirvana/models/dummy_exercises.dart';
import 'package:nirvana/screens/exercises_screen.dart';
import 'package:nirvana/screens/homePage.dart';
import 'package:nirvana/models/exercises.dart';
import 'package:nirvana/models/routines.dart';
import 'package:nirvana/newRoutine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  List<exercices> _availableExercises = dummy_exercises;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nirvana',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      //adding routes to my different screens
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        exercisesScreen.routeName: (context) =>
            exercisesScreen(_availableExercises)
      },
    );
  }
}
