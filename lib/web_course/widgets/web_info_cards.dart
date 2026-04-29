import 'package:flutter/material.dart';
import '../web_course_theme.dart';

class WebInfoCards extends StatelessWidget {
  const WebInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      color: WebCourseColors.background,
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 30,
        runSpacing: 20,
        children: [
          _InfoCard(icon: Icons.timer_outlined, val: "12 Weeks", label: "Self-Paced"),
          _InfoCard(icon: Icons.layers_outlined, val: "18 Modules", label: "A-Z Curriculum"),
          _InfoCard(icon: Icons.workspace_premium_outlined, val: "Certificate", label: "Industry Recognized"),
          _InfoCard(icon: Icons.group_outlined, val: "Free Community", label: "Discord Support"),
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
      decoration: WebCourseStyles.glassBox(opacity: 0.05),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: WebCourseColors.primary.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icon, color: WebCourseColors.primary, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(val, style: WebCourseFonts.body(18, weight: FontWeight.w800)),
                Text(label, style: WebCourseFonts.body(13, color: WebCourseColors.textSecondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
