import 'package:flutter/cupertino.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/utils/extensions.dart';
import 'package:todo_list/utils/status.dart';

extension TodoWithStatisExtension on TodosWithStatisticResult {
  int get durationInMinutes {
    return _convertMilliSecondsToMinutes(milliSec: todo.duration);
  }

  int get progressInMinutes {
    return todo.duration < (statistic?.progress ?? 0)
        ? _convertMilliSecondsToMinutes(milliSec: todo.duration)
        : _convertMilliSecondsToMinutes(milliSec: statistic?.progress ?? 0);
  }

  double get progressPercent {
    return (statistic?.progress ?? 0) / todo.duration;
  }

  IconData get icon {
    switch (getStatus) {
      case Status.pending:
        return CupertinoIcons.play;
      case Status.ongoing:
        return CupertinoIcons.pause;
      case Status.pause:
        return CupertinoIcons.play;
      case Status.done:
        return CupertinoIcons.check_mark;
    }
  }

  Color get priorityColor {
    return todo.priority.priorityColor;
  }

  Status get getStatus {
    var total = todo.duration;
    var progress = statistic?.progress ?? 0;

    if (progress <= 0) {
      return Status.pending;
    } else if (progress < total) {
      return HomeScreenController.ongoingId == statistic?.id
          ? Status.ongoing
          : Status.pause;
    } else if (progress == total) {
      return Status.done;
    }

    return Status.done;
  }

  _convertMilliSecondsToMinutes({required int milliSec}) {
    return Duration(milliseconds: milliSec).inMinutes;
  }
}
