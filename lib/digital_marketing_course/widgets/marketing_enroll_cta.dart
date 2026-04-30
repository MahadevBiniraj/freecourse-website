import 'package:flutter/material.dart';
import '../digital_marketing_course_theme.dart';

class MarketingEnrollCTA extends StatelessWidget {
  const MarketingEnrollCTA({super.key});

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
      color: MarketingCourseColors.background,
      child: Container(
        padding: EdgeInsets.all(isMobile ? 32 : 64),
        decoration: BoxDecoration(
          color: MarketingCourseColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: MarketingCourseColors.primary.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: MarketingCourseColors.primary.withOpacity(0.05),
              blurRadius: 50,
              spreadRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Ready to Drive Growth?",
              textAlign: TextAlign.center,
              style: MarketingCourseFonts.heading(isMobile ? 36 : 56, color: Colors.white),
            ),
            const SizedBox(height: 24),
            Text(
              "Join thousands of marketers mastering digital strategy.",
              textAlign: TextAlign.center,
              style: MarketingCourseFonts.body(18, color: MarketingCourseColors.textSecondary),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: MarketingCourseColors.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 20,
                shadowColor: MarketingCourseColors.primary.withOpacity(0.4),
              ),
              child: Text(
                "ENROLL FOR FREE",
                style: MarketingCourseFonts.heading(18, weight: FontWeight.w800, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
