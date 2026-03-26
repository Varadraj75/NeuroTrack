import 'package:flutter/material.dart';
import 'package:patient/core/theme/theme.dart';
import 'package:patient/presentation/therapist/find_therapist_screen.dart';

class AssessmentResultsScreen extends StatefulWidget {
  final int score;
  final int maxScore;
  final String level;

  const AssessmentResultsScreen({
    super.key,
    this.score = 7,
    this.maxScore = 10,
    this.level = 'Moderate',
  });

  @override
  State<AssessmentResultsScreen> createState() => _AssessmentResultsScreenState();
}

class _AssessmentResultsScreenState extends State<AssessmentResultsScreen> {
  Color _levelColor() {
    switch (widget.level.toLowerCase()) {
      case 'low':
        return const Color(0xFF4CAF50);
      case 'moderate':
        return const Color(0xFFF59E0B);
      case 'high':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFFF59E0B);
    }
  }

  String _levelDescription() {
    switch (widget.level.toLowerCase()) {
      case 'low':
        return 'Low indicators detected. No immediate concerns, but monitoring is recommended.';
      case 'moderate':
        return 'Moderate indicators detected. Professional consultation is recommended.';
      case 'high':
        return 'High indicators detected. Professional evaluation is strongly recommended.';
      default:
        return 'Professional consultation is recommended.';
    }
  }

  @override
  Widget build(BuildContext context) {
    final levels = ['Low', 'Moderate', 'High'];
    final activeIndex = levels.indexWhere(
      (l) => l.toLowerCase() == widget.level.toLowerCase(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Assessment Results',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Autism Quotient (AQ)',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Score display
              Center(
                child: Column(
                  children: [
                    Text(
                      '${widget.score} / ${widget.maxScore}',
                      style: const TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Your Score',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Pill selector
              Center(
                child: Column(
                  children: [
                    // Triangle indicator
                    Row(
                      children: List.generate(levels.length, (i) {
                        return Expanded(
                          child: Center(
                            child: i == activeIndex
                                ? Icon(
                                    Icons.arrow_drop_down,
                                    color: _levelColor(),
                                    size: 28,
                                  )
                                : const SizedBox(height: 28),
                          ),
                        );
                      }),
                    ),
                    // Pill segments
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: List.generate(levels.length, (i) {
                          final isActive = i == activeIndex;
                          return Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isActive ? _levelColor() : Colors.transparent,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  levels[i],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: isActive ? Colors.white : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Description card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF7ED),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  _levelDescription(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF92400E),
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Disclaimer
              const Text(
                'This is a preliminary screening result, not a clinical diagnosis. Please consult a qualified professional.',
                style: TextStyle(fontSize: 12, color: Colors.grey, height: 1.4),
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              // Buttons
              SizedBox(
                width: double.infinity,
                height: 52,
                child: FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FindTherapistScreen(),
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Find a Therapist',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppTheme.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Retake Assessment',
                    style: TextStyle(fontSize: 16, color: AppTheme.primaryColor),
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
