import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../game_course_theme.dart';

class GameProjectShowcase extends StatelessWidget {
  const GameProjectShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final projects = [
      {'title': 'Cyber Runner 2077', 'type': '2D Endless Runner', 'image': 'https://images.unsplash.com/photo-1542751371-adc38448a05e?auto=format&fit=crop&q=80&w=800'},
      {'title': 'Dungeon Quest', 'type': '3D Top-down RPG', 'image': 'https://images.unsplash.com/photo-1511512578047-dfb367046420?auto=format&fit=crop&q=80&w=800'},
      {'title': 'Space Odyssey', 'type': '3D Space Simulator', 'image': 'https://images.unsplash.com/photo-1614728263952-84ea256f9679?auto=format&fit=crop&q=80&w=800'},
    ];

    return Container(
      width: double.infinity,
      color: GameCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
      child: Column(
        children: [
          Text("Build Real Games", style: GameCourseFonts.heading(isMobile ? 32 : 48)),
          const SizedBox(height: 16),
          Text("Don't just learn. Build a portfolio of professional games.", style: GameCourseFonts.body(18, color: GameCourseColors.textSecondary)),
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
      decoration: GameCourseStyles.glassBox(
        opacity: isHovered ? 0.1 : 0.05,
        borderColor: isHovered ? GameCourseColors.primary.withValues(alpha: 0.3) : null,
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
                Text(widget.p['title']!, style: GameCourseFonts.heading(24)),
                const SizedBox(height: 12),
                Text(widget.p['type']!, style: GameCourseFonts.mono(14, color: GameCourseColors.primary)),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isHovered ? GameCourseColors.primary : Colors.white10,
                    foregroundColor: isHovered ? Colors.black : Colors.white70,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  ),
                  child: const Text("View Project Demo"),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ).animate().fadeIn().scale(begin: const Offset(0.95, 0.95));
}
