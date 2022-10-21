import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../database/database.dart';

class DBController extends GetxController {
  final _database = Get.put(MDatabase());

  Stream<List<Todo>> getAllTodos() {
    return _database.getAllTodos().watch();
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

  deleteTodo(int id) async {
    _database.deleteTodoById(id);
  }
}
