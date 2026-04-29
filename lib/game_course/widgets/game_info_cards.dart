import 'package:flutter/material.dart';
import '../game_course_theme.dart';

class GameInfoCards extends StatelessWidget {
  const GameInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: GameCourseColors.background,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        runSpacing: 20,
        children: [
          _InfoCard(icon: Icons.access_time_filled_rounded, val: "10 Weeks", label: "Learning Path"),
          _InfoCard(icon: Icons.sports_esports_rounded, val: "4 Projects", label: "Full Games Built"),
          _InfoCard(icon: Icons.trending_up_rounded, val: "Beginner", label: "To Professional"),
          _InfoCard(icon: Icons.verified_user_rounded, val: "Certificate", label: "Included Free"),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String val;
  final String label;

  const _InfoCard({required this.icon, required this.val, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(32),
      decoration: GameCourseStyles.glassBox(opacity: 0.05),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: GameCourseColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: GameCourseColors.primary, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(val, style: GameCourseFonts.body(18, weight: FontWeight.w800)),
                Text(label, style: GameCourseFonts.body(13, color: GameCourseColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
