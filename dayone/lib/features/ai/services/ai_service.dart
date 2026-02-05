import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiService {
  AiService._();

  // Mock data for MVP
  static const Map<String, String> declarationInsights = {
    'health': [
      'Your focus on health shows a deep understanding that identity drives behavior. Remember: you don\'t "try" to be healthy - you simply are someone who takes care of their body.',
      'The health-focused identity is powerful because it reframes wellness from obligation to expression of who you are.',
      'Consider: What specific daily actions align with being "someone who takes care of their health"? Make them automatic.',
    ],
    'productivity': [
      'Your productivity identity suggests you understand that success is a habit, not an event. This is the right mindset.',
      'To reinforce this identity, focus on systems over goals. Systems are how identity expresses itself daily.',
      'Ask yourself: Does every action today align with being a productive person? If not, you\'re not being true to your identity.',
    ],
    'learning': [
      'A learner\'s identity is one of the most valuable you can cultivate. Knowledge compounds over time.',
      'Identity-based learning means you don\'t "make time" to learn - you learn because that\'s who you are.',
      'Today\'s small learning actions compound into tomorrow\'s expertise. Stay consistent.',
    ],
    'creativity': [
      'Your creative identity acknowledges that creativity is a practice, not a talent. This is liberating.',
      'Creatives don\'t wait for inspiration - they create rituals that invite inspiration.',
      'What small creative action can you take today that reinforces "I am a creative person"?',
    ],
    'default': [
      'Your identity declaration is your north star. Return to it when motivation wanes.',
      'Remember: Identity is built through consistent small actions, not grand gestures.',
      'The gap between who you are and who you want to be is closed through daily identity-aligned actions.',
    ],
  };

  static const Map<String, String> dailyTips = {
    'motivation':
        'Your identity drives your actions. When you say "I am someone who exercises," you don\'t need willpower - you simply can\'t imagine not exercising.',
    'momentum':
        'Small actions create momentum. Each identity-aligned action makes the next one easier.',
    'identity':
        'Every choice is a vote for the person you want to become. Make them count.',
    'consistency':
        'Consistency builds identity. It\'s not about perfection - it\'s about persistence.',
    'belief':
        'The hardest part is believing you can be different. But you already decided who you want to be. Trust that decision.',
  };

  static String getDeclarationInsight(String declaration) {
    final lowercase = declaration.toLowerCase();

    if (lowercase.contains('health') ||
        lowercase.contains('fit') ||
        lowercase.contains('exercise') ||
        lowercase.contains('body')) {
      final insights = declarationInsights['health']!;
      return insights[DateTime.now().day % insights.length];
    } else if (lowercase.contains('productivity') ||
        lowercase.contains('work') ||
        lowercase.contains('focus') ||
        lowercase.contains('busy')) {
      final insights = declarationInsights['productivity']!;
      return insights[DateTime.now().day % insights.length];
    } else if (lowercase.contains('learn') ||
        lowercase.contains('read') ||
        lowercase.contains('study') ||
        lowercase.contains('knowledge')) {
      final insights = declarationInsights['learning']!;
      return insights[DateTime.now().day % insights.length];
    } else if (lowercase.contains('creative') ||
        lowercase.contains('art') ||
        lowercase.contains('write') ||
        lowercase.contains('design')) {
      final insights = declarationInsights['creativity']!;
      return insights[DateTime.now().day % insights.length];
    }

    final insights = declarationInsights['default']!;
    return insights[DateTime.now().day % insights.length];
  }

  static String getDailyTip() {
    final tips = dailyTips.values.toList();
    return tips[DateTime.now().day % tips.length];
  }

  static Map<String, dynamic> analyzeProgress(List<dynamic> dailyRecords) {
    // Mock analysis for MVP
    final totalDays = dailyRecords.length;
    final completedActions = dailyRecords
        .where((r) => (r['actionsCompleted'] as List).isNotEmpty)
        .length;

    final completionRate =
        totalDays > 0 ? (completedActions / totalDays * 100).round() : 0;

    return {
      'totalDays': totalDays,
      'completedActions': completedActions,
      'completionRate': completionRate,
      'streak': dailyRecords.isNotEmpty ? _calculateStreak(dailyRecords) : 0,
      'insight': _generateProgressInsight(completionRate),
    };
  }

  static int _calculateStreak(List<dynamic> records) {
    if (records.isEmpty) return 0;

    var streak = 0;
    final sortedRecords = List<Map<String, dynamic>>.from(records)
      ..sort((a, b) => DateTime.parse(b['date']).compareTo(DateTime.parse(a['date'])));

    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    for (int i = 0; i < sortedRecords.length; i++) {
      final recordDate = DateTime.parse(sortedRecords[i]['date']);
      if (recordDate.day == today.day || recordDate.day == yesterday.day) {
        if ((sortedRecords[i]['actionsCompleted'] as List).isNotEmpty) {
          streak++;
        }
      } else {
        break;
      }
    }

    return streak;
  }

  static String _generateProgressInsight(int completionRate) {
    if (completionRate >= 80) {
      return 'Your consistency is building a strong identity. You\'re becoming who you want to be.';
    } else if (completionRate >= 50) {
      return 'You\'re making progress. Focus on the identity, not just the actions.';
    } else if (completionRate >= 25) {
      return 'Every action counts, even small ones. Return to your declaration.';
    } else {
      return 'Identity takes time. Start again today - every day is a fresh opportunity.';
    }
  }

  static String generateWeeklySummary(List<dynamic> weeklyRecords) {
    final analysis = analyzeProgress(weeklyRecords);
    final completionRate = analysis['completionRate'] as int;

    return '''
Week Summary:
- ${analysis['totalDays']} days tracked
- ${analysis['completedActions']} actions completed
- ${completionRate}% completion rate

${analysis['insight']}
''';
  }
}

final aiServiceProvider = Provider<AiService>((ref) {
  return AiService._();
});
