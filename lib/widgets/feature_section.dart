import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'scroll_appear.dart';
import '../theme.dart';

class FeatureSection extends StatelessWidget {
  const FeatureSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final features = [
      {
        'id': '01',
        'title': 'Intensive Training',
        'desc': 'Our programs are designed to be challenging and fast-paced.'
      },
      {
        'id': '02',
        'title': 'Project-Based',
        'desc': 'Build a portfolio of real-world projects that impress employers.'
      },
      {
        'id': '03',
        'title': 'Critical Thinking',
        'desc': 'Learn to solve complex problems and think like a professional.'
      },
      {
        'id': '04',
        'title': 'Hard Skills',
        'desc': 'Master the tools and technologies used by top companies.'
      },
    ];

    return Container(
      width: double.infinity,
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.15,
        vertical: 120,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScrollAppear(
            child: Text(
              "A tough approach to\nlearning and critical\nthinking",
              style: TextStyle(
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                height: 1.1,
              ),
            ),
          ),
          const SizedBox(height: 80),
          ...features.asMap().entries.map((e) => _buildFeatureItem(e.value, isMobile, e.key)),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(Map<String, String> feature, bool isMobile, int index) {
    return ScrollAppear(
      delay: (index * 150).ms,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 48.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feature['id']!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feature['title']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    feature['desc']!,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
