import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nirvana/screens/exercises_screen.dart';
import 'package:nirvana/timer.dart';
import '../models/exercises.dart';
import '../models/dummy_exercises.dart';

class exerciseItem extends StatefulWidget {
  final String id;
  final String title;
  final int repetitions;
  final String duration;
  final String routine;
  bool isCompelete;

  exerciseItem({
    required this.id,
    required this.title,
    required this.repetitions,
    required this.duration,
    required this.routine,
    this.isCompelete = false,
  });

  @override
  State<exerciseItem> createState() => _exerciseItemState();
}

class _exerciseItemState extends State<exerciseItem> {
  void selectExercise() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              // softWrap: true,
              // overflow: TextOverflow.fade,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${widget.duration}')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.repeat),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${widget.repetitions}')
                    ],
                  ),
                  // Container(
                  //   height: 20,
                  //   child: CountdownTimer(),
                  // ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: widget.isCompelete,
                          onChanged: (value) {
                            setState(() {
                              widget.isCompelete = value!;
                              Text('Compeleted!');
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
