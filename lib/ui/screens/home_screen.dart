import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/home_screen_controller.dart';
import 'package:todo_list/ui/components/todo_item.dart';
import 'package:todo_list/ui/routing.dart';
import 'package:todo_list/utils/priority.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          (() => ListView(
                clipBehavior: Clip.none,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 32),
                    child: Text(
                      'Daily Tasks',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 16,
                      left: 8,
                      right: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Priorities',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        ...Priority.values.map(
                          (priority) => Row(
                            children: [
                              Container(
                                width: 15,
                                height: 15,
                                margin: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: priority.color,
                                ),
                              ),
                              Text(priority.displayText),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  ...controller.homeList.map(
                    (todo) => TodoItem(
                      todoWithStatis: todo,
                    ),
                  ),
                ],
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => Get.toNamed(MRouting.todoEdit)),
        child: const Icon(CupertinoIcons.add),
      ),
    );
  }
}
