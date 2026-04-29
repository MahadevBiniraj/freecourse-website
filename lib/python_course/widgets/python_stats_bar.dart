import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../python_course_theme.dart';

class PythonStatsBar extends StatelessWidget {
  const PythonStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      color: PythonCourseColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 40,
      ),
      child: Wrap(
        spacing: 24,
        runSpacing: 24,
        alignment: WrapAlignment.center,
        children: [
          _StatCard(icon: Icons.timer_outlined, label: "Duration", value: "24+ Hours"),
          _StatCard(icon: Icons.menu_book_outlined, label: "Modules", value: "12 Sections"),
          _StatCard(icon: Icons.bar_chart_outlined, label: "Level", value: "Intermediate"),
          _StatCard(icon: Icons.card_membership_outlined, label: "Certificate", value: "Verified"),
        ],
      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _StatCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: PythonCourseColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: PythonCourseColors.primary, size: 24),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: PythonCourseFonts.body(14, color: PythonCourseColors.textSecondary)),
              const SizedBox(height: 4),
              Text(value, style: PythonCourseFonts.heading(18, weight: FontWeight.w700, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
