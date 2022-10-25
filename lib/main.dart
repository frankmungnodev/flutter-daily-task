import 'package:flutter/material.dart';
import 'package:todo_list/ui/routing.dart';
import 'package:get/get.dart';

import 'database/database.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: MRouting.app,
      initialBinding: BindingsBuilder(() {
        Get.put(MDatabase());
      }),
      getPages: MRouting.pages,
    );
  }
}
