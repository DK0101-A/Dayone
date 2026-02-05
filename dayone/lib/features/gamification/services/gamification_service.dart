import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../shared/models/user_profile.dart';
import '../../../shared/bloc/user_provider.dart';
import '../models/achievement.dart';

const String kGamificationBox = 'gamification';
const String kEarnedAchievementsBox = 'earned_achievements';

class GamificationService {
  final Box<EarnedAchievement> _earnedBox;
  final Box<UserProfile> _profileBox;

  GamificationService({
    required Box<EarnedAchievement> earnedBox,
    required Box<UserProfile> profileBox,
  })  : _earnedBox = earnedBox,
        _profileBox = profileBox;

  Future<void> awardXp(int amount, {String? reason}) async {
    final profile = _profileBox.get('current');
    if (profile == null) return;

    final newTotalXp = profile.totalXp + amount;
    final newLevel = (newTotalXp / 100).floor() + 1;

    final updated = profile.copyWith(
      totalXp: newTotalXp,
      currentLevel: newLevel,
    );

    await _profileBox.put('current', updated);

    // Check for level up achievements
    await _checkAchievements();
  }

  Future<void> incrementStreak() async {
    final profile = _profileBox.get('current');
    if (profile == null) return;

    final today = DateTime.now();
    final lastActive = profile.lastActiveDate;

    int newStreak = profile.streakDays;

    if (lastActive.day != today.day) {
      if (lastActive.difference(today).inDays.abs() == 1) {
        newStreak += 1;
      } else {
        newStreak = 1;
      }
    }

    final updated = profile.copyWith(
      streakDays: newStreak,
      lastActiveDate: today,
    );

    await _profileBox.put('current', updated);
    await _checkAchievements();
  }

  Future<void> checkFirstStep() async {
    final earnedIds = _earnedBox.values.map((e) => e.achievementId).toList();
    if (!earnedIds.contains('first_step')) {
      await _earnAchievement('first_step');
    }
  }

  Future<void> _checkAchievements() async {
    final profile = _profileBox.get('current');
    if (profile == null) return;

    // Streak achievements
    if (profile.streakDays >= 7) {
      await _earnAchievement('seven_day_streak');
    }
    if (profile.streakDays >= 30) {
      await _earnAchievement('thirty_day_streak');
    }
    if (profile.streakDays >= 100) {
      await _earnAchievement('hundred_day_streak');
    }

    // XP achievements
    if (profile.totalXp >= 100) {
      await _earnAchievement('xp_collector_100');
    }
    if (profile.totalXp >= 500) {
      await _earnAchievement('xp_collector_500');
    }
    if (profile.totalXp >= 1000) {
      await _earnAchievement('xp_collector_1000');
    }
  }

  Future<bool> _earnAchievement(String achievementId) async {
    final earnedIds = _earnedBox.values.map((e) => e.achievementId).toList();
    
    if (earnedIds.contains(achievementId)) {
      return false;
    }

    await _earnedBox.put(achievementId, EarnedAchievement(achievementId: achievementId));

    // Award XP for achievement
    final achievement = Achievement.allAchievements.firstWhere(
      (a) => a.id == achievementId,
    );
    await awardXp(achievement.xpReward);

    return true;
  }

  List<Achievement> getEarnedAchievements() {
    final earnedIds = _earnedBox.values.map((e) => e.achievementId).toSet();
    return Achievement.allAchievements
        .where((a) => earnedIds.contains(a.id))
        .toList();
  }

  List<Achievement> getLockedAchievements() {
    final earnedIds = _earnedBox.values.map((e) => e.achievementId).toSet();
    return Achievement.allAchievements
        .where((a) => !earnedIds.contains(a.id) && !a.isHidden)
        .toList();
  }

  List<Achievement> getAllAchievements() {
    return Achievement.allAchievements;
  }

  // XP per action types
  static const int xpForCheckIn = 10;
  static const int xpForDailyComplete = 50;
  static const int xpForDaytimePrompt = 5;
  static const int xpForEveningReflection = 20;
  static const int xpForStreakBonus = 15;
}

final gamificationServiceProvider = Provider<GamificationService>((ref) {
  return GamificationService(
    earnedBox: Hive.box<EarnedAchievement>(kEarnedAchievementsBox),
    profileBox: Hive.box<UserProfile>(kUserProfileBox),
  );
});
