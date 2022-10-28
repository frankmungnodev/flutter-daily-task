import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/ui/components/setting_item.dart';
import 'package:todo_list/utils/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  _saveThemePreferences() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(Constants.themePreferences, !Get.isDarkMode);
  }

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
              'Settings',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          SettingItem(
            title: 'Theme',
            subTitle: Get.isDarkMode ? 'Dark Mode' : 'Light Mode',
            onClick: () {
              Get.changeTheme(
                Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
              );
              _saveThemePreferences();
            },
          )
        ],
      ),
    );
  }
}
