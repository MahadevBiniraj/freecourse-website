import 'package:flutter/material.dart';
import '../theme.dart';

class StatsBar extends StatelessWidget {
  const StatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: FlutterCourseColors.background,
        border: Border.symmetric(horizontal: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 60,
        runSpacing: 20,
        children: [
          _StatItem("12,400+", "Students"),
          _StatItem("4.9★", "Rating"),
          _StatItem("Flutter 3.x", "Tech Stack"),
          _StatItem("Beginner Friendly", "Level"),
          _StatItem("Free", "Price"),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String val;
  final String label;

  const _StatItem(this.val, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(val, style: FlutterCourseFonts.body(20, color: FlutterCourseColors.primary, weight: FontWeight.w800)),
        Text(label, style: FlutterCourseFonts.body(14, color: Colors.white.withValues(alpha: 0.6))),
      ],
    );
  }
}
