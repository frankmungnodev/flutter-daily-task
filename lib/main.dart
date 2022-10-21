import 'package:flutter/material.dart';
import 'package:todo_list/ui/screens/app_screen.dart';
import 'package:get/get.dart';

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
      home: const AppScreen(),
    );
  }
}
