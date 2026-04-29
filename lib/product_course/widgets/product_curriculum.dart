import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../product_course_theme.dart';

class ProductCurriculum extends StatelessWidget {
  const ProductCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final modules = [
      {
        'title': 'Module 1: Product Foundations',
        'lessons': ['The PM Role & Responsibilities', 'Types of PMs', 'Product Life Cycle', 'Competitive Analysis']
      },
      {
        'title': 'Module 2: Strategy & Discovery',
        'lessons': ['User Research Techniques', 'Value Proposition Design', 'Lean Canvas Mastery', 'Opportunity Assessment']
      },
      {
        'title': 'Module 3: Tech for PMs',
        'lessons': ['System Architecture Basics', 'APIs & Data Flow', 'Cloud & Scaling Concepts', 'Talking to Engineers']
      },
      {
        'title': 'Module 4: Agile Execution',
        'lessons': ['Scrum vs Kanban', 'Backlog Prioritization', 'Writing PRDs & User Stories', 'Managing Sprints']
      },
      {
        'title': 'Module 5: Product Analytics',
        'lessons': ['Defining North Star Metrics', 'Cohort Analysis', 'Funnel Optimization', 'A/B Testing Frameworks']
      },
      {
        'title': 'Module 6: Launch & Growth',
        'lessons': ['Go-To-Market (GTM) Strategy', 'Pricing & Monetization', 'Product-Led Growth (PLG)', 'Post-Launch Iteration']
      },
    ];

    return Container(
      width: double.infinity,
      color: ProductCourseColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 140,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                Text("Course Curriculum", style: ProductCourseFonts.heading(isMobile ? 32 : 48)),
                const SizedBox(height: 16),
                Text(
                  "A comprehensive roadmap from beginner to strategic product leader.",
                  style: ProductCourseFonts.body(18, color: ProductCourseColors.textSecondary),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          ...modules.asMap().entries.map((entry) => _ModuleTile(
            title: entry.value['title'] as String,
            lessons: entry.value['lessons'] as List<String>,
            index: entry.key,
          )),
        ],
      ),
    );
  }
}

class _ModuleTile extends StatefulWidget {
  final String title;
  final List<String> lessons;
  final int index;

  const _ModuleTile({required this.title, required this.lessons, required this.index});

  @override
  State<_ModuleTile> createState() => _ModuleTileState();
}

class _ModuleTileState extends State<_ModuleTile> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isExpanded ? Colors.white.withOpacity(0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isExpanded ? ProductCourseColors.primary.withOpacity(0.3) : Colors.white10,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (val) => setState(() => isExpanded = val),
          title: Text(
            widget.title,
            style: ProductCourseFonts.heading(18, color: isExpanded ? ProductCourseColors.primary : Colors.white),
          ),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isExpanded ? ProductCourseColors.primary : Colors.white10,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "0${widget.index + 1}",
              style: ProductCourseFonts.mono(14, color: isExpanded ? Colors.black : Colors.white, weight: FontWeight.w700),
            ),
          ),
          trailing: Icon(
            isExpanded ? Icons.remove : Icons.add,
            color: isExpanded ? ProductCourseColors.primary : Colors.white,
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
                      const Icon(Icons.check_circle_outline, color: ProductCourseColors.primary, size: 16),
                      const SizedBox(width: 12),
                      Text(lesson, style: ProductCourseFonts.body(16, color: Colors.white70)),
                    ],
                  ),
                )).toList(),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (widget.index * 100).ms).slideX(begin: 0.1);
  }
}
