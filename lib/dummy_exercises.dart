import 'package:nirvana/models/exercises.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/models/routines.dart';

var dummy_routines = [
  routine(id: 'r1', title: 'Yoga', color: Colors.purple),
  routine(
    id: 'r2',
    title: 'Strength training',
    color: Colors.red,
  ),
  routine(id: 'r3', title: 'Cardio', color: Colors.orange)
];

var dummy_exercises = [
  exercices(
      id: 'e1',
      title: 'Body Weight squats',
      repetitions: 30,
      duration: '30sec',
      routine: 'r2'),
  exercices(
      id: 'e2',
      title: 'Push Ups',
      repetitions: 30,
      duration: '30sec',
      routine: 'r2'),
  exercices(
      id: 'e3',
      title: 'Jump Ups',
      repetitions: 30,
      duration: '30sec',
      routine: 'r2'),
  exercices(
      id: 'e4',
      title: 'Plank Pose',
      repetitions: 3,
      duration: '60sec',
      routine: 'r1'),
  exercices(
      id: 'e5',
      title: 'Tree pose',
      repetitions: 3,
      duration: '60sec',
      routine: 'r1'),
  exercices(
      id: 'e6',
      title: 'Triangle pose',
      repetitions: 3,
      duration: '60sec',
      routine: 'r1'),
  exercices(
      id: 'e7',
      title: 'Running',
      repetitions: 6,
      duration: '5min',
      routine: 'r3'),
  exercices(
      id: 'e8',
      title: 'Skipping',
      repetitions: 10,
      duration: '5min',
      routine: 'r3'),
];
