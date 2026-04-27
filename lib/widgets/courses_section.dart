import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'course_card.dart';
import 'scroll_appear.dart';

class CoursesSection extends StatelessWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final courses = [
      {
        'title': 'Product Design',
        'desc': 'Master UX/UI design and build products that users love.',
        'icon': Icons.palette_outlined,
        'color': Colors.redAccent,
      },
      {
        'title': 'Data Science',
        'desc': 'Learn to analyze data and build machine learning models.',
        'icon': Icons.insights_rounded,
        'color': Colors.blueAccent,
      },
      {
        'title': 'Full Stack',
        'desc': 'Become a professional web developer from scratch.',
        'icon': Icons.layers_outlined,
        'color': Colors.white70,
      },
      {
        'title': 'Cybersecurity',
        'desc': 'Protect systems and networks from digital attacks.',
        'icon': Icons.shield_outlined,
        'color': Colors.greenAccent,
      },
      {
        'title': 'AI & ML',
        'desc': 'Deep dive into artificial intelligence and neural networks.',
        'icon': Icons.psychology_outlined,
        'color': Colors.redAccent,
      },
      {
        'title': 'Digital Marketing',
        'desc': 'Grow brands and reach customers in the digital age.',
        'icon': Icons.trending_up_rounded,
        'color': Colors.purpleAccent,
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ScrollAppear(
            child: Column(
              children: [
                const Text(
                  "Our Courses",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: isMobile ? 1.2 : 0.85,
            ),
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index];
              return ScrollAppear(
                delay: (index * 150).ms,
                begin: const Offset(0, 0.1),
                child: CourseCard(
                  title: course['title'] as String,
                  desc: course['desc'] as String,
                  icon: course['icon'] as IconData,
                  iconColor: course['color'] as Color,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
