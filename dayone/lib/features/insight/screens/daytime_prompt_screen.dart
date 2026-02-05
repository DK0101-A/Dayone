import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/colors.dart';
import '../../../l10n/app_localizations.dart';

class DaytimePromptScreen extends ConsumerStatefulWidget {
  const DaytimePromptScreen({super.key});

  @override
  ConsumerState<DaytimePromptScreen> createState() => _DaytimePromptScreenState();
}

class _DaytimePromptScreenState extends ConsumerState<DaytimePromptScreen> {
  int _currentQuestion = 0;
  final List<String> _answers = [];

  List<String> _getQuestions(AppLocalizations tr) => [
    tr.daytimeQ1,
    tr.daytimeQ2,
    tr.daytimeQ3,
    tr.daytimeQ4,
    tr.daytimeQ5,
    tr.daytimeQ6,
  ];

  void _nextQuestion(int totalQuestions) {
    if (_currentQuestion < totalQuestions - 1) {
      setState(() => _currentQuestion++);
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final questions = _getQuestions(tr);
    
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress
              LinearProgressIndicator(
                value: (_currentQuestion + 1) / questions.length,
                backgroundColor: AppColors.surfaceLight,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                minHeight: 4,
              ),
              
              const SizedBox(height: 16),
              
              // Question counter
              Text(
                '${tr.questionLabel} ${_currentQuestion + 1}/${questions.length}',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Question
              Expanded(
                child: Center(
                  child: Text(
                    questions[_currentQuestion],
                    style: GoogleFonts.inter(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              
              // Answer input
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: tr.yourReflection,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 16,
                      color: AppColors.textTertiary,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(20),
                  ),
                  onSubmitted: (_) => _nextQuestion(questions.length),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Next button
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () => _nextQuestion(questions.length),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentQuestion < questions.length - 1 ? tr.next : tr.finish,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Skip button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  tr.skipForNow,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
