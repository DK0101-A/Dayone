import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'identity_declaration.g.dart';

@HiveType(typeId: 0)
class IdentityDeclaration {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String declaration;

  @HiveField(3)
  final String visionPerson;

  @HiveField(4)
  final List<String> dailyActions;

  @HiveField(5)
  final DateTime createdAt;

  @HiveField(6)
  final DateTime updatedAt;

  IdentityDeclaration({
    String? id,
    required this.userId,
    required this.declaration,
    required this.visionPerson,
    required this.dailyActions,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : id = id ?? const Uuid().v4(),
        createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'declaration': declaration,
      'visionPerson': visionPerson,
      'dailyActions': dailyActions,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory IdentityDeclaration.fromJson(Map<String, dynamic> json) {
    return IdentityDeclaration(
      id: json['id'] as String,
      userId: json['userId'] as String,
      declaration: json['declaration'] as String,
      visionPerson: json['visionPerson'] as String,
      dailyActions: List<String>.from(json['dailyActions'] as List),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  IdentityDeclaration copyWith({
    String? declaration,
    String? visionPerson,
    List<String>? dailyActions,
  }) {
    return IdentityDeclaration(
      id: id,
      userId: userId,
      declaration: declaration ?? this.declaration,
      visionPerson: visionPerson ?? this.visionPerson,
      dailyActions: dailyActions ?? this.dailyActions,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
