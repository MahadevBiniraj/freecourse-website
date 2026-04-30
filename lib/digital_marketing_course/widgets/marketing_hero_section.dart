import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../digital_marketing_course_theme.dart';

class MarketingHeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const MarketingHeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 800),
      decoration: const BoxDecoration(
        color: MarketingCourseColors.background,
      ),
      child: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -200,
            left: -200,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    MarketingCourseColors.primary.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          // Faint Grid Background
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: CustomPaint(painter: _GridPainter()),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 140,
            ),
            child: Row(
              children: [
                // Left Content
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Animated Badge
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: MarketingCourseColors.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: MarketingCourseColors.primary.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.bar_chart, color: MarketingCourseColors.primary, size: 14),
                            const SizedBox(width: 8),
                            Text(
                              "MARKETING ANALYTICS • 2024 EDITION",
                              style: MarketingCourseFonts.heading(12, color: MarketingCourseColors.primary, weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 600.ms),

                      const SizedBox(height: 32),

                      // Heading
                      RichText(
                        text: TextSpan(
                          style: MarketingCourseFonts.display(isMobile ? 48 : 72, weight: FontWeight.w900, color: Colors.white),
                          children: [
                            const TextSpan(text: "Master Digital\n"),
                            TextSpan(
                              text: "Growth & Strategy",
                              style: TextStyle(color: MarketingCourseColors.primary),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1),

                      const SizedBox(height: 24),

                      Text(
                        "Dominate the digital landscape. From SEO and Google Ads to Social Media and advanced Data Analytics—learn to build campaigns that convert.",
                        style: MarketingCourseFonts.body(20, color: MarketingCourseColors.textSecondary, weight: FontWeight.w400),
                      ).animate().fadeIn(delay: 200.ms, duration: 800.ms),

                      const SizedBox(height: 48),

                      // CTAs
                      Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: MarketingCourseColors.primary,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 20,
                              shadowColor: MarketingCourseColors.primary.withOpacity(0.4),
                            ),
                            child: Text("ACCESS DASHBOARD", style: MarketingCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.black)),
                          ),
                          OutlinedButton(
                            onPressed: onViewCurriculum,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: MarketingCourseColors.border),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("VIEW METRICS", style: MarketingCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.white)),
                          ),
                        ],
                      ).animate().fadeIn(delay: 400.ms),
                    ],
                  ),
                ),

                // Right Content (Hero Illustration)
                if (!isMobile)
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Hero Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/courses/digital_marketing.png',
                            width: 600,
                            fit: BoxFit.contain,
                          ),
                        )
                        .animate(onPlay: (controller) => controller.repeat(reverse: true))
                        .moveY(begin: 0, end: -15, duration: 2.5.seconds, curve: Curves.easeInOut),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = MarketingCourseColors.primary.withOpacity(0.3)
      ..strokeWidth = 1.0;

    const spacing = 50.0;

    for (var i = 0.0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (var i = 0.0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
