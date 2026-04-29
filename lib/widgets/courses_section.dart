import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/scroll_appear.dart';
import '../widgets/course_card.dart';
import '../theme.dart';
import '../screens/web_design_screen.dart';
import '../flutter_course/flutter_course_landing_page.dart';
import '../web_course/web_course_landing_page.dart';
import '../game_course/game_course_landing_page.dart';

import '../python_course/python_course_landing_page.dart';
import '../product_course/product_course_landing_page.dart';

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
        'url': 'https://portfoliobuilders.in/courses/',
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
        'title': 'Game Dev (Unity & C#)',
        'desc': 'Build immersive 2D and 3D games with Unity engine.',
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
        'title': 'Product Management',
        'desc': 'Define the vision and lead the development of successful products.',
        'image': 'assets/courses/project_management.png',
        'tag': 'Career-focused',
      },
    ];

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.background,
      ),
      child: Stack(
        children: [
          // 1. Decorative Glows
          Positioned(
            top: -300,
            left: -300,
            child: Container(
              width: 800,
              height: 800,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 2. Faint Grid Pattern
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: CustomPaint(painter: _GridPainter()),
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
                    AppColors.darkAccent.withValues(alpha: 0.15),
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
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: AppColors.primary.withValues(alpha: 0.2),
                          ),
                        ),
                        child: const Text(
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
                        child: const Text(
                          "Choose your path and start building real-world skills today. Our curriculum is designed by industry experts to help you break into tech.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 18,
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
                        title: course['title']!,
                        desc: course['desc']!,
                        imagePath: course['image']!,
                        tag: course['tag']!,
                        url: course['url'],
                        onTap: () {
                          if (course['title'] == 'UI/UX Design') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WebDesignScreen(),
                              ),
                            );
                          } else if (course['title'] == 'Mobile App Dev (Flutter)') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FlutterCourseLandingPage(),
                              ),
                            );
                          } else if (course['title'] == 'Full Stack Web Dev') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WebCourseLandingPage(),
                              ),
                            );
                          } else if (course['title'] == 'Game Dev (Unity & C#)') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const GameCourseLandingPage(),
                              ),
                            );
                          } else if (course['title'] == 'Python Django') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const PythonCourseLandingPage(),
                              ),
                            );
                          } else if (course['title'] == 'Product Management') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProductCourseLandingPage(),
                              ),
                            );
                          }
                        },
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
              opacity: 0.02,
              child: Image.asset(
                'assets/noise.png',
                repeat: ImageRepeat.repeat,
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

    const spacing = 40.0;

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
