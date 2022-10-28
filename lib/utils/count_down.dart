import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_list/database/database.dart';

class CountDown {
  static int? id;

  Timer? _timer;
  final _db = Get.find<MDatabase>();

  final _now = DateTime.now();

  start({
    required int statisId,
    required int progressSec,
    required int durationSec,
  }) async {
    id = statisId;

    final today = DateTime(_now.year, _now.month, _now.day);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      var currentProgressSec = timer.tick + progressSec;
      debugPrint('Update progress of $id: $currentProgressSec');

      _db.updateStatistic(
        Duration(seconds: currentProgressSec).inMilliseconds,
        statisId,
        today,
      );
      if (durationSec == currentProgressSec) {
        stop();
      }
    });
  }

  stop() {
    id = null;
    _timer?.cancel();
  }
}
