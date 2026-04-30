import 'package:flutter/material.dart';
import '../ai_ml_course_theme.dart';

class AIEnrollCTA extends StatelessWidget {
  const AIEnrollCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      color: AICourseColors.background,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 32 : 64),
        decoration: BoxDecoration(
          color: AICourseColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AICourseColors.primary.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: AICourseColors.primary.withOpacity(0.05),
              blurRadius: 50,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Initialize Your Future in AI",
              textAlign: TextAlign.center,
              style: AICourseFonts.display(isMobile ? 36 : 56, color: Colors.white),
            ),
            const SizedBox(height: 24),
            Text(
              "Join thousands of developers building the next generation of intelligent systems.",
              textAlign: TextAlign.center,
              style: AICourseFonts.body(18, color: AICourseColors.textSecondary),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AICourseColors.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 20,
                shadowColor: AICourseColors.primary.withOpacity(0.4),
              ),
              child: Text(
                "EXECUTE ENROLLMENT",
                style: AICourseFonts.heading(18, weight: FontWeight.w800, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
