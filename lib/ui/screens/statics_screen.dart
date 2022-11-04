import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/statistic_screen_controller.dart';
import 'package:todo_list/utils/priority.dart';

import '../components/indicator.dart';

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
          Obx(() {
            if (_controller.showCompleteRateByPriority.value) {
              return Text(
                'Complete rate by priority:',
                style: Theme.of(context).textTheme.titleMedium,
              );
            }
            return const SizedBox();
          }),
          Obx(() {
            if (_controller.showCompleteRateByPriority.value) {
              return AspectRatio(
                aspectRatio: 3 / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 2,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(
                            touchCallback:
                                (FlTouchEvent event, pieTouchResponse) {},
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: 0,
                          centerSpaceRadius: 40,
                          sections: _controller.sectionData,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...Priority.values.map(
                          (e) => Indicator(
                            color: e.color,
                            text: e.displayText,
                            isSquare: true,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          }),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
