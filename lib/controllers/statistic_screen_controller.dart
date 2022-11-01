import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/database/database.dart';
import 'package:todo_list/utils/priority.dart';

class StatisticScreenController extends GetxController {
  final _database = Get.find<MDatabase>();

  final _sectionData = <PieChartSectionData>[];
  get sectionData => _sectionData.obs;

  @override
  void onInit() {
    super.onInit();
    _listenStatisticChanged();
  }

  _listenStatisticChanged() async {
    _database.getChartByPriority().watchSingle().listen((priorities) {
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
