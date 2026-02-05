import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/theme/theme.dart';
import 'l10n/app_localizations.dart';
import 'features/onboarding/screens/theory_intro_screen.dart';
import 'features/onboarding/screens/onboarding_screen.dart';
import 'features/daily/screens/daily_choice_screen.dart';
import 'features/progress/screens/progress_screen.dart';
import 'features/settings/screens/settings_screen.dart';
import 'features/insight/screens/daytime_prompt_screen.dart';
import 'features/insight/screens/evening_reflection_screen.dart';
import 'shared/models/identity_declaration.dart';
import 'shared/models/daily_record.dart';
import 'shared/models/user_profile.dart';
import 'features/gamification/models/achievement.dart';
import 'shared/bloc/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Hive.initFlutter();
  
  // Register Hive adapters
  Hive.registerAdapter(IdentityDeclarationAdapter());
  Hive.registerAdapter(DailyRecordAdapter());
  Hive.registerAdapter(UserProfileAdapter());
  Hive.registerAdapter(AchievementAdapter());
  Hive.registerAdapter(AchievementCategoryAdapter());
  Hive.registerAdapter(EarnedAchievementAdapter());
  
  // Open Hive boxes
  await Hive.openBox<UserProfile>(kUserProfileBox);
  await Hive.openBox<IdentityDeclaration>(kDeclarationBox);
  await Hive.openBox<DailyRecord>(kDailyRecordsBox);
  await Hive.openBox<EarnedAchievement>(kEarnedAchievementsBox);
  
  runApp(
    const ProviderScope(
      child: DayOneApp(),
    ),
  );
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'intro',
      builder: (context, state) => const TheoryIntroScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      name: 'onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/daily',
      name: 'daily',
      builder: (context, state) => const DailyChoiceScreen(),
    ),
    GoRoute(
      path: '/progress',
      name: 'progress',
      builder: (context, state) => const ProgressScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/daytime-prompt',
      name: 'daytime-prompt',
      builder: (context, state) => const DaytimePromptScreen(),
    ),
    GoRoute(
      path: '/evening-reflection',
      name: 'evening-reflection',
      builder: (context, state) => const EveningReflectionScreen(),
    ),
  ],
);

class DayOneApp extends ConsumerWidget {
  const DayOneApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProfile = ref.watch(userProvider);
    final locale = userProfile.currentLanguage == 'zh'
        ? const Locale('zh')
        : const Locale('en');

    return MaterialApp.router(
      title: 'DayOne',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
      ],
      locale: locale,
      routerConfig: router,
    );
  }
}
