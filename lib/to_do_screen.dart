import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<String> todos = [];
  TextEditingController toDoName = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  addToDo(){
    setState(() {
      todos.add(toDoName.text);
      print(todos);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                          controller: toDoName,
                          decoration:
                              InputDecoration(hintText: 'Enter Your To Do'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your to do';
                            } else {
                              return null;
                            }
                          }),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                addToDo();
                              }
                            },
                            child: Text('Submit')),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 50.0),
            Expanded(
              child: Card(
                  child: Scrollbar(
                      child: ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Icon(Icons.access_alarm),
                              title: Text(
                                todos[index],
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.cyan,
                        thickness: 2,
                      )
                    ],
                  );
                },
                itemCount: todos.length,
              ))),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //     children: todos.map((e) => new Text(e)).toList(),
            //   ),
            // ),
          ],
        ),
      ),
    ));
  }
}
