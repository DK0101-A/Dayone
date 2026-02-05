import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/colors.dart';
import '../../../l10n/app_localizations.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          tr.progress,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close, color: AppColors.textSecondary),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Stats row
              Row(
                children: [
                  _StatCard(
                    label: tr.dayStreak,
                    value: '7',
                    icon: Icons.local_fire_department,
                    color: AppColors.streakFire,
                  ),
                  const SizedBox(width: 16),
                  _StatCard(
                    label: tr.level,
                    value: '3',
                    icon: Icons.star,
                    color: AppColors.levelPurple,
                  ),
                  const SizedBox(width: 16),
                  _StatCard(
                    label: tr.totalXp,
                    value: '320',
                    icon: Icons.trending_up,
                    color: AppColors.xpGold,
                  ),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Week view
              Text(
                tr.thisWeek,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Week days
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DayChip(day: 'M', date: '3', isActive: true),
                  _DayChip(day: 'T', date: '4', isActive: true),
                  _DayChip(day: 'W', date: '5', isActive: true),
                  _DayChip(day: 'T', date: '6', isActive: false),
                  _DayChip(day: 'F', date: '7', isActive: false),
                  _DayChip(day: 'S', date: '8', isActive: false),
                  _DayChip(day: 'S', date: '9', isActive: false),
                ],
              ),
              
              const SizedBox(height: 32),
              
              // Achievements
              Text(
                tr.achievements,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              
              const SizedBox(height: 16),
              
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  children: [
                    _AchievementBadge(
                      title: tr.firstStep,
                      description: tr.firstStepDesc,
                      isEarned: true,
                    ),
                    _AchievementBadge(
                      title: tr.sevenDayStreak,
                      description: tr.sevenDayStreakDesc,
                      isEarned: true,
                    ),
                    _AchievementBadge(
                      title: tr.identityMaster,
                      description: tr.identityMasterDesc,
                      isEarned: false,
                    ),
                    _AchievementBadge(
                      title: tr.earlyBird,
                      description: tr.earlyBirdDesc,
                      isEarned: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 12,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DayChip extends StatelessWidget {
  final String day;
  final String date;
  final bool isActive;

  const _DayChip({
    required this.day,
    required this.date,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 56,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: isActive
            ? null
            : Border.all(color: AppColors.surfaceLight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isActive ? AppColors.textPrimary : AppColors.textTertiary,
            ),
          ),
          Text(
            date,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isActive ? AppColors.textPrimary : AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  final String title;
  final String description;
  final bool isEarned;

  const _AchievementBadge({
    required this.title,
    required this.description,
    required this.isEarned,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isEarned ? AppColors.primary.withOpacity(0.3) : AppColors.surfaceLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            isEarned ? Icons.emoji_events : Icons.lock_outline,
            color: isEarned ? AppColors.xpGold : AppColors.textTertiary,
            size: 28,
          ),
          const Spacer(),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isEarned ? AppColors.textPrimary : AppColors.textTertiary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
