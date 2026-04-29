import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../product_course_theme.dart';

class ProductEnrollCTA extends StatelessWidget {
  const ProductEnrollCTA({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 140,
      ),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 40 : 80),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ProductCourseColors.primary.withOpacity(0.15),
              Colors.transparent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: ProductCourseColors.primary.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Text(
              "Ready to lead your first product?",
              style: ProductCourseFonts.heading(isMobile ? 32 : 48),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              "Join 12,000+ professionals learning the modern frameworks of product delivery. 100% free, forever.",
              style: ProductCourseFonts.body(20, color: ProductCourseColors.textSecondary),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ProductCourseColors.primary,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 20,
                shadowColor: ProductCourseColors.primary.withOpacity(0.4),
              ),
              child: Text("ENROLL FOR FREE", style: ProductCourseFonts.heading(18, weight: FontWeight.w700, color: Colors.black)),
            ).animate(onPlay: (c) => c.repeat(reverse: true)).scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05), duration: 2.seconds),
          ],
        ),
      ),
    );
  }
}
