import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'mentor_card.dart';
import 'scroll_appear.dart';
import '../theme.dart';

class MentorsSection extends StatelessWidget {
  const MentorsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final mentors = [
      {'name': 'Athul', 'role': 'Flutter Expert', 'image': 'assets/athul.png'},
      {'name': 'Fahad', 'role': 'Web Developer', 'image': 'assets/fahad.png'},
      {'name': 'Tinu', 'role': 'UI/UX Designer', 'image': 'assets/tinu.png'},
      {'name': 'Malavika', 'role': 'Data Scientist', 'image': 'assets/malavika.png'},
      {'name': 'Parvathy MR', 'role': 'Backend Engineer', 'image': 'assets/parvathymrimage.png'},
      {'name': 'Mahadev', 'role': 'Full Stack Dev', 'image': 'assets/mahadev.png'},
      {'name': 'Kaustubh Mokashi', 'role': 'DevOps Engineer', 'image': 'assets/Kaustubh Mokashi.png'},
      {'name': 'Supriya Kasar', 'role': 'AI Researcher', 'image': 'assets/Supriya Kasar.png'},
      {'name': 'Himanshu Chaudhary', 'role': 'Product Lead', 'image': 'assets/Himanshu Chaudhary.png'},
      {'name': 'Archana Anil', 'role': 'Security Expert', 'image': 'assets/Archana Anil.png'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          ScrollAppear(
            child: Column(
              children: [
                const Text(
                  "Meet some of your expert\nmentors",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 80),
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = isMobile ? 16.0 : 24.0;
              final crossAxisCount = isMobile ? 2 : 4;
              final width = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

              return Wrap(
                spacing: spacing,
                runSpacing: 48,
                alignment: WrapAlignment.center,
                children: List.generate(mentors.length, (index) {
                  final mentor = mentors[index];
                  return ScrollAppear(
                    delay: (index * 150).ms,
                    scale: 0.9,
                    child: SizedBox(
                      width: width,
                      child: MentorCard(
                        name: mentor['name']!,
                        role: mentor['role']!,
                        image: mentor['image']!,
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
