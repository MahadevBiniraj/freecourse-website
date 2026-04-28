import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'scroll_appear.dart';
import '../theme.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final reasons = [
      {
        'id': '1',
        'image': 'assets/why/expert_team.png',
        'title': 'Expert team',
        'desc':
            'Our team comprises individuals who are passionate about teaching and tech.',
        'color': AppColors.secondary,
      },
      {
        'id': '2',
        'image': 'assets/why/practical.png',
        'title': 'Practical',
        'desc':
            'We focus on practical hands-on learning by implementing concepts.',
        'color': AppColors.primary,
      },
      {
        'id': '3',
        'image': 'assets/why/results_driven.png',
        'title': 'Results-Driven',
        'desc':
            'We\'re committed to delivering measurable results for every student.',
        'color': AppColors.darkAccent,
      },
      {
        'id': '4',
        'image': 'assets/why/technology.png',
        'title': 'Technology',
        'desc':
            'We stay up-to-date with the latest technologies to provide solutions.',
        'color': AppColors.secondary,
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 140,
      ),
      decoration: const BoxDecoration(color: Colors.black),
      child: Column(
        children: [
          ScrollAppear(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: AppColors.primary.withValues(alpha: 0.2),
                    ),
                  ),
                  child: Text(
                    "WHY CHOOSE US",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Why choose Portfolio Builders?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 4,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: isMobile ? 0.9 : 0.72,
            ),
            itemCount: reasons.length,
            itemBuilder: (context, index) {
              final reason = reasons[index];
              return ScrollAppear(
                delay: (index * 150).ms,
                scale: 0.95,
                child: _WhyCard(
                  id: reason['id'] as String,
                  image: reason['image'] as String,
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
  final String id;
  final String image;
  final String title;
  final String desc;
  final Color color;

  const _WhyCard({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: AppStyles.glassBox(
      ).copyWith(boxShadow: AppStyles.premiumShadow),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  id,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Expanded(
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: image.startsWith('http')
                    ? Image.network(
                        image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.broken_image,
                              color: Colors.white24,
                              size: 48,
                            ),
                      )
                    : Image.asset(
                        image,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                              Icons.image_outlined,
                              color: Colors.white24,
                              size: 48,
                            ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Text(
            desc,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.5),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}
