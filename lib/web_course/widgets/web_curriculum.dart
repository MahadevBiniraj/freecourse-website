import 'package:flutter/material.dart';
import '../web_course_theme.dart';

class WebCurriculum extends StatelessWidget {
  const WebCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final modules = [
      {'title': 'Module 01: Modern Web Foundations', 'tech': 'HTML5, CSS3, Flexbox, Grid'},
      {'title': 'Module 02: JavaScript Masterclass', 'tech': 'ES6+, Async/Await, DOM, API'},
      {'title': 'Module 03: React.js Development', 'tech': 'Hooks, State, Routing, Redux'},
      {'title': 'Module 04: Backend with Node & Express', 'tech': 'Server Logic, Auth, Middleware'},
      {'title': 'Module 05: Database Design with MongoDB', 'tech': 'Mongoose, CRUD, Aggregation'},
      {'title': 'Module 06: Full Stack Project Deployment', 'tech': 'AWS, Docker, CI/CD'},
    ];

    return Container(
      width: double.infinity,
      color: WebCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.2, vertical: 120),
      child: Column(
        children: [
          Text("Course Curriculum", style: WebCourseFonts.heading(isMobile ? 32 : 48)),
          const SizedBox(height: 60),
          ...modules.map((m) => _ModuleItem(title: m['title']!, tech: m['tech']!)),
        ],
      ),
    );
  }
}

class _ModuleItem extends StatefulWidget {
  final String title, tech;
  const _ModuleItem({required this.title, required this.tech});
  @override
  State<_ModuleItem> createState() => _ModuleItemState();
}

class _ModuleItemState extends State<_ModuleItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 20),
    decoration: WebCourseStyles.glassBox(opacity: 0.05),
    child: Column(
      children: [
        InkWell(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: WebCourseFonts.heading(20)),
                      const SizedBox(height: 8),
                      Text(widget.tech, style: WebCourseFonts.code(13)),
                    ],
                  ),
                ),
                Icon(isExpanded ? Icons.remove : Icons.add, color: WebCourseColors.primary),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
            child: Column(
              children: [
                _SubItem("Intro to Web Technologies"),
                _SubItem("Advanced Architecture Principles"),
                _SubItem("Real-world Practical Lab"),
              ],
            ),
          ),
      ],
    ),
  );
}

class _SubItem extends StatelessWidget {
  final String title;
  const _SubItem(this.title);
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      children: [
        const Icon(Icons.play_circle_fill, size: 18, color: WebCourseColors.accent),
        const SizedBox(width: 12),
        Text(title, style: WebCourseFonts.body(16, color: WebCourseColors.textSecondary)),
      ],
    ),
  );
}
