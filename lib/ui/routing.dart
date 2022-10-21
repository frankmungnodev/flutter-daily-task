import 'package:get/get_navigation/get_navigation.dart';
import 'package:todo_list/ui/screens/app_screen.dart';
import 'package:todo_list/ui/screens/home_screen.dart';
import 'package:todo_list/ui/screens/settings_screen.dart';
import 'package:todo_list/ui/screens/statics_screen.dart';
import 'package:todo_list/ui/screens/todo_edit.dart';

class MRouting {
  static const app = "/";
  static const home = "/home";
  static const statics = "/statics";
  static const settings = "/settings";
  static const todoEdit = "/todo/edit";

  static List<GetPage> pages = [
    GetPage(
      name: app,
      page: () => const AppScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: statics,
      page: () => const StaticsScreen(),
    ),
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
    ),
    GetPage(
      name: todoEdit,
      page: () => TodoEditScreen(),
    )
  ];
}
