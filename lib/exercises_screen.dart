import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nirvana/dummy_exercises.dart';
import 'package:nirvana/exerciseItem.dart';
import 'package:nirvana/models/exercises.dart';
import 'package:nirvana/models/routines.dart';
import 'package:nirvana/newExercises.dart';

class exercisesScreen extends StatefulWidget {
  static const routeName = '/exercises-screen';
  final List<exercices> availableExercises;
  exercisesScreen(this.availableExercises);

  @override
  State<exercisesScreen> createState() => _exercisesScreenState();
}

class _exercisesScreenState extends State<exercisesScreen> {
  void _addNewExercises(String eid, String etitle, int erepetitions,
      String eduration, String eroutine) {
    final newEx = exercices(
        id: eid,
        title: etitle,
        repetitions: erepetitions,
        duration: eduration,
        routine: eroutine);
    setState(() {
      dummy_exercises.add(newEx);
    });
  }

  void _starAddnewExercises(BuildContext ctx, String rId) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: newExercises(_addNewExercises, rId),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final routeargs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final routineTitle = routeargs['title'];
    final routineId = routeargs['id'];
    final displayed = widget.availableExercises.where((Exercises) {
      return Exercises.routine.contains(routineId.toString());
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(routineTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return exerciseItem(
                id: displayed[index].id,
                title: displayed[index].title,
                repetitions: displayed[index].repetitions,
                duration: displayed[index].duration,
                routine: displayed[index].routine);
          },
          itemCount: displayed.length,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          onPressed: (() => _starAddnewExercises(context, routineId!)),
          child: Icon(Icons.add),
        ));
  }
}
