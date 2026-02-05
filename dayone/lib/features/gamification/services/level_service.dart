class LevelService {
  LevelService._();

  static int calculateLevel(int totalXp) {
    return (totalXp / 100).floor() + 1;
  }

  static int xpForNextLevel(int currentLevel) {
    return currentLevel * 100;
  }

  static int xpProgress(int totalXp) {
    final currentLevel = calculateLevel(totalXp);
    final xpForCurrentLevel = (currentLevel - 1) * 100;
    return totalXp - xpForCurrentLevel;
  }

  static double xpProgressPercentage(int totalXp) {
    final currentLevel = calculateLevel(totalXp);
    final xpForCurrentLevel = (currentLevel - 1) * 100;
    final xpInCurrentLevel = totalXp - xpForCurrentLevel;
    return xpInCurrentLevel / 100;
  }

  static String formatXp(int xp) {
    if (xp >= 1000) {
      return '${(xp / 1000).toStringAsFixed(1)}K';
    }
    return xp.toString();
  }

  static String getLevelTitle(int level) {
    if (level >= 10) return 'Legendary';
    if (level >= 8) return 'Master';
    if (level >= 6) return 'Expert';
    if (level >= 4) return 'Adept';
    if (level >= 2) return 'Beginner';
    return 'Novice';
  }
}
