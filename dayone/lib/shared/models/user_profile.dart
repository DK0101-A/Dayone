import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'user_profile.g.dart';

@HiveType(typeId: 2)
class UserProfile {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String currentLanguage;

  @HiveField(2)
  final int currentLevel;

  @HiveField(3)
  final int totalXp;

  @HiveField(4)
  final int streakDays;

  @HiveField(5)
  final List<String> achievements;

  @HiveField(6)
  final DateTime createdAt;

  @HiveField(7)
  final DateTime lastActiveDate;

  UserProfile({
    String? id,
    this.currentLanguage = 'en',
    this.currentLevel = 1,
    this.totalXp = 0,
    this.streakDays = 0,
    this.achievements = const [],
    DateTime? createdAt,
    DateTime? lastActiveDate,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        lastActiveDate = lastActiveDate ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'currentLanguage': currentLanguage,
      'currentLevel': currentLevel,
      'totalXp': totalXp,
      'streakDays': streakDays,
      'achievements': achievements,
      'createdAt': createdAt.toIso8601String(),
      'lastActiveDate': lastActiveDate.toIso8601String(),
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String? ?? const Uuid().v4(),
      currentLanguage: (json['currentLanguage'] as String?) ?? 'en',
      currentLevel: json['currentLevel'] as int? ?? 1,
      totalXp: json['totalXp'] as int? ?? 0,
      streakDays: json['streakDays'] as int? ?? 0,
      achievements: (json['achievements'] as List?)?.cast<String>() ?? [],
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      lastActiveDate: json['lastActiveDate'] != null 
          ? DateTime.parse(json['lastActiveDate'] as String)
          : DateTime.now(),
    );
  }

  UserProfile copyWith({
    String? currentLanguage,
    int? currentLevel,
    int? totalXp,
    int? streakDays,
    List<String>? achievements,
    DateTime? lastActiveDate,
  }) {
    return UserProfile(
      id: id,
      currentLanguage: currentLanguage ?? this.currentLanguage,
      currentLevel: currentLevel ?? this.currentLevel,
      totalXp: totalXp ?? this.totalXp,
      streakDays: streakDays ?? this.streakDays,
      achievements: achievements ?? this.achievements,
      createdAt: createdAt,
      lastActiveDate: lastActiveDate ?? DateTime.now(),
    );
  }
}
