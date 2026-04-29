import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final reviews = [
      {'name': 'Alex Johnson', 'tag': 'Google Play Store', 'text': 'This course is a game changer. I went from zero to my first app in just 2 weeks. The explanations are crystal clear!'},
      {'name': 'Sarah Chen', 'tag': 'iOS Developer', 'text': 'The project-based approach helped me build a portfolio that got me hired. Highly recommend the Firebase section!'},
      {'name': 'Marcus Wright', 'tag': 'App Store', 'text': 'I\'ve taken many Flutter courses, but this one is the most up-to-date and practical. And it\'s free? Unbelievable.'},
    ];

    return Container(
      width: double.infinity,
      color: FlutterCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
      child: Column(
        children: [
          Text("What Our Students Say", style: FlutterCourseFonts.body(isMobile ? 32 : 48, weight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 80),
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: reviews.asMap().entries.map((entry) {
              int idx = entry.key;
              var rev = entry.value;
              return _TestimonialCard(
                name: rev['name']!,
                tag: rev['tag']!,
                text: rev['text']!,
                initials: rev['name']!.split(' ').map((e) => e[0]).join(''),
              ).animate().fadeIn(delay: (idx * 200).ms).slideY(begin: 0.1);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _TestimonialCard extends StatefulWidget {
  final String name;
  final String tag;
  final String text;
  final String initials;

  const _TestimonialCard({required this.name, required this.tag, required this.text, required this.initials});

  @override
  State<_TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<_TestimonialCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 380,
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: FlutterCourseColors.surface,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: isHovered ? FlutterCourseColors.primary.withValues(alpha: 0.15) : Colors.black.withValues(alpha: 0.3),
              blurRadius: isHovered ? 40 : 20,
              offset: Offset(0, isHovered ? 20 : 10),
            )
          ],
          border: Border.all(
            color: isHovered ? FlutterCourseColors.primary.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        transform: Matrix4.translationValues(0.0, isHovered ? -10.0 : 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: List.generate(5, (index) => const Icon(Icons.star, color: FlutterCourseColors.primary, size: 20)),
            ),
            const SizedBox(height: 24),
            Text(
              "\"${widget.text}\"",
              style: FlutterCourseFonts.body(16, color: Colors.white70, weight: FontWeight.w400, height: 1.6),
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: FlutterCourseColors.primary.withValues(alpha: 0.1),
                  child: Text(widget.initials, style: const TextStyle(color: FlutterCourseColors.primary, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: FlutterCourseFonts.body(16, weight: FontWeight.w700, color: Colors.white)),
                    Text(widget.tag, style: FlutterCourseFonts.body(14, color: Colors.white38)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
