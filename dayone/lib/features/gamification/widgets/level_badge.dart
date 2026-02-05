import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/colors.dart';
import '../services/level_service.dart';

class LevelBadge extends StatelessWidget {
  final int currentLevel;
  final int totalXp;

  const LevelBadge({
    super.key,
    required this.currentLevel,
    required this.totalXp,
  });

  @override
  Widget build(BuildContext context) {
    final progress = LevelService.xpProgressPercentage(totalXp);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.star,
                color: AppColors.levelPurple,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Lv.$currentLevel',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.surfaceLight,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                minHeight: 6,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${LevelService.xpProgress(totalXp)}/100 XP',
            style: GoogleFonts.inter(
              fontSize: 10,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class XpDisplay extends StatelessWidget {
  final int totalXp;

  const XpDisplay({super.key, required this.totalXp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.xpGold.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.xpGold.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.trending_up,
            color: AppColors.xpGold,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            '${LevelService.formatXp(totalXp)} XP',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.xpGold,
            ),
          ),
        ],
      ),
    );
  }
}

class StreakDisplay extends StatelessWidget {
  final int streakDays;

  const StreakDisplay({super.key, required this.streakDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.streakFire.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.streakFire.withOpacity(0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.local_fire_department,
            color: AppColors.streakFire,
            size: 16,
          ),
          const SizedBox(width: 6),
          Text(
            '$streakDays',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.streakFire,
            ),
          ),
        ],
      ),
    );
  }
}
