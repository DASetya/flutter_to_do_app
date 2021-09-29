import 'package:flutter/material.dart';

class ToDoDetail extends StatelessWidget {
  const ToDoDetail({Key? key}) : super(key: key);

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
            }, child: Text('BACK'))
          ],
        ),
      ),
    )
    );
  }
}
