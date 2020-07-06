import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.model.dart';
import 'package:todo_app/providers/todo.provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    List<Todo> todos = todoProvider.todos;

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed('/todos/create'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCardListItem(
                    todo: todos[index], todoProvider: todoProvider);
              }),
        ),
      ),
    );
  }
}

class TodoCardListItem extends StatelessWidget {
  const TodoCardListItem({
    Key key,
    @required this.todo,
    @required this.todoProvider,
  }) : super(key: key);

  final Todo todo;
  final TodoProvider todoProvider;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: 80,
        child: Center(
          child: ListTile(
              contentPadding: EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              leading: FlutterLogo(),
              title: Text(
                todo.title,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => DeleteConfirmationDialog(
                        todoProvider: todoProvider, todo: todo)),
                icon: Icon(Icons.more_vert),
              ),
              onTap: () => print('tapped body')),
        ),
      ),
    );
  }
}

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog({
    Key key,
    @required this.todoProvider,
    @required this.todo,
  }) : super(key: key);

  final TodoProvider todoProvider;
  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure you want to delete this todo?'),
      content: Text(
          'This action is irreversible because I have not implemented the functionality for that. :)'),
      actions: [
        FlatButton(
            onPressed: () => Navigator.pop(context), child: Text('CANCEL')),
        FlatButton(
          onPressed: () {
            todoProvider.removeTodo(todo);

            Navigator.pop(context);
          },
          child: Text('REMOVE'),
        ),
      ],
    );
  }
}
