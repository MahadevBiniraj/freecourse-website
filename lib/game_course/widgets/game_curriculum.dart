import 'package:flutter/material.dart';
import '../game_course_theme.dart';

class GameCurriculum extends StatelessWidget {
  const GameCurriculum({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final modules = [
      {'title': 'Module 01: Setup & Unity Interface', 'tech': 'Unity Hub, Layout, Project Structure'},
      {'title': 'Module 02: C# Programming for Games', 'tech': 'Variables, Loops, Classes, ScriptableObjects'},
      {'title': 'Module 03: 2D Platformer Development', 'tech': 'Sprite Sheets, Tilemaps, Physics2D'},
      {'title': 'Module 04: 3D Game World Design', 'tech': 'Terrain, Lighting, NavMesh, Materials'},
      {'title': 'Module 05: Game UI & Audio Systems', 'tech': 'Canvas, EventSystem, AudioMixers'},
      {'title': 'Module 06: Polishing & Publishing', 'tech': 'Post-Processing, Optimization, Build Settings'},
    ];

    return Container(
      width: double.infinity,
      color: GameCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.2, vertical: 120),
      child: Column(
        children: [
          Text("Course Curriculum", style: GameCourseFonts.heading(isMobile ? 32 : 48)),
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
    decoration: GameCourseStyles.glassBox(opacity: 0.05),
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
                      Text(widget.title, style: GameCourseFonts.heading(20)),
                      const SizedBox(height: 8),
                      Text(widget.tech, style: GameCourseFonts.mono(13)),
                    ],
                  ),
                ),
                Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: GameCourseColors.primary),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 32),
            child: Column(
              children: [
                _SubItem("Intro to Game Development"),
                _SubItem("Technical Deep Dive"),
                _SubItem("Hands-on Game Lab"),
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
        const Icon(Icons.videogame_asset_rounded, size: 18, color: GameCourseColors.primary),
        const SizedBox(width: 12),
        Text(title, style: GameCourseFonts.body(16, color: GameCourseColors.textSecondary)),
      ],
    ),
  );
}
