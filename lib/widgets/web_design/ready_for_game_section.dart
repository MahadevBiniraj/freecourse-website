import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class ReadyForGameSection extends StatelessWidget {
  const ReadyForGameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.15,
        vertical: 120,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          const Text(
            "See the Platform in Action",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 40,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          const Text(
            "Get a sneak peek into our world-class curriculum and learning experience.",
            textAlign: TextAlign.center,
            style: TextStyle(color: AppColors.textSecondary, fontSize: 18),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 60),
          
          const _VideoCard().animate().fadeIn(delay: 600.ms).scale(begin: const Offset(0.95, 0.95), curve: Curves.easeOutQuart),
        ],
      ),
    );
  }
}

class _VideoCard extends StatefulWidget {
  const _VideoCard();

  @override
  State<_VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<_VideoCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedScale(
        scale: isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            boxShadow: isHovered ? [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.15),
                blurRadius: 40,
                offset: const Offset(0, 20),
              )
            ] : [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Video Thumbnail
                AnimatedScale(
                  scale: isHovered ? 1.05 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuart,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1200&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                // Dark Overlay
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  color: Colors.black.withValues(alpha: isHovered ? 0.3 : 0.4),
                ),
                // Play Button
                Center(
                  child: AnimatedScale(
                    scale: isHovered ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: AppColors.primary,
                        size: 48,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
