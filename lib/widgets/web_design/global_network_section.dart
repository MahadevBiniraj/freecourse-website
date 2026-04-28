import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class GlobalNetworkSection extends StatelessWidget {
  const GlobalNetworkSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final avatars = [
      'assets/athul.png',
      'assets/fahad.png',
      'assets/tinu.png',
      'assets/malavika.png',
      'assets/parvathymrimage.png',
      'assets/mahadev.png',
      'assets/Kaustubh Mokashi.png',
      'assets/Supriya Kasar.png',
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          const Text(
            "Join a Thriving Community",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          const Text(
            "Connect with thousands of learners, mentors, and alumni worldwide.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          
          const SizedBox(height: 64),
          
          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatCard("10,000+", "Active Students", isMobile),
              SizedBox(width: isMobile ? 16 : 32),
              _buildStatCard("500+", "Projects Built", isMobile),
              SizedBox(width: isMobile ? 16 : 32),
              _buildStatCard("95%", "Success Rate", isMobile),
            ],
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),

          const SizedBox(height: 80),

          // Avatars Grid/Scroll
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: avatars.asMap().entries.map((e) => _HoverAvatar(
              imagePath: e.value,
              delay: e.key * 100,
            )).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String stat, String label, bool isMobile) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(isMobile ? 16 : 32),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: Column(
          children: [
            Text(
              stat,
              style: TextStyle(
                fontSize: isMobile ? 24 : 40,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
                letterSpacing: -1,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: isMobile ? 12 : 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _HoverAvatar extends StatefulWidget {
  final String imagePath;
  final int delay;

  const _HoverAvatar({required this.imagePath, required this.delay});

  @override
  State<_HoverAvatar> createState() => _HoverAvatarState();
}

class _HoverAvatarState extends State<_HoverAvatar> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isHovered ? AppColors.primary : Colors.white,
              width: 3,
            ),
            boxShadow: isHovered ? [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 15,
                spreadRadius: 2,
              )
            ] : [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              )
            ],
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ).animate().fadeIn(delay: widget.delay.ms).scale(),
    );
  }
}
