import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'achievement.g.dart';

const String kEarnedAchievementsBox = 'earned_achievements';

@HiveType(typeId: 3)
class Achievement {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String iconName;

  @HiveField(4)
  final int xpReward;

  @HiveField(5)
  final AchievementCategory category;

  @HiveField(6)
  final int requiredValue;

  @HiveField(7)
  final bool isHidden;

  Achievement({
    String? id,
    required this.title,
    required this.description,
    required this.iconName,
    required this.xpReward,
    required this.category,
    required this.requiredValue,
    this.isHidden = false,
  }) : id = id ?? const Uuid().v4();

  static final List<Achievement> allAchievements = [
    Achievement(
      id: 'first_step',
      title: 'First Step',
      description: 'Complete your first check-in',
      iconName: 'step',
      xpReward: 50,
      category: AchievementCategory.milestone,
      requiredValue: 1,
    ),
    Achievement(
      id: 'seven_day_streak',
      title: '7 Day Streak',
      description: 'Maintain a 7-day streak',
      iconName: 'fire',
      xpReward: 100,
      category: AchievementCategory.streak,
      requiredValue: 7,
    ),
    Achievement(
      id: 'thirty_day_streak',
      title: '30 Day Streak',
      description: 'Maintain a 30-day streak',
      iconName: 'fire',
      xpReward: 300,
      category: AchievementCategory.streak,
      requiredValue: 30,
    ),
    Achievement(
      id: 'hundred_day_streak',
      title: '100 Day Streak',
      description: 'Maintain a 100-day streak',
      iconName: 'crown',
      xpReward: 1000,
      category: AchievementCategory.streak,
      requiredValue: 100,
    ),
    Achievement(
      id: 'identity_master',
      title: 'Identity Master',
      description: 'Complete 3 identity cycles',
      iconName: 'master',
      xpReward: 200,
      category: AchievementCategory.milestone,
      requiredValue: 3,
    ),
    Achievement(
      id: 'early_bird',
      title: 'Early Bird',
      description: 'Check in before 8 AM',
      iconName: 'sun',
      xpReward: 30,
      category: AchievementCategory.challenge,
      requiredValue: 1,
    ),
    Achievement(
      id: 'night_owl',
      title: 'Night Owl',
      description: 'Complete evening reflection',
      iconName: 'moon',
      xpReward: 30,
      category: AchievementCategory.challenge,
      requiredValue: 1,
    ),
    Achievement(
      id: 'deep_thinker',
      title: 'Deep Thinker',
      description: 'Answer all daytime prompts in one day',
      iconName: 'brain',
      xpReward: 50,
      category: AchievementCategory.challenge,
      requiredValue: 6,
    ),
    Achievement(
      id: 'xp_collector_100',
      title: 'Rising Star',
      description: 'Earn 100 total XP',
      iconName: 'star',
      xpReward: 50,
      category: AchievementCategory.xp,
      requiredValue: 100,
    ),
    Achievement(
      id: 'xp_collector_500',
      title: 'Achiever',
      description: 'Earn 500 total XP',
      iconName: 'star',
      xpReward: 100,
      category: AchievementCategory.xp,
      requiredValue: 500,
    ),
    Achievement(
      id: 'xp_collector_1000',
      title: 'Champion',
      description: 'Earn 1000 total XP',
      iconName: 'trophy',
      xpReward: 200,
      category: AchievementCategory.xp,
      requiredValue: 1000,
    ),
  ];
}

@HiveType(typeId: 4)
enum AchievementCategory {
  @HiveField(0)
  milestone,
  @HiveField(1)
  streak,
  @HiveField(2)
  challenge,
  @HiveField(3)
  xp,
}

@HiveType(typeId: 5)
class EarnedAchievement {
  @HiveField(0)
  final String achievementId;

  @HiveField(1)
  final DateTime earnedAt;

  EarnedAchievement({
    required this.achievementId,
    DateTime? earnedAt,
  }) : earnedAt = earnedAt ?? DateTime.now();
}
