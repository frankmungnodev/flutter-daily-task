import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/database/database.dart';

class HomeController extends GetxController {
  final MDatabase _database = Get.put(MDatabase());

  var expandedTodos = <int>[].obs;
  var todosItem = <Todo>[].obs;

  @override
  onInit() {
    super.onInit();
    getAllTodosFromDatabse();
  }

  insertTodo() async {
    int success = await _database.insertTodo(
      "Todo",
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      null,
      DateTime.now().millisecondsSinceEpoch,
    );
    debugPrint('Insert state: $success');
  }

  getAllTodosFromDatabse() async {
    _database.getAllTodos().watch().listen((todos) {
      debugPrint("Get all todos: ${todos.length}");
      todosItem.clear();
      todosItem.addAll(todos);
    });
  }

  deleteTodo(int id) async {
    _database.deleteTodoById(id);
  }

  toggleExpand(int id) {
    if (expandedTodos.contains(id)) {
      expandedTodos.removeWhere((element) => element == id);
    } else {
      expandedTodos.add(id);
    }
  }
}
