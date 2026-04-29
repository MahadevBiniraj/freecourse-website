import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../web_course_theme.dart';

class ProjectsShowcase extends StatelessWidget {
  const ProjectsShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final projects = [
      {'title': 'E-Commerce SaaS', 'tech': 'React, Node, Stripe', 'image': 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=800'},
      {'title': 'Dev Portfolio', 'tech': 'Next.js, Framer Motion', 'image': 'https://images.unsplash.com/photo-1507238691740-187a5b1d37b8?auto=format&fit=crop&q=80&w=800'},
      {'title': 'Social Platform', 'tech': 'MERN Stack, Socket.io', 'image': 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=800'},
    ];

    return Container(
      width: double.infinity,
      color: WebCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
      child: Column(
        children: [
          Text("Build Real-World Projects", style: WebCourseFonts.heading(isMobile ? 32 : 48)),
          const SizedBox(height: 16),
          Text("You don't just watch videos. You build production-ready software.", style: WebCourseFonts.body(18, color: WebCourseColors.textSecondary)),
          const SizedBox(height: 80),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            alignment: WrapAlignment.center,
            children: projects.map((p) => _ProjectCard(p: p)).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, String> p;
  const _ProjectCard({required this.p});
  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => isHovered = true),
    onExit: (_) => setState(() => isHovered = false),
    child: AnimatedContainer(
      duration: 300.ms,
      width: 400,
      decoration: WebCourseStyles.glassBox(
        opacity: isHovered ? 0.1 : 0.05,
        borderColor: isHovered ? WebCourseColors.primary.withValues(alpha: 0.3) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Image.network(widget.p['image']!, height: 250, width: 400, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.p['title']!, style: WebCourseFonts.heading(24)),
                const SizedBox(height: 12),
                Text(widget.p['tech']!, style: WebCourseFonts.code(14)),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("View Case Study", style: WebCourseFonts.body(14, color: WebCourseColors.primary, weight: FontWeight.w700)),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 16, color: WebCourseColors.primary),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95));
}
