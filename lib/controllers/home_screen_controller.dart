import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/utils/status_enum.dart';

import '../database/database.dart';

class HomeScreenController extends GetxController {
  final _database = Get.find<MDatabase>();

  var homeList = <TodosWithStatisticResult>[].obs;

  final _expandedTodo = RxnInt(null);
  get expandedTodo => _expandedTodo;

  @override
  onInit() {
    _listenStatisDataChanges();
    super.onInit();
  }

  toggleExpand(int id) {
    if (id == _expandedTodo.value) {
      _expandedTodo.value = null;
    } else {
      _expandedTodo.value = id;
    }
  }

  setStatus(Status status, int todoId) async {
    var exists =
        await _database.getTodayStatisticOfTodo(todoId).getSingleOrNull();
    if (exists == null) {
      var dateString = DateFormat('yyyy-MM-dd').format(DateTime.now());
      var insertStatistic = await _database.insertStatistic(
        todoId,
        status,
        dateString,
      );
      debugPrint(
        'Insert new statistic status: $insertStatistic, date: $dateString',
      );
    } else {
      debugPrint('Update statistic of todo id: $todoId => $exists');
      updateStatistic(exists.id, exists.progress, status);
    }
  }

  updateStatistic(int statisticId, int progress, Status status) async {
    await _database.updateStatistic(progress, status, statisticId);
  }

  deleteTodo(int id) async {
    var deleteStatistic = await _database.deleteTodoStatistics(id);
    var deleteTodo = await _database.deleteTodoById(id);

    debugPrint('Delete todo statistics status: $deleteStatistic');
    debugPrint('Delete todo status: $deleteTodo');
  }

  _listenStatisDataChanges() async {
    _database.todosWithStatistic().watch().listen((list) {
      debugPrint('Todo changes total: ${list.length}');
      homeList.clear();
      homeList.addAll(list);
    });
  }
}
