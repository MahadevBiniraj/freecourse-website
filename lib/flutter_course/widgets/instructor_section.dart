import 'package:flutter/material.dart';
import '../theme.dart';

class InstructorSection extends StatelessWidget {
  const InstructorSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      color: FlutterCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!isMobile)
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  width: 350,
                  height: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [FlutterCourseColors.primary, FlutterCourseColors.secondary],
                    ),
                    border: Border.all(color: Colors.white10, width: 8),
                  ),
                  child: Center(
                    child: Text(
                      "PB",
                      style: FlutterCourseFonts.body(100, weight: FontWeight.w900, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
          
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Meet Your Instructor", style: FlutterCourseFonts.body(20, color: FlutterCourseColors.primary, weight: FontWeight.w700)),
                const SizedBox(height: 16),
                Text("Portfolio Builders", style: FlutterCourseFonts.body(isMobile ? 32 : 48, weight: FontWeight.w800, color: Colors.white)),
                Text("Senior Flutter Developer & Educator", style: FlutterCourseFonts.body(20, color: Colors.white60)),
                const SizedBox(height: 32),
                Text(
                  "With over 8 years of experience in mobile development, we've helped thousands of students transition into high-paying tech roles. Our teaching philosophy is simple: build real-world projects that matter.",
                  style: FlutterCourseFonts.body(18, color: Colors.white70, weight: FontWeight.w400),
                ),
                const SizedBox(height: 48),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _SkillTag("Flutter Expert"),
                    _SkillTag("Dart"),
                    _SkillTag("Firebase"),
                    _SkillTag("Mobile Architecture"),
                    _SkillTag("UI/UX"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillTag extends StatelessWidget {
  final String label;
  const _SkillTag(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: FlutterCourseColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: FlutterCourseColors.primary.withValues(alpha: 0.2)),
      ),
      child: Text(label, style: FlutterCourseFonts.label(12, color: FlutterCourseColors.primary, weight: FontWeight.w600)),
    );
  }
}
