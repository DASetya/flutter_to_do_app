import 'package:flutter/material.dart';

class ToDo {
  int id;
  String toDoName;
  String toDoDesc;
  String toDoTime;

  ToDo(this.id, this.toDoName, this.toDoDesc, this.toDoTime);
}

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<ToDo> todos = <ToDo>[];
  TextEditingController toDoName = new TextEditingController();
  TextEditingController toDoDesc = new TextEditingController();
  TextEditingController toDoTime = new TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  addToDo() {
    setState(() {
      todos.add(new ToDo(
          todos.length + 1, toDoName.text, toDoDesc.text, toDoTime.text));
      print(todos);
    });
  }

  deleteToDo(index){
    setState((){
      todos.removeWhere((item) => item.id == index);
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
                      TextFormField(
                          controller: toDoDesc,
                          decoration:
                              InputDecoration(hintText: 'Enter Description'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter description';
                            } else {
                              return null;
                            }
                          }),
                      TextFormField(
                          controller: toDoTime,
                          decoration: InputDecoration(hintText: 'Enter Time'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter time';
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
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.date_range),
                                  title: Row(
                                    children: [
                                      Text(
                                        todos[index].toDoName,
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(onPressed: (){
                                        deleteToDo(todos[index].id);
                                      }, icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                ),
                              ],
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
