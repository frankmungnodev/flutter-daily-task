import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_list/utils/count_down.dart';
import 'package:todo_list/utils/extension_todo_with_statis.dart';
import 'package:todo_list/utils/status_enum.dart';

import '../database/database.dart';

class HomeScreenController extends GetxController {
  final _database = Get.find<MDatabase>();
  final _countdown = Get.find<CountDown>();

  final _expandedTodo = RxnInt(null);
  get expandedTodo => _expandedTodo;

  late final DateTime _today;

  var homeList = <TodosWithStatisticResult>[].obs;

  @override
  onInit() {
    var now = DateTime.now();
    _today = DateTime(now.year, now.month, now.day);
    listenStatisDataChanges(date: _today);
    super.onInit();
  }

  toggleExpand(int id) {
    if (id == _expandedTodo.value) {
      _expandedTodo.value = null;
    } else {
      _expandedTodo.value = id;
    }
  }

  listenStatisDataChanges({required DateTime date}) async {
    _database.todosWithStatistic(date).watch().listen((list) {
      debugPrint('Todo changes total: ${list.length}');
      homeList.clear();
      homeList.addAll(list);
    });
  }

  setStatus({
    required TodosWithStatisticResult todoWithStatistic,
  }) async {
    final statistic = todoWithStatistic.statistic;

    if (CountDown.id != null && CountDown.id != statistic?.id) {
      _alertOngoingExists(todosWithStatistic: todoWithStatistic);
    } else {
      _insertOrUpdateStatistic(todosWithStatistic: todoWithStatistic);
    }
  }

  deleteTodo({required Todo todo}) async {
    Get.defaultDialog(
      title: 'Delete',
      middleText: 'Confirm to delete ${todo.title}?',
      textCancel: 'Cancel',
      textConfirm: 'Delete',
      onConfirm: () async {
        Get.back();
        var deleteStatistic = await _database.deleteTodoStatistics(todo.id);
        var deleteTodo = await _database.deleteTodoById(todo.id);

        debugPrint('Delete todo statistics status: $deleteStatistic');
        debugPrint('Delete todo status: $deleteTodo');
      },
    );
  }

  _alertOngoingExists({
    required TodosWithStatisticResult todosWithStatistic,
  }) {
    final title = todosWithStatistic.todo.title;

    Get.defaultDialog(
      middleText: 'Do you want to stop current todo and start $title?',
      textConfirm: 'Ok',
      textCancel: 'Cancel',
      onConfirm: () {
        Get.back();
        _countdown.stop();
        _insertOrUpdateStatistic(todosWithStatistic: todosWithStatistic);
      },
    );
  }

  _insertOrUpdateStatistic({
    required TodosWithStatisticResult todosWithStatistic,
  }) async {
    final todo = todosWithStatistic.todo;
    final statistic = todosWithStatistic.statistic;

    if (statistic == null) {
      final insertId = await _database.insertStatistic(
        todo.id,
        _today,
      );
      debugPrint(
        'Insert new statistic status: $insertId, date: $_today',
      );

      final inserted =
          await _database.getStatisticById(insertId, _today).getSingleOrNull();
      if (inserted != null) {
        _startCountDown(inserted, todo);
      }
    } else {
      debugPrint('Update statistic');
      switch (todosWithStatistic.getStatus) {
        case Status.pending:
          debugPrint('update statistic handle countdown: pending');
          break;
        case Status.ongoing:
          _database.updateStatistic(statistic.progress, statistic.id, _today);
          _countdown.stop();
          break;
        case Status.pause:
          _startCountDown(statistic, todo);
          break;
        case Status.done:
          debugPrint('update statistic handle countdown: done');
          break;
      }
    }
  }

  _startCountDown(Statistic statistic, Todo todo) async {
    _countdown.start(
      statisId: statistic.id,
      progressSec: Duration(milliseconds: statistic.progress).inSeconds,
      durationSec: Duration(milliseconds: todo.duration).inSeconds,
    );
  }
}
