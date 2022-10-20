import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/components/todo_item.dart';
import 'package:todo_list/database/database.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final _database = MDatabase();
  List<Widget> _todoItems = [];

  _insertTodo() async {
    int success = await _database.insertTodo(
      "Todo",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      null,
      DateTime.now().millisecondsSinceEpoch,
    );
    debugPrint('Insert state: $success');
  }

  _deleteTodoById(int id) async {
    int success = await _database.deleteTodoById(id);
    debugPrint('Delete state: $success');
  }

  _getAllTodos() async {
    _database.getAllTodos().watch().listen((event) {
      debugPrint('Get all todos: ${event.length}');
      setState(() {
        _todoItems = event
            .map(
              (todo) => TodoItem(
                todo: todo,
                deleteTodo: (id) => _deleteTodoById(id),
              ),
            )
            .toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getAllTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Text(
                'Todos',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            ..._todoItems,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _insertTodo();
        },
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
