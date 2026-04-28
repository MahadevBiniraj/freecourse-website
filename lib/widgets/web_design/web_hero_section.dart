import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class WebHeroSection extends StatelessWidget {
  const WebHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 1000;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 800),
      decoration: BoxDecoration(
        color: AppColors.background,
      ),
      child: Stack(
        children: [
          // Subtle Light Purple Glows
          Positioned(
            top: -100,
            right: -100,
            child: _buildBlurBlob(AppColors.primary.withValues(alpha: 0.1), 600),
          ),
          Positioned(
            bottom: -150,
            left: -100,
            child: _buildBlurBlob(AppColors.secondary.withValues(alpha: 0.08), 500),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 120,
            ),
            child: isMobile
                ? Column(
                    children: [
                      _buildTextContent(isMobile),
                      const SizedBox(height: 64),
                      _buildMockup(),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: _buildTextContent(isMobile),
                      ),
                      const SizedBox(width: 64),
                      Expanded(
                        flex: 6,
                        child: _buildMockup(),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurBlob(Color color, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: color,
            blurRadius: size / 2,
            spreadRadius: size / 4,
          )
        ],
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
          ),
          child: const Text(
            "NEW COURSE OUT NOW",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              fontSize: 12,
              letterSpacing: 1.2,
            ),
          ),
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 24),
        Text(
          "Master Modern\nWeb Design",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: isMobile ? 48 : 72,
            fontWeight: FontWeight.w900,
            color: AppColors.textPrimary,
            letterSpacing: -2,
            height: 1.1,
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 24),
        Text(
          "Build stunning, high-converting interfaces from scratch. Master UI/UX principles, modern design tools, and launch a successful career as a product designer.",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 48),
        Row(
          mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            _HeroButton(
              onPressed: () {},
              isPrimary: true,
              child: const Text("Apply Now"),
            ),
            const SizedBox(width: 16),
            _HeroButton(
              onPressed: () {},
              isPrimary: false,
              child: const Text("View Curriculum"),
            ),
          ],
        ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
      ],
    );
  }

  Widget _buildMockup() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        // Main browser mockup
        Container(
          height: 450,
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: Colors.white10),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.08),
                blurRadius: 40,
                offset: const Offset(0, 20),
              )
            ],
          ),
          child: Column(
            children: [
              // Browser bar
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                  border: const Border(bottom: BorderSide(color: Colors.white10)),
                ),
                child: Row(
                  children: [
                    _buildDot(Colors.redAccent),
                    const SizedBox(width: 8),
                    _buildDot(Colors.amberAccent),
                    const SizedBox(width: 8),
                    _buildDot(Colors.greenAccent),
                  ],
                ),
              ),
              // Image content
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1581291518633-83b4ebd1d83e?auto=format&fit=crop&w=1200&q=80',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ],
          ),
        ).animate().scale(delay: 600.ms, begin: const Offset(0.9, 0.9), duration: 800.ms, curve: Curves.easeOutQuart),
        
        // Floating UI Element 1
        Positioned(
          left: -40,
          bottom: 60,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: AppStyles.glassBox(opacity: 0.9).copyWith(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.palette_rounded, color: AppColors.primary),
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Design System", style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textPrimary)),
                    Text("Updated just now", style: TextStyle(color: AppColors.textSecondary, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ).animate().slideX(delay: 1000.ms, begin: 0.2, end: 0, curve: Curves.easeOutQuart)
           .animate(onPlay: (c) => c.repeat(reverse: true)).moveY(begin: 0, end: -10, duration: 2.seconds),
        ),

        // Floating UI Element 2
        Positioned(
          right: -30,
          top: 60,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: AppStyles.glassBox(opacity: 0.9).copyWith(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text("A+", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: AppColors.secondary)),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Typography", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: AppColors.textPrimary)),
                        Container(width: 40, height: 4, margin: const EdgeInsets.only(top: 4), decoration: BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.circular(2))),
                      ],
                    )
                  ],
                )
              ],
            ),
          ).animate().slideX(delay: 1200.ms, begin: -0.2, end: 0, curve: Curves.easeOutQuart)
           .animate(onPlay: (c) => c.repeat(reverse: true)).moveY(begin: 0, end: 15, duration: 3.seconds),
        )
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle));
  }
}

class _HeroButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isPrimary;
  const _HeroButton({required this.child, required this.onPressed, this.isPrimary = true});

  @override
  State<_HeroButton> createState() => _HeroButtonState();
}

class _HeroButtonState extends State<_HeroButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: widget.isPrimary ? AppColors.primaryGradient : null,
            color: widget.isPrimary ? null : AppColors.surface,
            border: widget.isPrimary ? null : Border.all(color: Colors.white10),
            boxShadow: isHovered && widget.isPrimary ? AppStyles.glowEffect : [],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: widget.isPrimary ? Colors.black : AppColors.textPrimary,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
