import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../../shared/bloc/user_provider.dart';
import '../data/questions.dart';
import '../../daily/screens/daily_choice_screen.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<String> _answers = [];

  void _nextPage() {
    if (_currentPage < OnboardingQuestions.steps.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Complete onboarding - go to daily
      context.push('/daily');
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _currentPage > 0
            ? IconButton(
                onPressed: _previousPage,
                icon: const Icon(Icons.arrow_back, color: AppColors.textPrimary),
              )
            : null,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              '${_currentPage + 1}/${OnboardingQuestions.steps.length}',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() => _currentPage = page);
        },
        itemCount: OnboardingQuestions.steps.length,
        itemBuilder: (context, index) {
          final step = OnboardingQuestions.steps[index];
          return _QuestionPage(
            step: step,
            answer: index < _answers.length ? _answers[index] : null,
            onNext: _nextPage,
            onAnswer: (answer) {
              if (index < _answers.length) {
                _answers[index] = answer;
              } else {
                _answers.add(answer);
              }
            },
          );
        },
      ),
    );
  }
}

class _QuestionPage extends ConsumerStatefulWidget {
  final QuestionStep step;
  final String? answer;
  final VoidCallback onNext;
  final ValueChanged<String> onAnswer;

  const _QuestionPage({
    required this.step,
    required this.answer,
    required this.onNext,
    required this.onAnswer,
  });

  @override
  ConsumerState<_QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends ConsumerState<_QuestionPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  String _currentAnswer = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<double>(begin: 30, end: 0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _controller.forward();
  }

  @override
  void didUpdateWidget(_QuestionPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync local answer with parent's answer when page changes
    if (oldWidget.answer != widget.answer && widget.answer != null) {
      setState(() => _currentAnswer = widget.answer!);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context)!;
    final locale = ref.watch(userProvider).currentLanguage;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _fadeAnimation,
          child: Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: child,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Progress indicator
            LinearProgressIndicator(
              value: (widget.step.id) / OnboardingQuestions.steps.length,
              backgroundColor: AppColors.surfaceLight,
              valueColor: const AlwaysStoppedAnimation(AppColors.primary),
              minHeight: 4,
            ),
            
            const SizedBox(height: 32),
            
            // Hint
            Text(
              widget.step.getHint(locale),
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Question
            Expanded(
              child: Text(
                widget.step.getQuestion(locale),
                style: GoogleFonts.inter(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                  height: 1.3,
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
                  hintText: 'Your answer...',
                  hintStyle: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.textTertiary,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(20),
                ),
                onChanged: (value) {
                  setState(() => _currentAnswer = value);
                  widget.onAnswer(value);
                },
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Continue button - always enabled, input is optional
            SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: widget.onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.textPrimary,
                  disabledBackgroundColor: AppColors.surfaceLight,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  widget.step.id == OnboardingQuestions.steps.length
                      ? (AppLocalizations.of(context)?.complete ?? 'Complete')
                      : (AppLocalizations.of(context)?.next ?? 'Next'),
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
