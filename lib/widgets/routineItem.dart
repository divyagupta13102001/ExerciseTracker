import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/screens/exercises_screen.dart';
import 'package:nirvana/screens/homePage.dart';

class RoutineItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  RoutineItem(this.id, this.title, this.color);
// takes the arguments to show the exercises of selected routines
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(exercisesScreen.routeName, arguments: {
      'id': id,
      'title': title,
    });
  }

//styling how my routines will look making them all clickable
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            // Theme.of(context).textTheme.titleMedium,)
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
