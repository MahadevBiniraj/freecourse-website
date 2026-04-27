import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'course_card.dart';
import 'scroll_appear.dart';
import '../theme.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final courses = [
      {
        'title': 'UI/UX Design',
        'desc': 'Master modern design principles and build stunning interfaces.',
        'image': 'assets/courses/ui_ux.png',
        'tag': 'Beginner Friendly',
      },
      {
        'title': 'Full Stack Web Dev',
        'desc': 'Build powerful web applications from frontend to backend.',
        'image': 'assets/courses/full_stack.png',
        'tag': 'Job-ready',
      },
      {
        'title': 'Mobile App Dev (Flutter)',
        'desc': 'Create beautiful cross-platform apps with Flutter.',
        'image': 'assets/courses/mobile_dev.png',
        'tag': 'Job-ready',
      },
      {
        'title': 'Game Development',
        'desc': 'Bring your imagination to life with interactive mechanics.',
        'image': 'assets/courses/game_dev.png',
        'tag': 'Project-based',
      },
      {
        'title': 'Python Django',
        'desc': 'Build scalable and secure backends with Python.',
        'image': 'assets/courses/python_django.png',
        'tag': 'Advanced',
      },
      {
        'title': 'Project Management',
        'desc': 'Lead teams and deliver successful tech products.',
        'image': 'assets/courses/project_management.png',
        'tag': 'Career-focused',
      },
    ];

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          // 1. Premium Background
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF000000),
                    Color(0xFF020B1A),
                    Color(0xFF000000),
                  ],
                ),
              ),
            ),
          ),
          
          // 2. Faint Grid Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: CustomPaint(
                painter: _GridPainter(),
              ),
            ),
          ),

          // 3. Subtle Radial Glow
          Positioned(
            top: 200,
            right: -200,
            child: Container(
              width: 1000,
              height: 1000,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.accent.withValues(alpha: 0.15),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 4. Content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 140,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ScrollAppear(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
                        ),
                        child: Text(
                          "LEARN FROM THE BEST",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Explore In-Demand Courses",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 36 : 64,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -2,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 700,
                        child: Text(
                          "Choose your path and start building real-world skills today. Our curriculum is designed by industry experts to help you break into tech.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isMobile ? 16 : 20,
                            color: Colors.white.withValues(alpha: 0.5),
                            height: 1.6,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isMobile ? 1 : 3,
                    crossAxisSpacing: 32,
                    mainAxisSpacing: 32,
                    childAspectRatio: isMobile ? 0.9 : 0.75,
                  ),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return ScrollAppear(
                      delay: (index * 150).ms,
                      begin: const Offset(0, 0.2),
                      child: CourseCard(
                        title: course['title'] as String,
                        desc: course['desc'] as String,
                        imagePath: course['image'] as String,
                        tag: course['tag'] as String,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          
          // Noise Overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.04,
              child: Image.network(
                'https://grainy-gradients.vercel.app/noise.svg',
                repeat: ImageRepeat.repeat,
                fit: BoxFit.none,
              ),
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
      ..color = Colors.white.withValues(alpha: 0.1)
      ..strokeWidth = 0.5;

    const spacing = 80.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
