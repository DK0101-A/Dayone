import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'daily_record.g.dart';

@HiveType(typeId: 1)
class DailyRecord {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String identityChoice;

  @HiveField(4)
  final List<String> actionsCompleted;

  @HiveField(5)
  final int xpEarned;

  @HiveField(6)
  final List<String>? insights;

  @HiveField(7)
  final DateTime createdAt;

  DailyRecord({
    String? id,
    required this.userId,
    required this.date,
    required this.identityChoice,
    required this.actionsCompleted,
    required this.xpEarned,
    this.insights,
    DateTime? createdAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'date': date.toIso8601String(),
      'identityChoice': identityChoice,
      'actionsCompleted': actionsCompleted,
      'xpEarned': xpEarned,
      'insights': insights,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory DailyRecord.fromJson(Map<String, dynamic> json) {
    return DailyRecord(
      id: json['id'] as String,
      userId: json['userId'] as String,
      date: DateTime.parse(json['date'] as String),
      identityChoice: json['identityChoice'] as String,
      actionsCompleted: List<String>.from(json['actionsCompleted'] as List),
      xpEarned: json['xpEarned'] as int,
      insights: json['insights'] != null
          ? List<String>.from(json['insights'] as List)
          : null,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
  }
}
