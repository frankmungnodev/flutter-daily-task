import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/statistic_screen_controller.dart';

class StaticsScreen extends StatelessWidget {
  StaticsScreen({Key? key}) : super(key: key);

  final _controller = Get.put(StatisticScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              'Statistics',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
