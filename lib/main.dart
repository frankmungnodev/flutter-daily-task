import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/controllers/notification_controller.dart';

import 'ui/routing.dart';
import 'database/database.dart';

void main() async {
  await NotificationController.initializeLocalNotifications();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      initialRoute: MRouting.app,
      initialBinding: BindingsBuilder(() {
        Get.lazyPut(() => MDatabase());
      }),
      getPages: MRouting.pages,
    );
  }
}
