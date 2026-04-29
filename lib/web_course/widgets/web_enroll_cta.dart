import 'package:flutter/material.dart';
import '../web_course_theme.dart';

class WebEnrollCTA extends StatelessWidget {
  const WebEnrollCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 160, horizontal: 24),
      decoration: const BoxDecoration(color: WebCourseColors.background),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _Glow(color: WebCourseColors.primary.withValues(alpha: 0.1)),
          Column(
            children: [
              Text("Ready to launch your career?", textAlign: TextAlign.center, style: WebCourseFonts.heading(48)),
              const SizedBox(height: 24),
              Text("Join the next cohort of full stack developers. No credit card required.", textAlign: TextAlign.center, style: WebCourseFonts.body(20, color: WebCourseColors.textSecondary)),
              const SizedBox(height: 60),
              _LargeNeonButton(label: "Secure Your Spot — 100% Free", onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;
  const _Glow({required this.color});
  @override
  Widget build(BuildContext context) => Container(width: 800, height: 400, decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [color, Colors.transparent])));
}

class _LargeNeonButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _LargeNeonButton({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      gradient: WebCourseColors.neonGradient,
      boxShadow: [BoxShadow(color: WebCourseColors.primary.withValues(alpha: 0.5), blurRadius: 40, spreadRadius: 5)],
    ),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 32), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Text(label, style: WebCourseFonts.body(20, weight: FontWeight.w900, color: Colors.black)),
    ),
  );
}
