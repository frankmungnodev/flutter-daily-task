import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/db_controller.dart';

import '../database/database.dart';

class HomeScreenController extends GetxController {
  final _dbController = Get.put(DBController());

  var todosItem = <Todo>[].obs;
  var expandedTodos = <int>[].obs;

  @override
  onInit() {
    _listenTodoDataChanges();
    super.onInit();
  }

  toggleExpand(int id) {
    if (expandedTodos.contains(id)) {
      expandedTodos.removeWhere((element) => element == id);
    } else {
      expandedTodos.add(id);
    }
  }

  deleteTodo(int id) async {
    _dbController.deleteTodo(id);
  }

  _listenTodoDataChanges() async {
    _dbController.getAllTodos().listen((todos) {
      debugPrint("Get all todos: ${todos.length}");
      todosItem.clear();
      todosItem.addAll(todos);
    });
  }
}
