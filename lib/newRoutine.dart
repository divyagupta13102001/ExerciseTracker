import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class newRoutine extends StatefulWidget {
  final Function addRo;
  newRoutine(this.addRo);

  @override
  State<newRoutine> createState() => _newRoutineState();
}

class _newRoutineState extends State<newRoutine> {
  final idcontroller = TextEditingController();
  final Titlecontroller = TextEditingController();
  Color _selectedcolor = Colors.orange;

  void submitData() {
    final enteredid = idcontroller.text;
    final enteredtitle = Titlecontroller.text;

    if (enteredtitle.isEmpty || enteredid.isEmpty) {
      return;
    }
    widget.addRo(enteredid, enteredtitle, _selectedcolor);
    Navigator.of(context).pop();
  }

  // void colorpicker() {
  //   BlockPicker(
  //     pickerColor: Colors.red, //default color
  //     onColorChanged: (Color color) {
  //       //on color picked
  //       setState(() {
  //         _selectedcolor = color;
  //       });
  //     },
  //   );
  // }

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
              ElevatedButton(
                child: Text('Color Picker'),
                //   onPressed: colorpicker,
                // ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Pick a color!'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: _selectedcolor, //default color
                              onColorChanged: (Color color) {
                                //on color picked
                                setState(() {
                                  _selectedcolor = color;
                                });
                              },
                            ),
                          ),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Text('DONE'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pop(); //dismiss the color picker
                              },
                            ),
                          ],
                        );
                      });
                },
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
