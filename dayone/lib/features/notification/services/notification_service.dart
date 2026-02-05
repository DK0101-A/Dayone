import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 通知服务：当前为桩实现（仅持久化偏好），不依赖 flutter_local_notifications，
/// 以便 Web 可编译。移动端需推送时再恢复依赖并接入完整实现。
class NotificationService {
  NotificationService._();

  static Future<void> initialize() async {}

  static Future<bool> requestPermissions() async => false;

  static Future<void> showMorningReminder() async {}

  static Future<void> showDaytimePrompt(int hour) async {}

  static Future<void> showEveningReflection() async {}

  static Future<void> scheduleMorningReminder(TimeOfDay time) async {}

  static Future<void> scheduleEveningReminder(TimeOfDay time) async {}

  static Future<void> cancelAllNotifications() async {}

  // Preferences keys
  static const String kMorningEnabled = 'notification_morning_enabled';
  static const String kMorningTime = 'notification_morning_time';
  static const String kDaytimeEnabled = 'notification_daytime_enabled';
  static const String kEveningEnabled = 'notification_evening_enabled';
  static const String kEveningTime = 'notification_evening_time';

  static Future<bool> getMorningEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kMorningEnabled) ?? true;
  }

  static Future<TimeOfDay> getMorningTime() async {
    final prefs = await SharedPreferences.getInstance();
    final hour = prefs.getInt('${kMorningTime}_hour') ?? 8;
    final minute = prefs.getInt('${kMorningTime}_minute') ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }

  static Future<bool> getDaytimeEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kDaytimeEnabled) ?? true;
  }

  static Future<bool> getEveningEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(kEveningEnabled) ?? true;
  }

  static Future<TimeOfDay> getEveningTime() async {
    final prefs = await SharedPreferences.getInstance();
    final hour = prefs.getInt('${kEveningTime}_hour') ?? 21;
    final minute = prefs.getInt('${kEveningTime}_minute') ?? 0;
    return TimeOfDay(hour: hour, minute: minute);
  }
}
