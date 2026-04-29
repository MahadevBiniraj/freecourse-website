import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../python_course_theme.dart';

class PythonProjectShowcase extends StatelessWidget {
  const PythonProjectShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final projects = [
      {
        'title': 'SaaS Dashboard API',
        'type': 'Enterprise Architecture',
        'tech': 'Django, PostgreSQL, Redis, DRF',
        'image': 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=800'
      },
      {
        'title': 'E-commerce Engine',
        'type': 'Marketplace Backend',
        'tech': 'Django, Stripe API, Celery',
        'image': 'https://images.unsplash.com/photo-1563986768609-322da13575f3?auto=format&fit=crop&q=80&w=800'
      },
      {
        'title': 'Real-time Analytics',
        'type': 'Data Streaming',
        'tech': 'Django Channels, WebSockets',
        'image': 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?auto=format&fit=crop&q=80&w=800'
      },
    ];

    return Container(
      width: double.infinity,
      color: PythonCourseColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      child: Column(
        children: [
          Text("Backend Portfolios", style: PythonCourseFonts.heading(isMobile ? 32 : 48)),
          const SizedBox(height: 16),
          Text("Build production-ready systems that recruiters look for.", style: PythonCourseFonts.body(18, color: PythonCourseColors.textSecondary)),
          const SizedBox(height: 80),
          Wrap(
            spacing: 32,
            runSpacing: 32,
            alignment: WrapAlignment.center,
            children: projects.map((p) => _ProjectCard(project: p)).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Map<String, String> project;
  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: 300.ms,
        width: 380,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.02),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isHovered ? PythonCourseColors.primary.withOpacity(0.3) : Colors.white.withOpacity(0.05),
          ),
          boxShadow: isHovered ? [
            BoxShadow(
              color: PythonCourseColors.primary.withOpacity(0.05),
              blurRadius: 40,
              spreadRadius: 5,
            )
          ] : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
              child: Stack(
                children: [
                  Image.network(widget.project['image']!, height: 220, width: 380, fit: BoxFit.cover),
                  if (isHovered)
                    Container(
                      height: 220,
                      width: 380,
                      color: PythonCourseColors.primary.withOpacity(0.2),
                      child: const Center(
                        child: Icon(Icons.code, color: Colors.white, size: 48),
                      ),
                    ).animate().fadeIn(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.project['type']!, style: PythonCourseFonts.mono(12, color: PythonCourseColors.primary)),
                  const SizedBox(height: 12),
                  Text(widget.project['title']!, style: PythonCourseFonts.heading(24, weight: FontWeight.w700, color: Colors.white)),
                  const SizedBox(height: 16),
                  Text(widget.project['tech']!, style: PythonCourseFonts.body(14, color: PythonCourseColors.textSecondary)),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isHovered ? PythonCourseColors.primary : Colors.white10,
                      foregroundColor: isHovered ? Colors.black : Colors.white70,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text("View Repository"),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward_rounded, size: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn().scale(begin: const Offset(0.98, 0.98));
  }
}
