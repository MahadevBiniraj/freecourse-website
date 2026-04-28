import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class AdvanceBootcampSection extends StatelessWidget {
  const AdvanceBootcampSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Stack(
        children: [
          // Decorative background blur
          Positioned(
            top: -200,
            left: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.1),
                boxShadow: [
                  BoxShadow(color: Colors.white.withValues(alpha: 0.1), blurRadius: 100)
                ]
              ),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 140,
              horizontal: isMobile ? 24 : screenWidth * 0.1,
            ),
            child: Column(
              children: [
                const Text(
                  "Why Choose Our Bootcamp?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 16),
                const Text(
                  "Everything you need to launch a successful career as a product designer.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 18),
                ).animate().fadeIn(delay: 400.ms),
                const SizedBox(height: 80),
                
                // Features Grid
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFeatureCard(
                      Icons.work_outline_rounded,
                      "Job Ready Portfolio",
                      "Build a diverse portfolio with real-world projects that showcase your problem-solving skills.",
                      0,
                    ),
                    if (!isMobile) const SizedBox(width: 32),
                    if (isMobile) const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.people_outline_rounded,
                      "1-on-1 Mentoring",
                      "Get personalized feedback and career guidance from experienced industry professionals.",
                      1,
                    ),
                    if (!isMobile) const SizedBox(width: 32),
                    if (isMobile) const SizedBox(height: 24),
                    _buildFeatureCard(
                      Icons.rocket_launch_outlined,
                      "Career Support",
                      "Interview preparation, resume building, and direct introductions to our hiring partners.",
                      2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title, String desc, int index) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: Colors.white, size: 32),
            ),
            const SizedBox(height: 32),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              desc,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ],
        ),
      ).animate().fadeIn(delay: (600 + index * 150).ms).slideY(begin: 0.2, end: 0),
    );
  }
}
