import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CurriculumSection extends StatelessWidget {
  const CurriculumSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final modules = [
      {'title': 'Research', 'image': 'assets/courses/ui_ux.png', 'desc': 'Understand your audience.'},
      {'title': 'Prototype', 'image': 'assets/courses/mobile_dev.png', 'desc': 'Bring ideas to life.'},
      {'title': 'Testing', 'image': 'assets/courses/game_dev.png', 'desc': 'Validate your designs.'},
      {'title': 'Frontend', 'image': 'assets/courses/full_stack.png', 'desc': 'Code the interface.'},
      {'title': 'Backend', 'image': 'assets/courses/project_management.png', 'desc': 'Go live with confidence.'},
      {'title': 'Launch', 'image': 'assets/courses/python_django.png', 'desc': 'Measure success.'},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "Industry Ready Curriculum",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.black, letterSpacing: -1),
          ),
          const SizedBox(height: 16),
          const Text(
            "A well-structured curriculum to help you become an expert. Our experts have\nthoughtfully crafted the curriculum to meet industry standards.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 80),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: 1.2,
            ),
            itemCount: modules.length,
            itemBuilder: (context, index) {
              final module = modules[index];
              return _buildModuleCard(module);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModuleCard(Map<String, String> module) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(module['image']!),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.3), BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  module['title']!,
                  style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Desc is removed in the image, the label is just the title (e.g., "Research", "Prototype")
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 100.ms).scale();
  }
}
