import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../game_course_theme.dart';

class GameWhatYouLearn extends StatelessWidget {
  const GameWhatYouLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final items = [
      {'title': 'Unity 3D Engine', 'desc': 'Master the world\'s most popular game engine.', 'icon': Icons.view_in_ar_rounded},
      {'title': 'C# Scripting', 'desc': 'Learn professional programming for game logic.', 'icon': Icons.code_rounded},
      {'title': 'Physics & Collision', 'desc': 'Implement realistic gravity, force, and impact.', 'icon': Icons.bolt_rounded},
      {'title': '2D/3D Animation', 'desc': 'Create fluid motions using Keyframes and Blend Trees.', 'icon': Icons.animation_rounded},
      {'title': 'Artificial Intelligence', 'desc': 'Build smart enemies using Pathfinding and State Machines.', 'icon': Icons.psychology_rounded},
      {'title': 'Mobile Optimization', 'desc': 'Learn to ship high-performance games to iOS and Android.', 'icon': Icons.speed_rounded},
    ];

    return Container(
      width: double.infinity,
      color: GameCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
      child: Column(
        children: [
          _SectionHeader(title: "Become a Game Developer", subtitle: "A structured curriculum to master game creation from A to Z."),
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
      Text(title, textAlign: TextAlign.center, style: GameCourseFonts.heading(MediaQuery.of(context).size.width < 900 ? 32 : 48)),
      const SizedBox(height: 16),
      Text(subtitle, textAlign: TextAlign.center, style: GameCourseFonts.body(18, color: GameCourseColors.textSecondary)),
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
      decoration: GameCourseStyles.glassBox(
        opacity: isHovered ? 0.1 : 0.05,
        borderColor: isHovered ? GameCourseColors.primary.withValues(alpha: 0.3) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(widget.item['icon'], color: GameCourseColors.primary, size: 40),
          const SizedBox(height: 24),
          Text(widget.item['title'], style: GameCourseFonts.heading(22)),
          const SizedBox(height: 12),
          Text(widget.item['desc'], style: GameCourseFonts.body(15, color: GameCourseColors.textSecondary)),
        ],
      ),
    ),
  );
}
