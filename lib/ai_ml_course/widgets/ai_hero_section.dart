import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../ai_ml_course_theme.dart';

class AIHeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const AIHeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 800),
      decoration: const BoxDecoration(
        color: AICourseColors.background,
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
                    AICourseColors.primary.withOpacity(0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          
          // Data Stream Background (Faint Grid)
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: CustomPaint(painter: _DataStreamPainter()),
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
                          color: AICourseColors.primary.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AICourseColors.primary.withOpacity(0.2)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.terminal, color: AICourseColors.primary, size: 14),
                            const SizedBox(width: 8),
                            Text(
                              "SYS_INIT: AI_ML_MASTERY_V1",
                              style: AICourseFonts.code(12, color: AICourseColors.primary, weight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 600.ms),

                      const SizedBox(height: 32),

                      // Heading
                      RichText(
                        text: TextSpan(
                          style: AICourseFonts.display(isMobile ? 48 : 72, weight: FontWeight.w900, color: Colors.white),
                          children: [
                            const TextSpan(text: "Build Intelligence.\n"),
                            TextSpan(
                              text: "Master AI & ML",
                              style: TextStyle(color: AICourseColors.primary),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1),

                      const SizedBox(height: 24),

                      Text(
                        "Train, evaluate, and deploy intelligent models. Master Python, deep learning, and advanced algorithms to build the autonomous systems of tomorrow.",
                        style: AICourseFonts.body(20, color: AICourseColors.textSecondary, weight: FontWeight.w400),
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
                              backgroundColor: AICourseColors.primary,
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 20,
                              shadowColor: AICourseColors.primary.withOpacity(0.4),
                            ),
                            child: Text("INITIALIZE TRAINING", style: AICourseFonts.heading(16, weight: FontWeight.w800, color: Colors.black)),
                          ),
                          OutlinedButton(
                            onPressed: onViewCurriculum,
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: AICourseColors.border),
                              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("VIEW ARCHITECTURE", style: AICourseFonts.heading(16, weight: FontWeight.w700, color: Colors.white)),
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
                                  Text("model.py", style: AICourseFonts.code(12, color: AICourseColors.textSecondary)),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "import tensorflow as tf\n\nmodel = tf.keras.Sequential([\n    tf.keras.layers.Dense(128, activation='relu'),\n    tf.keras.layers.Dense(10, activation='softmax')\n])\n\nmodel.compile(optimizer='adam', loss='sparse_categorical_crossentropy')",
                                style: AICourseFonts.code(13, color: Colors.white70),
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
                        // Hero Image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/courses/ai_ml.png', // This exists now
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

  Widget _dot(Color color) => Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
}

class _DataStreamPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AICourseColors.primary.withOpacity(0.3)
      ..strokeWidth = 1.0;

    const spacing = 40.0;

    for (var i = 0.0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
