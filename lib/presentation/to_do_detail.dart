import 'package:flutter/material.dart';
import 'package:flutter_day3/model/to_do.dart';

class ToDoDetail extends StatelessWidget {
  final ToDo toDo;
  const ToDoDetail({Key? key, required this.toDo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Detail'),),
      body: Container(
        child: Column(
          children: [
            Text('Detail'),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text('BACK')),
            Text(toDo.toDoName),
            Text(toDo.toDoDesc),
            Text(toDo.toDoTime),
          ],
        ),
      ),
    )
    );
  }
}
