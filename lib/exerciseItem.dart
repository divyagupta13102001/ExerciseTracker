import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nirvana/exercises_screen.dart';
import 'models/exercises.dart';
import 'dummy_exercises.dart';

class exerciseItem extends StatelessWidget {
  final String id;
  final String title;
  final int repetitions;
  final String duration;
  final String routine;

  void selectExercise() {}
  exerciseItem({
    required this.id,
    required this.title,
    required this.repetitions,
    required this.duration,
    required this.routine,
  });

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
              title,
              style: TextStyle(
                fontSize: 26,
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
                      Text('$duration')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.repeat),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$repetitions')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
