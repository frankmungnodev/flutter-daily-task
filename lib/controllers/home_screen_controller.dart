import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/utils/extension_todo_with_statis.dart';
import 'package:todo_list/utils/status_enum.dart';

import '../database/database.dart';
import '../utils/constants.dart';

class HomeScreenController extends GetxController {
  final _database = Get.find<MDatabase>();

  // Timer
  static int? ongoingId;
  Timer? _timer;

  final _expandedTodo = RxnInt(null);
  get expandedTodo => _expandedTodo;

  late final DateTime _today;

  var homeList = <TodosWithStatisticResult>[].obs;

  @override
  onInit() {
    _checkTheme();
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

  setStatus({
    required TodosWithStatisticResult todoWithStatistic,
  }) async {
    final statistic = todoWithStatistic.statistic;

    if (ongoingId != null && ongoingId != statistic?.id) {
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

  listenStatisDataChanges({required DateTime date}) async {
    _database.todosWithStatistic(date).watch().listen((list) {
      debugPrint('Todo changes total: ${list.length}');
      homeList.clear();
      homeList.addAll(list);
    });
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
        _stopTimer();
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
          _stopTimer();
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
    final progressInSeconds =
        Duration(milliseconds: statistic.progress).inSeconds;

    ongoingId = statistic.id;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      var currentProgressSec = timer.tick + progressInSeconds;
      debugPrint('Update progress of $ongoingId: $currentProgressSec');

      _database.updateStatistic(
        Duration(seconds: currentProgressSec).inMilliseconds,
        ongoingId!,
        _today,
      );
      if (statistic.progress == todo.duration) {
        _stopTimer();
      }
    });
  }

  _stopTimer() {
    ongoingId = null;
    _timer?.cancel();
  }

  _checkTheme() async {
    final preferences = await SharedPreferences.getInstance();
    final isDarkMode = preferences.getBool(Constants.themePreferences) ?? true;
    Get.changeTheme(isDarkMode ? ThemeData.dark() : ThemeData.light());
  }
}
