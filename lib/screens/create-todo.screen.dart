import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.model.dart';
import 'package:todo_app/providers/todo.provider.dart';

class CreateTodoScreen extends StatefulWidget {
  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    final _formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.all(10.0),
            child: Form(
              autovalidate: true,
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    controller: titleController,
                    autocorrect: false,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                        hintText: 'What are you doing?',
                        helperText: 'Required'),
                    validator: (value) {
                      return value.isEmpty ? 'This field is required.' : null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextFormField(
                      controller: descriptionController,
                      autocorrect: false,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Description',
                          helperText: 'Optional'),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50.0,
                    child: RaisedButton(
                      color: Colors.indigo,
                      child: Text(
                        'Add Todo',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Todo todo = Todo(
                              title: titleController.text,
                              description: descriptionController.text);

                          todoProvider.addTodo(todo);

                          Navigator.pop(context);
                        }
                      },
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
