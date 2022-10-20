import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/screen_app.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      home: ScreenApp(),
    );
  }
}
