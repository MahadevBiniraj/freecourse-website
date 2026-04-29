import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../product_course_theme.dart';

class ProductHeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const ProductHeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 900),
      decoration: const BoxDecoration(color: ProductCourseColors.background),
      child: Stack(
        children: [
          // Background Gradient Glow
          Positioned(
            top: -200,
            right: -200,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    ProductCourseColors.primary.withOpacity(0.05),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 160,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: ProductCourseColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: ProductCourseColors.primary.withOpacity(0.3)),
                        ),
                        child: Text(
                          "PRODUCT LEADERSHIP • 2024 EDITION",
                          style: ProductCourseFonts.mono(12, color: ProductCourseColors.primary, weight: FontWeight.w700),
                        ),
                      ).animate().fadeIn().slideX(begin: -0.1),

                      const SizedBox(height: 32),

                      RichText(
                        text: TextSpan(
                          style: ProductCourseFonts.heading(isMobile ? 48 : 72, height: 1.1),
                          children: [
                            const TextSpan(text: "Master the Art of\n"),
                            TextSpan(
                              text: "Product Delivery",
                              style: TextStyle(color: ProductCourseColors.primary),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

                      const SizedBox(height: 24),

                      Text(
                        "Transition from execution to strategy. Learn to build product roadmaps, manage stakeholders, and drive growth with data-backed decisions.",
                        style: ProductCourseFonts.body(20, color: ProductCourseColors.textSecondary),
                      ).animate().fadeIn(delay: 400.ms),

                      const SizedBox(height: 48),

                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ProductCourseColors.primary,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("ENROLL NOW • FREE", style: ProductCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.black)),
                          ),
                          OutlinedButton(
                            onPressed: onViewCurriculum,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white24),
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("CURRICULUM", style: ProductCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.white)),
                          ),
                        ],
                      ).animate().fadeIn(delay: 600.ms),
                    ],
                  ),
                ),
                if (!isMobile)
                  Expanded(
                    flex: 5,
                    child: _DashboardPreview().animate().fadeIn(delay: 800.ms).scale(begin: const Offset(0.8, 0.8)),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(
            color: ProductCourseColors.primary.withOpacity(0.05),
            blurRadius: 100,
            spreadRadius: -20,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dashboard Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Q4 Roadmap Strategy", style: ProductCourseFonts.heading(18)),
              Row(
                children: [
                  _statusDot(Colors.green, "On Track"),
                  const SizedBox(width: 16),
                  _statusDot(Colors.orange, "Review Required"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          // KPI Grid
          Row(
            children: [
              Expanded(child: _kpiTile("Conversion Rate", "14.2%", "+2.4%")),
              const SizedBox(width: 16),
              Expanded(child: _kpiTile("MAU Growth", "128k", "+18%")),
            ],
          ),
          const SizedBox(height: 32),
          // Roadmap Visual
          Text("Current Sprint: Apollo-7", style: ProductCourseFonts.mono(12, color: ProductCourseColors.textSecondary)),
          const SizedBox(height: 16),
          _roadmapBar("User Auth Refresh", 0.8, ProductCourseColors.primary),
          _roadmapBar("API V3 Integration", 0.4, Colors.blueAccent),
          _roadmapBar("A/B Test Checkout Flow", 0.2, Colors.purpleAccent),
        ],
      ),
    );
  }

  Widget _statusDot(Color color, String label) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Text(label, style: ProductCourseFonts.body(12, color: Colors.white70)),
      ],
    );
  }

  Widget _kpiTile(String label, String value, String change) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: ProductCourseFonts.body(12, color: Colors.white54)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value, style: ProductCourseFonts.heading(24)),
              Text(change, style: ProductCourseFonts.mono(12, color: ProductCourseColors.primary)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _roadmapBar(String label, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: ProductCourseFonts.body(14, color: Colors.white70)),
              Text("${(progress * 100).toInt()}%", style: ProductCourseFonts.mono(12, color: color)),
            ],
          ),
          const SizedBox(height: 12),
          Stack(
            children: [
              Container(
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(3)),
              ),
              Container(
                height: 6,
                width: 300 * progress, // Simplified width logic
                decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(3)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
