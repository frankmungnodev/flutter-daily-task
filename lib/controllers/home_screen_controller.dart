import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/db_controller.dart';
import 'package:todo_list/ui/models/todo_statics.dart';
import 'package:todo_list/utils/status_enum.dart';

import '../database/database.dart';

class HomeScreenController extends GetxController {
  final _dbController = Get.put(DBController());

  var todoStatistic = <TodoStatics>[].obs;
  final _expandedTodo = RxnInt(null);
  get expandedTodo => _expandedTodo;

  @override
  onInit() {
    super.onInit();
    _listenTodoDataChanges();
  }

  toggleExpand(int id) {
    if (id == _expandedTodo.value) {
      _expandedTodo.value = null;
    } else {
      _expandedTodo.value = id;
    }
  }

  deleteTodo(int id) async {
    _dbController.deleteTodo(id);
  }

  setStatus(Status status, int id) async {
    _dbController.updateTodoStatus(status, id);
  }

  _listenTodoDataChanges() async {
    _dbController.getTodoStatics().listen((types) {
      debugPrint("Get all todos: ${types.length}");
      todoStatistic.clear();
      todoStatistic.addAll(
        types.map(
          (type) => TodoStatics(
            type.readTable(
              Todos(Get.find<MDatabase>()),
            ),
            type.readTableOrNull(
              Statistics(Get.find<MDatabase>()),
            ),
          ),
        ),
      );
    });
  }
}
