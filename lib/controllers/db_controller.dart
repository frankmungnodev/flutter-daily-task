import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/database.dart';

class DBController extends GetxController {
  final _database = Get.put(MDatabase());

  Stream<List<Todo>> getAllTodos() {
    return _database.getAllTodos().watch();
  }

  Future<Todo> getTodoById(int id) async {
    return await _database.getTodoById(id).getSingle();
  }

  insertTodo(String title, String? body, int category) async {
    int success = await _database.insertTodo(
        title,
        body,
        category,
        DateTime.now().millisecondsSinceEpoch,
        DateTime.now().millisecondsSinceEpoch);
    debugPrint('Insert todo: $success');
  }

  updateTodo(String title, String? body, int category, int id) async {
    int success = await _database.updateTodoById(
      title,
      body,
      category,
      DateTime.now().millisecondsSinceEpoch,
      id,
    );
    debugPrint('Update todo: $success');
  }

  deleteTodo(int id) async {
    await _database.deleteTodoById(id);
  }
}
