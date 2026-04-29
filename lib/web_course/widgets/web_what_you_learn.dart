import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../web_course_theme.dart';

class WebWhatYouLearn extends StatelessWidget {
  const WebWhatYouLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final items = [
      {'title': 'Frontend Mastery', 'desc': 'Master HTML5, CSS3, and Modern JavaScript.', 'icon': Icons.web},
      {'title': 'React & Redux', 'desc': 'Build scalable UIs with the most popular framework.', 'icon': Icons.javascript},
      {'title': 'Node.js & Express', 'desc': 'Architect robust and fast backend services.', 'icon': Icons.storage},
      {'title': 'Databases', 'desc': 'Learn MongoDB and PostgreSQL for data storage.', 'icon': Icons.storage_rounded},
      {'title': 'Authentication', 'desc': 'Secure your apps with JWT and OAuth.', 'icon': Icons.lock},
      {'title': 'CI/CD & DevOps', 'desc': 'Deploy to AWS, Heroku, and Netlify.', 'icon': Icons.cloud_upload},
    ];

    return Container(
      width: double.infinity,
      color: WebCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
      child: Column(
        children: [
          _SectionHeader(title: "Course Curriculum Highlights", subtitle: "Everything you need to become a high-paid developer."),
          const SizedBox(height: 80),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.4,
            ),
            itemCount: items.length,
            itemBuilder: (context, i) => _LearnCard(item: items[i]),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title, subtitle;
  const _SectionHeader({required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text(title, textAlign: TextAlign.center, style: WebCourseFonts.heading(MediaQuery.of(context).size.width < 900 ? 32 : 48)),
      const SizedBox(height: 16),
      Text(subtitle, textAlign: TextAlign.center, style: WebCourseFonts.body(18, color: WebCourseColors.textSecondary)),
    ],
  );
}

class _LearnCard extends StatefulWidget {
  final Map<String, dynamic> item;
  const _LearnCard({required this.item});
  @override
  State<_LearnCard> createState() => _LearnCardState();
}

class _LearnCardState extends State<_LearnCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => isHovered = true),
    onExit: (_) => setState(() => isHovered = false),
    child: AnimatedContainer(
      duration: 300.ms,
      padding: const EdgeInsets.all(40),
      decoration: WebCourseStyles.glassBox(
        opacity: isHovered ? 0.1 : 0.05,
        borderColor: isHovered ? WebCourseColors.primary.withValues(alpha: 0.3) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(widget.item['icon'], color: WebCourseColors.primary, size: 40),
          const SizedBox(height: 24),
          Text(widget.item['title'], style: WebCourseFonts.heading(22)),
          const SizedBox(height: 12),
          Text(widget.item['desc'], style: WebCourseFonts.body(15, color: WebCourseColors.textSecondary)),
        ],
      ),
    ),
  );
}
