import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/utils/priority.dart';

class StatisticScreenController extends GetxController {
  final _database = Get.find<MDatabase>();

  final _sectionData = <PieChartSectionData>[].obs;
  get sectionData => _sectionData;

  final _showCompleteRateByPriority = false.obs;
  get showCompleteRateByPriority => _showCompleteRateByPriority;

  @override
  void onInit() {
    super.onInit();
    _listenStatisticChanged();
  }

  _listenStatisticChanged() async {
    _database.getCompleteRateByPriority().watchSingle().listen((priorities) {
      _showCompleteRateByPriority.value = true;

      final total = priorities.low + priorities.medium + priorities.high;
      _sectionData.clear();
      _sectionData.add(_getSectionData(
        priorities.low,
        total: total,
        color: Priority.low.color,
      ));
      _sectionData.add(_getSectionData(
        priorities.medium,
        total: total,
        color: Priority.medium.color,
      ));
      _sectionData.add(_getSectionData(
        priorities.high,
        total: total,
        color: Priority.high.color,
      ));
    }).onError((e) {
      _showCompleteRateByPriority.value = false;
      debugPrint('Error listen chart by priority');
    });
  }

  PieChartSectionData _getSectionData(
    int value, {
    required int total,
    Color? color,
  }) {
    return PieChartSectionData(
      value: value.toDouble(),
      color: color,
      title: "${Duration(milliseconds: value).inMinutes} Min",
    );
  }
}
