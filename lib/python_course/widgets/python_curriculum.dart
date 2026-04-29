import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../python_course_theme.dart';

class PythonCurriculum extends StatelessWidget {
  const PythonCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final modules = [
      {
        'title': 'Module 1: Python Foundations',
        'lessons': ['Python Setup & Environment', 'Variables & Data Types', 'Control Flow (If, Loops)', 'Functions & Modules']
      },
      {
        'title': 'Module 2: Object-Oriented Python',
        'lessons': ['Classes & Objects', 'Inheritance & Polymorphism', 'Encapsulation & Abstraction', 'Mixins & Multiple Inheritance']
      },
      {
        'title': 'Module 3: Python Deep Dive',
        'lessons': ['Pythonic Code & Clean Coding', 'Advanced Data Structures', 'Decorators & Generators', 'Asynchronous Programming (asyncio)']
      },
      {
        'title': 'Module 4: Django Foundations',
        'lessons': ['MTV Architecture', 'URL Routing & Views', 'Template Engine & Context', 'Static & Media Files Management']
      },
      {
        'title': 'Module 5: Database & ORM',
        'lessons': ['Complex QuerySets', 'Model Relationships', 'Custom Managers & QuerySets', 'Migrations & Data Integrity']
      },
      {
        'title': 'Module 6: RESTful APIs',
        'lessons': ['DRF Serialization', 'ViewSets & Routers', 'Filtering, Sorting & Pagination', 'API Documentation (Swagger)']
      },
      {
        'title': 'Module 7: Security & Auth',
        'lessons': ['Custom User Models', 'JWT & OAuth2 Integration', 'CORS & CSRF Protection', 'Middlewares for Security']
      },
    ];

    return Container(
      width: double.infinity,
      color: PythonCourseColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text("Course Curriculum", style: PythonCourseFonts.heading(isMobile ? 32 : 48)),
                const SizedBox(height: 16),
                Text("Step-by-step roadmap to becoming a professional developer.", style: PythonCourseFonts.body(18, color: PythonCourseColors.textSecondary)),
              ],
            ),
          ),
          const SizedBox(height: 80),
          ...modules.asMap().entries.map((entry) => _ModuleExpansionTile(
            title: entry.value['title'] as String,
            lessons: entry.value['lessons'] as List<String>,
            index: entry.key,
          )),
        ],
      ),
    );
  }
}

class _ModuleExpansionTile extends StatefulWidget {
  final String title;
  final List<String> lessons;
  final int index;

  const _ModuleExpansionTile({required this.title, required this.lessons, required this.index});

  @override
  State<_ModuleExpansionTile> createState() => _ModuleExpansionTileState();
}

class _ModuleExpansionTileState extends State<_ModuleExpansionTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isExpanded ? Colors.white.withOpacity(0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isExpanded ? PythonCourseColors.primary.withOpacity(0.3) : Colors.white.withOpacity(0.05)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (expanded) => setState(() => isExpanded = expanded),
          title: Text(
            widget.title,
            style: PythonCourseFonts.heading(18, weight: FontWeight.w600, color: isExpanded ? PythonCourseColors.primary : Colors.white),
          ),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isExpanded ? PythonCourseColors.primary : Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "0${widget.index + 1}",
              style: PythonCourseFonts.mono(14, color: isExpanded ? Colors.black : Colors.white, weight: FontWeight.w700),
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.remove : Icons.add,
            color: isExpanded ? PythonCourseColors.primary : Colors.white,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(72, 0, 32, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.lessons.map((lesson) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.play_circle_outline, color: PythonCourseColors.primary, size: 16),
                      const SizedBox(width: 12),
                      Text(lesson, style: PythonCourseFonts.body(16, color: Colors.white70)),
                    ],
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (widget.index * 100).ms).slideY(begin: 0.1);
  }
}
