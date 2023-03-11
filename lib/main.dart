import 'package:flutter/material.dart';
import 'package:nirvana/dummy_exercises.dart';
import 'package:nirvana/exercises_screen.dart';
import 'package:nirvana/homePage.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        exercisesScreen.routeName: (context) =>
            exercisesScreen(_availableExercises)
      },
    );
  }
}

// class Myhomepage extends StatefulWidget {
//   const Myhomepage({super.key});

//   @override
//   State<Myhomepage> createState() => _MyhomepageState();
// }

// class _MyhomepageState extends State<Myhomepage> {
//   final List<routine> _userRoutine = [];

//   void _addNewRoutine(String rId, String rtinetitle, Color rtinecolor) {
//     final newRo = routine(id: rId, title: rtinetitle);
//     setState(() {
//       _userRoutine.add(newRo);
//     });
//   }

//   void _starAddNewRoutine(BuildContext ctx) {
//     showModalBottomSheet(
//         context: ctx,
//         builder: (_) {
//           return GestureDetector(
//             onTap: () {},
//             child: newRoutine(_addNewRoutine),
//             behavior: HitTestBehavior.opaque,
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FloatingActionButton(
//       onPressed: (() => _starAddNewRoutine(context)),
//       child: Icon(Icons.add),
//     );
//   }
// }
