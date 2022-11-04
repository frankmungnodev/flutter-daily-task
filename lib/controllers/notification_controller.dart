import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list/ui/routing.dart';

class NotificationController {
  static const channelTaskCompleted = "task_completed";
  static ReceivedNotification? initialAction;

  static initializeLocalNotifications() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: channelTaskCompleted,
          channelName: 'Task completed',
          channelDescription: 'Notification for tasks completed',
          playSound: true,
          onlyAlertOnce: true,
          importance: NotificationImportance.High,
          defaultPrivacy: NotificationPrivacy.Public,
          ledColor: Colors.green,
        )
      ],
      debug: false,
    );
    initialAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: false);
  }

  static Future<void> startListeningNotificationEvent() async {
    AwesomeNotifications()
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }

  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    if (receivedAction.actionType == ActionType.SilentAction ||
        receivedAction.actionType == ActionType.SilentBackgroundAction) {
      debugPrint(
          'Message sent via notification input: "${receivedAction.buttonKeyInput}"');
    } else {
      Get.offNamedUntil(
        MRouting.app,
        (route) => route.settings.name != MRouting.app,
      );
    }
  }

  static Future<bool> displayNotificationRationale() async {
    bool userAuthorized = false;

    Get.dialog(
      AlertDialog(
        title: Text('Get Notified!', style: Get.theme.textTheme.titleLarge),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/animated-bell.gif',
                    height: Get.height * 0.3,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Allow Daily Task Manager to send you notifications!'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              'Deny',
              style:
                  Get.theme.textTheme.titleLarge?.copyWith(color: Colors.red),
            ),
          ),
          TextButton(
            onPressed: () async {
              userAuthorized = true;
              Get.back();
            },
            child: Text(
              'Allow',
              style: Get.theme.textTheme.titleLarge
                  ?.copyWith(color: Colors.deepPurple),
            ),
          ),
        ],
      ),
    );
    return userAuthorized &&
        await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  static Future<void> createTaskCompletedNotification({
    required String taskName,
  }) async {
    bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
    if (!isAllowed) isAllowed = await displayNotificationRationale();
    if (!isAllowed) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1, // -1 is replaced by a random number
        channelKey: channelTaskCompleted,
        title: 'Task completed',
        body: "Yay! You just completed $taskName",
      ),
    );
  }

  static Future<void> cancelNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
