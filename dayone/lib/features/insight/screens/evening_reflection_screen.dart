import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/colors.dart';
import '../../../l10n/app_localizations.dart';

class EveningReflectionScreen extends ConsumerStatefulWidget {
  const EveningReflectionScreen({super.key});

  @override
  ConsumerState<EveningReflectionScreen> createState() => _EveningReflectionScreenState();
}

class _EveningReflectionScreenState extends ConsumerState<EveningReflectionScreen> {
  int _currentStep = 0;
  final List<String> _answers = [];

  List<String> _getQuestions(AppLocalizations tr) => [
    tr.eveningQ1,
    tr.eveningQ2,
    tr.eveningQ3,
    tr.eveningQ4,
    tr.eveningQ5,
    tr.eveningQ6,
    tr.eveningQ7,
  ];

  void _nextStep(int totalSteps) {
    if (_currentStep < totalSteps - 1) {
      setState(() => _currentStep++);
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
              // Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, color: AppColors.textSecondary),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      tr.eveningReflection,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 16),
              
              // Progress
              LinearProgressIndicator(
                value: (_currentStep + 1) / questions.length,
                backgroundColor: AppColors.surfaceLight,
                valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                minHeight: 4,
              ),
              
              const SizedBox(height: 24),
              
              // Step indicator
              Text(
                '${tr.stepLabel} ${_currentStep + 1}/${questions.length}',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
              
              const SizedBox(height: 16),
              
              // Question
              Expanded(
                child: Center(
                  child: Text(
                    questions[_currentStep],
                    style: GoogleFonts.inter(
                      fontSize: 26,
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
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: tr.yourReflection,
                    hintStyle: GoogleFonts.inter(
                      fontSize: 16,
                      color: AppColors.textTertiary,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(20),
                  ),
                  onSubmitted: (_) => _nextStep(questions.length),
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Continue button
              SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: () => _nextStep(questions.length),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _currentStep < questions.length - 1 ? tr.continue_ : tr.complete,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
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
