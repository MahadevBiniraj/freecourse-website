import 'package:flutter/material.dart';
import '../game_course_theme.dart';

class GameEnrollCTA extends StatelessWidget {
  const GameEnrollCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 160, horizontal: 24),
      decoration: const BoxDecoration(color: GameCourseColors.background),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _Glow(color: GameCourseColors.primary.withValues(alpha: 0.1)),
          Column(
            children: [
              Text("Ready to build your masterpiece?", textAlign: TextAlign.center, style: GameCourseFonts.heading(48)),
              const SizedBox(height: 24),
              Text("Join our global community of indie developers. 100% free forever.", textAlign: TextAlign.center, style: GameCourseFonts.body(20, color: GameCourseColors.textSecondary)),
              const SizedBox(height: 60),
              _LargeNeonButton(label: "Start Your Adventure Free", onTap: () {}),
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
      gradient: GameCourseColors.neonGradient,
      boxShadow: [BoxShadow(color: GameCourseColors.primary.withValues(alpha: 0.5), blurRadius: 40, spreadRadius: 5)],
    ),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 32), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Text(label, style: GameCourseFonts.body(20, weight: FontWeight.w900, color: Colors.black)),
    ),
  );
}
