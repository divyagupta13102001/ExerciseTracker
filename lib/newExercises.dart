import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class newExercises extends StatefulWidget {
  final Function addEx;
  final String id;
  newExercises(this.addEx, this.id);

  @override
  State<newExercises> createState() => _newExercisesState();
}

class _newExercisesState extends State<newExercises> {
  final idcontroller = TextEditingController();
  final Titlecontroller = TextEditingController();
  final repeatcontroller = TextEditingController();
  final durationcontroler = TextEditingController();
  final routinecontroller = TextEditingController();

  void submitData() {
    final enteredid = idcontroller.text;
    final enteredtitle = Titlecontroller.text;
    final enteredRepeat = int.parse(repeatcontroller.text);
    final enterduration = durationcontroler.text;
    // final enterroutine = routinecontroller.text;
    if (enteredtitle.isEmpty || enteredid.isEmpty) {
      return;
    }
    widget.addEx(
        enteredid, enteredtitle, enteredRepeat, enterduration, widget.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              bottom: 10,
              right: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Id'),
                controller: idcontroller,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: Titlecontroller,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Repetitions'),
                controller: repeatcontroller,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Duration'),
                controller: durationcontroler,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'RoutineId'),
                controller: routinecontroller,
                onSubmitted: (_) => submitData(),
              ),
              ElevatedButton(
                onPressed: submitData,
                child: Text('Add routine'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
