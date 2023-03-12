import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nirvana/models/dummy_exercises.dart';
import '../newRoutine.dart';
import '../models/routines.dart';
import 'package:nirvana/models/dummy_exercises.dart';
import 'package:nirvana/widgets/routineItem.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<routine> routines = [];

//function to add new routines
  void _addNewRoutine(String rId, String rtinetitle, Color rtinecolor) {
    final newRo = routine(id: rId, title: rtinetitle, color: rtinecolor);
    setState(() {
      dummy_routines.add(newRo);
    });
  }

//function to start adding new routines
  void _starAddNewRoutine(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            //allows to enter new routines details and add them to function
            child: newRoutine(_addNewRoutine),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Routines'),
        ),
        // grid for showing routine
        body: GridView(
            padding: EdgeInsets.all(10),
            // ignore: sort_child_properties_last
            children: dummy_routines
                .map(
                  (rdata) => RoutineItem(
                    rdata.id,
                    rdata.title,
                    rdata.color,
                  ),
                )
                .toList(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // maxCrossAxisExtent: 200,
              childAspectRatio: 4 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: (() => _starAddNewRoutine(context)),
          child: Icon(Icons.add),
        ));
  }
}
