import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'premium_hero_background.dart';
import '../theme.dart';

class HeroSection extends StatelessWidget {
  final double scrollOffset;
  const HeroSection({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: PremiumHeroBackground(scrollOffset: scrollOffset),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.08,
              vertical: isMobile ? 80 : 160,
            ),
            child: Column(
              children: [
                // Top Badge
                _buildBadge()
                    .animate()
                    .fadeIn(duration: 600.ms)
                    .slideY(begin: 0.2, end: 0),
                const SizedBox(height: 32),

                // Headline
                _buildHeadline(context, isMobile)
                    .animate()
                    .fadeIn(delay: 200.ms, duration: 800.ms)
                    .slideY(begin: 0.1, end: 0),

                const SizedBox(height: 32),

                // Subheadline
                _buildSubheadline(
                  isMobile,
                ).animate().fadeIn(delay: 400.ms, duration: 800.ms),

                const SizedBox(height: 56),

                // CTAs
                _buildCTAs(isMobile)
                    .animate()
                    .fadeIn(delay: 600.ms, duration: 800.ms)
                    .scale(
                      begin: const Offset(0.95, 0.95),
                      curve: Curves.easeOutBack,
                    ),

                const SizedBox(height: 100),

                // Main Visual Stack
                _buildVisualStack(screenWidth, isMobile),
              ],
            ),
          ),

          // Floating Elements (Parallax)
          if (!isMobile) ...[
            _buildFloatingCard(
              top: 200 - (scrollOffset * 0.1),
              left: screenWidth * 0.05,
              child: const _StatusCard(
                icon: Icons.check_circle_rounded,
                title: "Application Approved",
                subtitle: "Scholarship applied",
                color: Colors.greenAccent,
              ),
            ),
            _buildFloatingCard(
              top: 400 - (scrollOffset * 0.2),
              right: screenWidth * 0.05,
              child: const _StatusCard(
                icon: Icons.auto_awesome,
                title: "10,000+ Students",
                subtitle: "Already learning",
                color: Colors.blueAccent,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.stars_rounded, color: AppColors.primary, size: 16),
          const SizedBox(width: 8),
          const Text(
            "INDIA'S LARGEST TECH SCHOLARSHIP",
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              fontSize: 11,
              letterSpacing: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeadline(BuildContext context, bool isMobile) {
    return Column(
      children: [
        Text(
          "₹10 Crore",
          style: TextStyle(
            fontSize: isMobile ? 72 : 140,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            height: 0.9,
            letterSpacing: -4,
          ),
        ),
        Text(
          "Scholarship Program",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMobile ? 36 : 72,
            fontWeight: FontWeight.w900,
            color: Colors.white.withValues(alpha: 0.7),
            height: 1.1,
            letterSpacing: -1.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSubheadline(bool isMobile) {
    return SizedBox(
      width: 700,
      child: Text(
        "Break into tech without paying a rupee. Learn real-world skills, build projects, and get job-ready with top mentors.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isMobile ? 18 : 22,
          color: Colors.white.withValues(alpha: 0.6),
          height: 1.6,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildCTAs(bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _HoverButton(
          onPressed: () {},
          isPrimary: true,
          child: const Text("Apply for Scholarship"),
        ),
        const SizedBox(width: 24),
        _HoverButton(
          onPressed: () {},
          isPrimary: false,
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Start Learning Free"),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward_rounded, size: 18),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVisualStack(double width, bool isMobile) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Main Dashboard Mockup
        Container(
          width: isMobile ? width * 0.9 : 1000,
          height: isMobile ? 300 : 550,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.05),
                blurRadius: 100,
                offset: const Offset(0, 50),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&w=1600&q=80',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF000000).withValues(alpha: 0.9),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),
                // Coding UI overlay
                Positioned(
                  left: 32,
                  top: 32,
                  child: _GlassPanel(
                    width: isMobile ? 150 : 250,
                    height: isMobile ? 100 : 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.amberAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                color: Colors.greenAccent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _MockLine(width: 180),
                        _MockLine(width: 120),
                        _MockLine(width: 150),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animate().scale(
          begin: const Offset(0.9, 0.9),
          duration: 1200.ms,
          curve: Curves.easeOutQuart,
        ),

        // Floating Overlays
        if (!isMobile) ...[
          Positioned(
            right: -40,
            bottom: 100,
            child: _GlassPanel(
              width: 280,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your Progress",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "UI Design",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      Text(
                        "85%",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: 0.85,
                    backgroundColor: Colors.white10,
                    valueColor: const AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ],
              ),
            ),
          ).animate().slideX(begin: 0.2, end: 0, delay: 800.ms),
        ],
      ],
    );
  }

  Widget _buildFloatingCard({
    required double top,
    double? left,
    double? right,
    required Widget child,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: child
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .moveY(
            begin: 0,
            end: 20,
            duration: 3.seconds,
            curve: Curves.easeInOut,
          ),
    );
  }

  // Old background method removed as it's replaced by PremiumHeroBackground
}

class _GlassPanel extends StatelessWidget {
  final double width;
  final double? height;
  final Widget child;
  final EdgeInsets padding;
  const _GlassPanel({
    required this.width,
    this.height,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.4), blurRadius: 20),
        ],
      ),
      child: child,
    );
  }
}

class _MockLine extends StatelessWidget {
  final double width;
  const _MockLine({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 6,
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  const _StatusCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white54, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  final bool isPrimary;
  const _HoverButton({
    required this.child,
    required this.onPressed,
    this.isPrimary = true,
  });

  @override
  State<_HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<_HoverButton> {
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
            gradient: widget.isPrimary
                ? const LinearGradient(
                    colors: [Color(0xFF00FF85), Color(0xFF00FFCC)],
                  )
                : null,
            color: widget.isPrimary ? null : Colors.transparent,
            border: widget.isPrimary ? null : Border.all(color: Colors.white24),
            boxShadow: isHovered && widget.isPrimary
                ? [
                    BoxShadow(
                      color: const Color(0xFF00FF85).withValues(alpha: 0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ]
                : [],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: widget.isPrimary ? Colors.black : Colors.white,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              textStyle: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 16,
                letterSpacing: -0.2,
              ),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
