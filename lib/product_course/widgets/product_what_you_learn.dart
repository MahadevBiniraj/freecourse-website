import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../product_course_theme.dart';

class ProductWhatYouLearn extends StatelessWidget {
  const ProductWhatYouLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final topics = [
      {
        'title': 'Product Strategy',
        'desc': 'Define vision, market fit, and competitive positioning.',
        'icon': Icons.track_changes_rounded
      },
      {
        'title': 'Agile & Scrum',
        'desc': 'Master execution frameworks, backlog grooming, and sprints.',
        'icon': Icons.sync_rounded
      },
      {
        'title': 'Data Analytics',
        'desc': 'Master KPIs, A/B testing, and growth experimentation.',
        'icon': Icons.insights_rounded
      },
      {
        'title': 'PRDs & Documentation',
        'desc': 'Write world-class requirements and feature specs.',
        'icon': Icons.description_outlined
      },
      {
        'title': 'UX & Prototyping',
        'desc': 'Collaborate with design and understand user psychology.',
        'icon': Icons.auto_awesome_mosaic_rounded
      },
      {
        'title': 'Stakeholder Mgmt',
        'desc': 'Navigate conflict and influence without authority.',
        'icon': Icons.groups_outlined
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 140,
      ),
      child: Column(
        children: [
          Text("The Strategic Pillars", style: ProductCourseFonts.heading(isMobile ? 32 : 48)),
          const SizedBox(height: 16),
          Text(
            "Every skill you need to transition from an individual contributor to a strategic product leader.",
            style: ProductCourseFonts.body(18, color: ProductCourseColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 80),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: isMobile ? 1.4 : 1.2,
            ),
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return _TopicCard(
                title: topics[index]['title'] as String,
                desc: topics[index]['desc'] as String,
                icon: topics[index]['icon'] as IconData,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TopicCard extends StatelessWidget {
  final String title;
  final String desc;
  final IconData icon;
  final int index;

  const _TopicCard({required this.title, required this.desc, required this.icon, required this.index});

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
              color: ProductCourseColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: ProductCourseColors.primary, size: 24),
          ),
          const SizedBox(height: 24),
          Text(title, style: ProductCourseFonts.heading(22)),
          const SizedBox(height: 12),
          Text(desc, style: ProductCourseFonts.body(16, color: ProductCourseColors.textSecondary)),
        ],
      ),
    ).animate().fadeIn(delay: (index * 100).ms).slideY(begin: 0.1);
  }
}
