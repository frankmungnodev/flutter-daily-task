import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/utils/priority.dart';

class StatisticScreenController extends GetxController {
  final _database = Get.find<MDatabase>();

  final _completeRate = "0%".obs;
  get completeRate => _completeRate;

  final _sectionData = <PieChartSectionData>[].obs;
  get sectionData => _sectionData;

  final _showTotalProgressByPriority = false.obs;
  get showTotalProgressByPriority => _showTotalProgressByPriority;

  @override
  void onInit() {
    super.onInit();
    _listenStatisticChanged();
  }

  _listenStatisticChanged() async {
    _database.getTotalProgressByPriority().watchSingle().listen((priorities) {
      _showTotalProgressByPriority.value = true;

      _sectionData.clear();
      _sectionData.addAll(
        Priority.values.map(
          (priority) {
            final value = (priority == Priority.low
                    ? priorities.low
                    : priority == Priority.medium
                        ? priorities.medium
                        : priorities.high)
                .toDouble();

            return PieChartSectionData(
              value: value,
              color: priority.color,
              title: "${Duration(milliseconds: value.toInt()).inMinutes} Min",
            );
          },
        ),
      );
    }).onError((e) {
      _showTotalProgressByPriority.value = false;
      debugPrint('Error listen chart by priority');
    });
  }
}
