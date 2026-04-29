import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../python_course_theme.dart';

class PythonWhatYouLearn extends StatelessWidget {
  const PythonWhatYouLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final learningPoints = [
      {'title': 'Python Fundamentals', 'desc': 'Master the syntax, data structures, and OOP principles.'},
      {'title': 'Django Framework', 'desc': 'Build robust web applications using the battery-included framework.'},
      {'title': 'ORM & Databases', 'desc': 'Design and manage complex database schemas with Django ORM.'},
      {'title': 'REST APIs', 'desc': 'Create powerful APIs using Django REST Framework.'},
      {'title': 'Authentication', 'desc': 'Implement secure JWT and Session-based auth systems.'},
      {'title': 'Cloud Deployment', 'desc': 'Deploy your apps to AWS, Heroku, or DigitalOcean.'},
    ];

    return Container(
      width: double.infinity,
      color: PythonCourseColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "What You'll Master",
            style: PythonCourseFonts.heading(isMobile ? 32 : 48),
          ).animate().fadeIn(),
          const SizedBox(height: 16),
          Text(
            "A comprehensive curriculum designed for modern backend engineers.",
            style: PythonCourseFonts.body(18, color: PythonCourseColors.textSecondary),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 100.ms),
          const SizedBox(height: 80),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: isMobile ? 1.5 : 1.2,
            ),
            itemCount: learningPoints.length,
            itemBuilder: (context, index) {
              return _LearningCard(
                title: learningPoints[index]['title']!,
                desc: learningPoints[index]['desc']!,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _LearningCard extends StatelessWidget {
  final String title;
  final String desc;
  final int index;

  const _LearningCard({required this.title, required this.desc, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: PythonCourseColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.check, color: PythonCourseColors.primary, size: 20),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: PythonCourseFonts.heading(20, weight: FontWeight.w700, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: PythonCourseFonts.body(16, color: PythonCourseColors.textSecondary),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (200 + (index * 100)).ms).slideX(begin: 0.1);
  }
}
