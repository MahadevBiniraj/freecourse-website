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
      {'name': 'Alex Rivera', 'role': 'Senior Flutter Dev', 'image': 'https://randomuser.me/api/portraits/men/32.jpg'},
      {'name': 'Sarah Chen', 'role': 'UI/UX Lead', 'image': 'https://randomuser.me/api/portraits/women/44.jpg'},
      {'name': 'Marcus Thorne', 'role': 'Full-Stack Engineer', 'image': 'https://randomuser.me/api/portraits/men/46.jpg'},
      {'name': 'Elena Rodriguez', 'role': 'Product Manager', 'image': 'https://randomuser.me/api/portraits/women/68.jpg'},
      {'name': 'David Kim', 'role': 'AI Researcher', 'image': 'https://randomuser.me/api/portraits/men/22.jpg'},
      {'name': 'Jasmine Lee', 'role': 'DevOps Lead', 'image': 'https://randomuser.me/api/portraits/women/33.jpg'},
      {'name': 'Robert Wilson', 'role': 'Backend Expert', 'image': 'https://randomuser.me/api/portraits/men/55.jpg'},
      {'name': 'Maria Garcia', 'role': 'Cybersecurity Lead', 'image': 'https://randomuser.me/api/portraits/women/11.jpg'},
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 4,
              crossAxisSpacing: 24,
              mainAxisSpacing: 48,
              childAspectRatio: isMobile ? 0.7 : 0.8,
            ),
            itemCount: mentors.length,
            itemBuilder: (context, index) {
              final mentor = mentors[index];
              return ScrollAppear(
                delay: (index * 150).ms,
                scale: 0.9,
                child: MentorCard(
                  name: mentor['name']!,
                  role: mentor['role']!,
                  image: mentor['image']!,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
