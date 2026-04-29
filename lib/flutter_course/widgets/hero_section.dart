import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const HeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 800),
      decoration: const BoxDecoration(
        color: FlutterCourseColors.background,
      ),
      child: Stack(
        children: [
          // Background Glow
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
                    FlutterCourseColors.primary.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
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
                          color: FlutterCourseColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: FlutterCourseColors.primary.withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          "100% Free — No Credit Card",
                          style: FlutterCourseFonts.label(12, color: FlutterCourseColors.primary, weight: FontWeight.w700),
                        ),
                      )
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .scale(begin: const Offset(1, 1), end: const Offset(1.05, 1.05), duration: 1.seconds, curve: Curves.easeInOut),
                      
                      const SizedBox(height: 32),
                      
                      // Heading
                      RichText(
                        text: TextSpan(
                          style: FlutterCourseFonts.body(isMobile ? 48 : 72, weight: FontWeight.w900, color: Colors.white),
                          children: [
                            const TextSpan(text: "Master App Development with "),
                            TextSpan(
                              text: "Flutter",
                              style: TextStyle(
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [FlutterCourseColors.primary, FlutterCourseColors.secondary],
                                  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1),
                      
                      const SizedBox(height: 24),
                      
                      Text(
                        "Build beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Join 12,400+ students today.",
                        style: FlutterCourseFonts.body(20, color: Colors.white.withValues(alpha: 0.7), weight: FontWeight.w400),
                      ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
                      
                      const SizedBox(height: 48),
                      
                      // CTAs
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: FlutterCourseColors.primary,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text("Start Learning Free", style: FlutterCourseFonts.body(16, weight: FontWeight.w800, color: Colors.black)),
                          ),
                          const SizedBox(width: 20),
                          OutlinedButton(
                            onPressed: onViewCurriculum,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Text("View Curriculum", style: FlutterCourseFonts.body(16, weight: FontWeight.w800, color: Colors.white)),
                          ),
                        ],
                      ).animate().fadeIn(delay: 400.ms),
                      
                      const SizedBox(height: 80),
                      
                      // Mini Stats
                      Wrap(
                        spacing: 40,
                        runSpacing: 20,
                        children: [
                          _MiniStat("48+", "Lessons"),
                          _MiniStat("12hrs", "Duration"),
                          _MiniStat("6", "Projects"),
                          _MiniStat("∞", "Access"),
                        ],
                      ).animate().fadeIn(delay: 600.ms),
                    ],
                  ),
                ),
                
                // Right Content (Hero Illustration)
                if (!isMobile)
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: Image.asset(
                        'assets/flutter_hero.png',
                        width: 500,
                        fit: BoxFit.contain,
                      )
                      .animate(onPlay: (controller) => controller.repeat(reverse: true))
                      .moveY(begin: 0, end: -15, duration: 2.seconds, curve: Curves.easeInOut)
                      .shimmer(delay: 3.seconds, duration: 2.seconds, color: Colors.white10),
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

class _MiniStat extends StatelessWidget {
  final String val;
  final String label;

  const _MiniStat(this.val, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(val, style: FlutterCourseFonts.label(24, color: FlutterCourseColors.primary, weight: FontWeight.w700)),
        Text(label, style: FlutterCourseFonts.body(14, color: Colors.white.withValues(alpha: 0.5))),
      ],
    );
  }
}
