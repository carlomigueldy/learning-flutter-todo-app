import 'package:flutter/foundation.dart';
import 'package:todo_app/models/todo.model.dart';
import 'dart:math';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = <Todo>[
    Todo(
        title: 'Create a native mobile app using Flutter',
        description: 'Must be consistent and make time learning flutter.'),
    Todo(
        title: 'Create a todo app using Flutter',
        description: 'Must be consistent and make time learning flutter.'),
    Todo(
        title: 'Just pick one and stay consistent learning it',
        description: 'Must be consistent and make time learning flutter.'),
    Todo(
        title:
            'Don\'t get too overwhelmed when there are many other state management solution in Fluter',
        description: 'Must be consistent and make time learning flutter.'),
    Todo(
        title: 'Enjoy learning Flutter, just like you did with Vue :)',
        description: 'Must be consistent and make time learning flutter.'),
  ];

  get todos => _todos;

  addTodo(Todo todo) {
    this._todos.add(todo);

    print(this._todos);

    notifyListeners();
  }

  removeTodo(Todo todo) {
    this._todos.remove(todo);

    notifyListeners();
  }
}
