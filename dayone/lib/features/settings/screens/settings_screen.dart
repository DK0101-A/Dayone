import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/bloc/user_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  void _showLanguagePicker(BuildContext context, WidgetRef ref, AppLocalizations tr) {
    final currentLanguage = ref.watch(userProvider).currentLanguage;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(
          tr.selectLanguage,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LanguageOption(
              name: 'English',
              code: 'en',
              isSelected: currentLanguage == 'en',
              onTap: () {
                ref.read(userProvider.notifier).setLanguage('en');
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 8),
            _LanguageOption(
              name: '中文简体',
              code: 'zh',
              isSelected: currentLanguage == 'zh',
              onTap: () {
                ref.read(userProvider.notifier).setLanguage('zh');
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              tr.cancel,
              style: GoogleFonts.inter(
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context)!;
    final currentLanguage = ref.watch(userProvider).currentLanguage;
    final languageName = currentLanguage == 'zh' ? '中文简体' : 'English';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          tr.settings,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // Language
            _SettingsSection(
              title: tr.language,
              children: [
                _SettingsTile(
                  title: tr.appLanguage,
                  subtitle: languageName,
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                  onTap: () => _showLanguagePicker(context, ref, tr),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Notifications
            _SettingsSection(
              title: tr.notifications,
              children: [
                _SettingsTile(
                  title: tr.morningReminder,
                  subtitle: '8:00 AM',
                  trailing: Switch(
                    value: true,
                    onChanged: (v) {},
                    activeColor: AppColors.primary,
                  ),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: tr.daytimePrompts,
                  subtitle: '11:00 AM - 9:00 PM',
                  trailing: Switch(
                    value: true,
                    onChanged: (v) {},
                    activeColor: AppColors.primary,
                  ),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: tr.eveningReflection,
                  subtitle: '9:00 PM',
                  trailing: Switch(
                    value: true,
                    onChanged: (v) {},
                    activeColor: AppColors.primary,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Data
            _SettingsSection(
              title: tr.data,
              children: [
                _SettingsTile(
                  title: tr.exportData,
                  subtitle: tr.downloadYourData,
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: tr.resetProgress,
                  subtitle: tr.clearAllData,
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                  onTap: () {},
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // About
            _SettingsSection(
              title: tr.about,
              children: [
                _SettingsTile(
                  title: 'DayOne',
                  subtitle: '${tr.version} 1.0.0',
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: tr.privacyPolicy,
                  subtitle: '',
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                  onTap: () {},
                ),
                _SettingsTile(
                  title: tr.termsOfService,
                  subtitle: '',
                  trailing: const Icon(Icons.chevron_right, color: AppColors.textTertiary),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? trailing;
  final VoidCallback onTap;

  const _SettingsTile({
    required this.title,
    required this.subtitle,
    this.trailing,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  if (subtitle.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String name;
  final String code;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.name,
    required this.code,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceLight,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
              ),
            ),
            if (isSelected)
              Icon(Icons.check, color: AppColors.primary, size: 20),
          ],
        ),
      ),
    );
  }
}
