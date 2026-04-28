import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LiveMentoringSection extends StatelessWidget {
  const LiveMentoringSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final mentors = [
      {'name': 'Athul', 'role': 'UX Researcher', 'image': 'assets/athul.png'},
      {'name': 'Malavika', 'role': 'Senior UI Designer', 'image': 'assets/malavika.png'},
      {'name': 'Fahad', 'role': 'Product Manager', 'image': 'assets/fahad.png'},
      {'name': 'Parvathy', 'role': 'Frontend Developer', 'image': 'assets/parvathymrimage.png'},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: Colors.black,
      child: Column(
        children: [
          const Text(
            "Live Mentoring",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          Text(
            "Get 1-on-1 mentoring sessions to guide you through the journey.\nOur mentors are industry experts working at top tech companies.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 18),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 80),
          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 4,
              crossAxisSpacing: 24,
              mainAxisSpacing: 40,
              childAspectRatio: 0.6, // Tall cards
            ),
            itemCount: mentors.length,
            itemBuilder: (context, index) {
              final mentor = mentors[index];
              return _buildMentorCard(mentor, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMentorCard(Map<String, String> mentor, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(mentor['image']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          mentor['name']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          mentor['role']!,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 14,
          ),
        ),
      ],
    ).animate().fadeIn(delay: (200 * index).ms).slideY(begin: 0.1, end: 0);
  }
}
