import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/database/database.dart';

class StatisticScreenController extends GetxController {
  final _database = Get.find<MDatabase>();

  @override
  void onInit() {
    super.onInit();
    _listenStatisticChanged();
  }

  _listenStatisticChanged() async {}
}
