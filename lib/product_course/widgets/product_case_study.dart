import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../product_course_theme.dart';

class ProductCaseStudy extends StatelessWidget {
  const ProductCaseStudy({super.key});

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
      decoration: BoxDecoration(
        color: ProductCourseColors.surface,
        border: Border.symmetric(horizontal: BorderSide(color: Colors.white.withOpacity(0.05))),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Real-World Case Studies", style: ProductCourseFonts.heading(isMobile ? 32 : 40)),
                  const SizedBox(height: 12),
                  Text(
                    "Analyze how top-tier products were built, scaled, and managed.",
                    style: ProductCourseFonts.body(18, color: ProductCourseColors.textSecondary),
                  ),
                ],
              ),
              if (!isMobile)
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                    side: const BorderSide(color: Colors.white24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("VIEW ALL CASES", style: ProductCourseFonts.heading(14, color: Colors.white)),
                ),
            ],
          ),
          const SizedBox(height: 80),
          _CaseStudyCard(
            title: "Scaling a SaaS Marketplace",
            category: "STRATEGY & GROWTH",
            metrics: "3.5M MAU • 24% Growth",
            desc: "A deep dive into the product decisions that led to a successful Series B funding round for a developer tools marketplace.",
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 32),
          _CaseStudyCard(
            title: "The Mobile Banking Pivot",
            category: "UX & EXPERIMENTATION",
            metrics: "12% ➔ 28% Conversion",
            desc: "How data-driven A/B testing and user research transformed a legacy banking app into a modern fintech leader.",
            color: ProductCourseColors.primary,
          ),
        ],
      ),
    );
  }
}

class _CaseStudyCard extends StatelessWidget {
  final String title;
  final String category;
  final String metrics;
  final String desc;
  final Color color;

  const _CaseStudyCard({
    required this.title,
    required this.category,
    required this.metrics,
    required this.desc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: color.withOpacity(0.3)),
                  ),
                  child: Text(category, style: ProductCourseFonts.mono(10, color: color, weight: FontWeight.w700)),
                ),
                const SizedBox(height: 24),
                Text(title, style: ProductCourseFonts.heading(32)),
                const SizedBox(height: 16),
                Text(desc, style: ProductCourseFonts.body(18, color: ProductCourseColors.textSecondary)),
                const SizedBox(height: 32),
                Row(
                  children: [
                    const Icon(Icons.show_chart_rounded, color: ProductCourseColors.primary, size: 20),
                    const SizedBox(width: 12),
                    Text(metrics, style: ProductCourseFonts.mono(14, color: ProductCourseColors.primary)),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(flex: 1, child: SizedBox()),
          Icon(Icons.arrow_forward_ios_rounded, color: Colors.white24, size: 40),
        ],
      ),
    ).animate().fadeIn().slideY(begin: 0.1);
  }
}
