import 'package:flutter/material.dart';
import '../python_course_theme.dart';

class PythonNavbar extends StatelessWidget {
  final Function(String) onNavigate;

  const PythonNavbar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : screenWidth * 0.1),
      decoration: BoxDecoration(
        color: PythonCourseColors.background.withOpacity(0.8),
        border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: PythonCourseColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.terminal, color: PythonCourseColors.primary, size: 20),
              ),
              const SizedBox(width: 12),
              Text(
                "PY-DJANGO",
                style: PythonCourseFonts.heading(18, weight: FontWeight.w800, color: Colors.white),
              ),
            ],
          ),

          if (!isMobile)
            Row(
              children: [
                _NavLink("Curriculum", () => onNavigate("Curriculum")),
                _NavLink("Projects", () => onNavigate("Projects")),
                _NavLink("Instructor", () => onNavigate("Instructor")),
                _NavLink("FAQ", () => onNavigate("FAQ")),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: PythonCourseColors.primary,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Text(
                    "Enroll Free",
                    style: PythonCourseFonts.heading(14, weight: FontWeight.w700, color: Colors.black),
                  ),
                ),
              ],
            )
          else
            const Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title.toUpperCase(),
          style: PythonCourseFonts.mono(13, weight: FontWeight.w600, color: Colors.white70),
        ),
      ),
    );
  }
}
