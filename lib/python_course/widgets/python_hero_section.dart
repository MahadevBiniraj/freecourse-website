import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../python_course_theme.dart';

class PythonHeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const PythonHeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 800),
      decoration: const BoxDecoration(
        color: PythonCourseColors.background,
      ),
      child: Stack(
        children: [
          // Background Glow
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    PythonCourseColors.primary.withOpacity(0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 120,
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
                          color: PythonCourseColors.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: PythonCourseColors.primary.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.code, color: PythonCourseColors.primary, size: 14),
                            const SizedBox(width: 8),
                            Text(
                              "BACKEND DEVELOPMENT • 2024 EDITION",
                              style: PythonCourseFonts.mono(12, color: PythonCourseColors.primary, weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 600.ms),

                      const SizedBox(height: 32),

                      // Heading
                      RichText(
                        text: TextSpan(
                          style: PythonCourseFonts.heading(isMobile ? 48 : 72, weight: FontWeight.w800, color: Colors.white),
                          children: [
                            const TextSpan(text: "Master Backend with\n"),
                            TextSpan(
                              text: "Python & Django",
                              style: TextStyle(color: PythonCourseColors.primary),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1),

                      const SizedBox(height: 24),

                      Text(
                        "Build scalable, secure, and professional web applications from scratch. From Python fundamentals to advanced Django ORM and REST APIs.",
                        style: PythonCourseFonts.body(20, color: PythonCourseColors.textSecondary, weight: FontWeight.w400),
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
                              backgroundColor: PythonCourseColors.primary,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 20,
                              shadowColor: PythonCourseColors.primary.withOpacity(0.4),
                            ),
                            child: Text("ENROLL FOR FREE", style: PythonCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.black)),
                          ),
                          OutlinedButton(
                            onPressed: onViewCurriculum,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: PythonCourseColors.border),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("VIEW CURRICULUM", style: PythonCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.white)),
                          ),
                        ],
                      ).animate().fadeIn(delay: 400.ms),

                      const SizedBox(height: 80),

                      // Floating Tech Snippet
                      if (!isMobile)
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.03),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white.withOpacity(0.05)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  _dot(Colors.red),
                                  const SizedBox(width: 6),
                                  _dot(Colors.amber),
                                  const SizedBox(width: 6),
                                  _dot(Colors.green),
                                  const SizedBox(width: 12),
                                  Text("models.py", style: PythonCourseFonts.mono(12, color: PythonCourseColors.textSecondary)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "class Course(models.Model):\n  title = models.CharField(max_length=200)\n  instructor = models.ForeignKey(User, ...)\n  created_at = models.DateTimeField(auto_now_add=True)",
                                style: PythonCourseFonts.mono(13, color: Colors.white70),
                              ),
                            ],
                          ),
                        ).animate(onPlay: (c) => c.repeat(reverse: true))
                        .moveY(begin: 0, end: -10, duration: 3.seconds, curve: Curves.easeInOut),
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
                        // Subtle Glow behind image
                        Container(
                          width: 400,
                          height: 400,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                PythonCourseColors.primary.withOpacity(0.1),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        
                        // Hero Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/python_django_hero.png', // Assuming user places it there, but for now I'll use the path I have
                            // Since I can't guarantee the path in asset folder, I'll use the absolute path for demonstration if needed, 
                            // but in actual code I should use the expected asset path.
                            width: 600,
                            fit: BoxFit.contain,
                          ),
                        )
                        .animate(onPlay: (controller) => controller.repeat(reverse: true))
                        .moveY(begin: 0, end: -15, duration: 2.seconds, curve: Curves.easeInOut),
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

  Widget _dot(Color color) => Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}
