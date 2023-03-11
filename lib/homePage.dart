import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nirvana/dummy_exercises.dart';
import 'newRoutine.dart';
import 'models/routines.dart';
import 'package:nirvana/routineItem.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final List<routine> routines = [];

  void _addNewRoutine(String rId, String rtinetitle, Color rtinecolor) {
    final newRo = routine(id: rId, title: rtinetitle, color: rtinecolor);
    setState(() {
      dummy_routines.add(newRo);
    });
  }

  void _starAddNewRoutine(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: newRoutine(_addNewRoutine),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
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
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
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
