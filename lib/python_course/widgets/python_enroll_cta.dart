import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../python_course_theme.dart';

class PythonEnrollCTA extends StatelessWidget {
  const PythonEnrollCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      color: PythonCourseColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 80, horizontal: isMobile ? 24 : 60),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              PythonCourseColors.primary.withOpacity(0.1),
              Colors.transparent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: PythonCourseColors.primary.withOpacity(0.1)),
        ),
        child: Column(
          children: [
            Text(
              "Ready to become a Backend Engineer?",
              style: PythonCourseFonts.heading(isMobile ? 32 : 48),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              "Join 8,500+ developers learning Python & Django today. 100% free, forever.",
              style: PythonCourseFonts.body(20, color: PythonCourseColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: PythonCourseColors.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 28),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 30,
                shadowColor: PythonCourseColors.primary.withOpacity(0.5),
              ),
              child: Text(
                "ENROLL NOW — FREE ACCESS",
                style: PythonCourseFonts.heading(18, weight: FontWeight.w800, color: Colors.black),
              ),
            ).animate(onPlay: (c) => c.repeat(reverse: true))
             .scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05), duration: 1.5.seconds, curve: Curves.easeInOut),
          ],
        ),
      ),
    );
  }
}
