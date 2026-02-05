import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_profile.dart';
import '../models/identity_declaration.dart';
import '../models/daily_record.dart';

const String kUserProfileBox = 'user_profile';
const String kDeclarationBox = 'declarations';
const String kDailyRecordsBox = 'daily_records';

class UserProvider extends StateNotifier<UserProfile> {
  final Box<UserProfile> _profileBox;
  final Box<IdentityDeclaration> _declarationBox;
  final Box<DailyRecord> _recordsBox;

  UserProvider({
    required UserProfile profile,
    required Box<UserProfile> profileBox,
    required Box<IdentityDeclaration> declarationBox,
    required Box<DailyRecord> recordsBox,
  })  : _profileBox = profileBox,
        _declarationBox = declarationBox,
        _recordsBox = recordsBox,
        super(profile);

  Future<void> createProfile() async {
    await _profileBox.put('current', state);
  }

  Future<void> updateProfile(UserProfile updated) async {
    state = updated;
    await _profileBox.put('current', updated);
  }

  Future<void> addXp(int amount) async {
    final newTotalXp = state.totalXp + amount;
    final newLevel = (newTotalXp / 100).floor() + 1;
    final updated = state.copyWith(
      totalXp: newTotalXp,
      currentLevel: newLevel,
    );
    await updateProfile(updated);
  }

  Future<void> updateStreak() async {
    final today = DateTime.now();
    final lastActive = state.lastActiveDate;
    
    int newStreak = state.streakDays;
    
    if (lastActive.day != today.day) {
      if (lastActive.difference(today).inDays.abs() == 1) {
        newStreak += 1;
      } else {
        newStreak = 1;
      }
    }
    
    final updated = state.copyWith(
      streakDays: newStreak,
      lastActiveDate: today,
    );
    await updateProfile(updated);
  }

  Future<void> addAchievement(String achievementId) async {
    if (!state.achievements.contains(achievementId)) {
      final updated = state.copyWith(
        achievements: [...state.achievements, achievementId],
      );
      await updateProfile(updated);
    }
  }

  Future<void> setLanguage(String language) async {
    final updated = state.copyWith(currentLanguage: language);
    await updateProfile(updated);
  }

  IdentityDeclaration? getCurrentDeclaration() {
    final declarations = _declarationBox.values.toList();
    if (declarations.isEmpty) return null;
    return declarations.last;
  }

  Future<void> saveDeclaration(IdentityDeclaration declaration) async {
    await _declarationBox.put(declaration.id, declaration);
  }

  Future<void> saveDailyRecord(DailyRecord record) async {
    await _recordsBox.put(record.id, record);
  }

  List<DailyRecord> getTodayRecords() {
    final today = DateTime.now();
    return _recordsBox.values
        .where((r) => 
            r.date.year == today.year &&
            r.date.month == today.month &&
            r.date.day == today.day)
        .toList();
  }

  List<DailyRecord> getWeeklyRecords() {
    final today = DateTime.now();
    final weekAgo = today.subtract(const Duration(days: 7));
    return _recordsBox.values
        .where((r) => r.date.isAfter(weekAgo))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }
}

final userProvider = StateNotifierProvider<UserProvider, UserProfile>((ref) {
  final profileBox = Hive.box<UserProfile>(kUserProfileBox);
  // Load existing profile from Hive or create new one
  final existingProfile = profileBox.get('current');
  
  return UserProvider(
    profile: existingProfile ?? UserProfile(),
    profileBox: profileBox,
    declarationBox: Hive.box<IdentityDeclaration>(kDeclarationBox),
    recordsBox: Hive.box<DailyRecord>(kDailyRecordsBox),
  );
});
