import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'scroll_appear.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final reasons = [
      {
        'icon': Icons.person_outline_rounded,
        'title': 'Expert Mentors',
        'desc': 'Learn from industry professionals who have been in your shoes.',
        'color': Colors.blue,
      },
      {
        'icon': Icons.work_outline_rounded,
        'title': 'Real Jobs',
        'desc': 'Get hired by top tech companies around the world.',
        'color': Colors.amber,
      },
      {
        'icon': Icons.groups_outlined,
        'title': 'Community',
        'desc': 'Join a supportive community of learners and alumni.',
        'color': Colors.purple,
      },
      {
        'icon': Icons.forum_outlined,
        'title': 'Mentorship',
        'desc': 'Get 1-on-1 guidance from experts to accelerate your career.',
        'color': Colors.green,
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      color: Colors.white,
      child: Column(
        children: [
          ScrollAppear(
            child: Column(
              children: [
                const Text(
                  "Why choose OpenBootcamp?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
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
              crossAxisCount: isMobile ? 1 : 4,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1.5 : 0.8,
            ),
            itemCount: reasons.length,
            itemBuilder: (context, index) {
              final reason = reasons[index];
              return ScrollAppear(
                delay: (index * 150).ms,
                scale: 0.9,
                child: _WhyCard(
                  icon: reason['icon'] as IconData,
                  title: reason['title'] as String,
                  desc: reason['desc'] as String,
                  color: reason['color'] as Color,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _WhyCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;

  const _WhyCard({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
