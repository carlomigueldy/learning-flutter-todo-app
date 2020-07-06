import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo.provider.dart';
import 'package:todo_app/screens/create-todo.screen.dart';
import 'package:todo_app/screens/home.screen.dart';

void main() => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>.value(value: TodoProvider())
      ],
      child: MaterialApp(
          title: 'Todo App',
          theme: ThemeData(primarySwatch: Colors.indigo),
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
            '/todos/create': (context) => CreateTodoScreen()
          }),
    ));
