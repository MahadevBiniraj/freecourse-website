import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class PremiumHeroSection extends StatefulWidget {
  const PremiumHeroSection({super.key});

  @override
  State<PremiumHeroSection> createState() => _PremiumHeroSectionState();
}

class _PremiumHeroSectionState extends State<PremiumHeroSection> with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 120),
    )..repeat();
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 800;
    // Set a minimum height to ensure it looks like a hero section even on short screens
    final heroHeight = math.max(screenHeight, 900.0);

    return Container(
      width: double.infinity,
      height: heroHeight,
      decoration: const BoxDecoration(
        // 1. BACKGROUND: Dark premium gradient (deep blue → purple → black)
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF020024), // Deep Blue
            Color(0xFF130B2E), // Purple-ish
            Color(0xFF000000), // Black
          ],
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Radial Glow behind headline
          Positioned(
            top: heroHeight * 0.2,
            child: Container(
              width: screenWidth * 0.8,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF6366F1).withValues(alpha: 0.15), // Indigo glow
                    Colors.transparent,
                  ],
                  stops: const [0.0, 1.0],
                ),
              ),
            ),
          ).animate().fadeIn(duration: 2000.ms),

          // Particles Layer
          const Positioned.fill(
            child: _ParticlesOverlay(),
          ),

          // Earth Visual
          Positioned(
            bottom: -300,
            left: -screenWidth * 0.25,
            right: -screenWidth * 0.25,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Earth Horizon Glow
                Container(
                  width: screenWidth * 0.8,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                        blurRadius: 150,
                        spreadRadius: 20,
                      )
                    ],
                  ),
                ),
                // Rotating Earth
                AnimatedBuilder(
                  animation: _rotationController,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _rotationController.value * 2 * math.pi,
                      child: Opacity(
                        opacity: 0.9,
                        child: Image.asset(
                          'assets/globe.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ).animate().fadeIn(duration: 2000.ms).slideY(begin: 0.1, end: 0, duration: 1500.ms, curve: Curves.easeOutCubic),

          // Avatar Orbit
          Positioned(
            bottom: 300, // Just above the Earth
            left: 0,
            right: 0,
            child: SizedBox(
              height: 150,
              child: _AvatarOrbit(),
            ),
          ),

          // Foreground Content
          Positioned(
            top: heroHeight * 0.2,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Tagline
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
                    ),
                    child: const Text(
                      "PortfolioBuilders – Free UI/UX Program",
                      style: TextStyle(
                        color: Color(0xFFE2E8F0),
                        fontSize: 14,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
                  
                  const SizedBox(height: 32),
                  
                  // Headline
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      colors: [Colors.white, Color(0xFFE2E8F0), Color(0xFFA5B4FC)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ).createShader(bounds),
                    child: Text(
                      "Learn UI/UX.\nBuild Your Portfolio.\nGet Hired.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isMobile ? 48 : 80,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        height: 1.1,
                        letterSpacing: -2,
                      ),
                    ),
                  ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
                  
                  const SizedBox(height: 24),
                  
                  // Description
                  SizedBox(
                    width: 600,
                    child: Text(
                      "Join PortfolioBuilders and learn UI/UX design for free. Work on real projects, build a strong portfolio, and get mentored by industry experts.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.7),
                        fontSize: 18,
                        height: 1.6,
                      ),
                    ),
                  ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
                  
                  const SizedBox(height: 48),
                  
                  // CTA Button
                  const _PremiumCTAButton().animate().fadeIn(delay: 900.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
                  
                  const SizedBox(height: 32),
                  
                  // Trust Line
                  Text(
                    "5,000+ Students  |  Global Community  |  Portfolio + Mentorship",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.4),
                      fontSize: 14,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ).animate().fadeIn(delay: 1100.ms).slideY(begin: 0.2, end: 0, curve: Curves.easeOut),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder classes to be fully implemented next

class _ParticlesOverlay extends StatelessWidget {
  const _ParticlesOverlay();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _StarfieldPainter(),
    ).animate(onPlay: (controller) => controller.repeat()).shimmer(
      duration: 5000.ms,
      color: Colors.white.withValues(alpha: 0.1),
    );
  }
}

class _StarfieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(42); // Fixed seed for consistent star positions
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 150; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 1.5;
      final opacity = random.nextDouble() * 0.5 + 0.1;

      paint.color = Colors.white.withValues(alpha: opacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AvatarOrbit extends StatelessWidget {
  final List<String> avatars = [
    'assets/malavika.png',
    'assets/athul.png',
    'assets/fahad.png',
    'assets/tinu.png',
    'assets/parvathymrimage.png',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    return Stack(
      alignment: Alignment.center,
      children: List.generate(avatars.length, (index) {
        // Calculate arc positions
        final total = avatars.length;
        // Distribute from -0.8 to 0.8
        final normalizedPosition = (index / (total - 1)) * 2 - 1; 
        
        final xOffset = normalizedPosition * (screenWidth * 0.25).clamp(150.0, 300.0);
        // Parabolic curve for y offset
        final yOffset = math.pow(normalizedPosition, 2).toDouble() * 80;

        return Positioned(
          left: (screenWidth / 2) + xOffset - 35, // -35 for half width of avatar
          bottom: 40 - yOffset, // Inverted curve
          child: _AnimatedAvatar(
            imagePath: avatars[index],
            delayMs: index * 200,
          ),
        );
      }),
    );
  }
}

class _AnimatedAvatar extends StatefulWidget {
  final String imagePath;
  final int delayMs;

  const _AnimatedAvatar({required this.imagePath, required this.delayMs});

  @override
  State<_AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<_AnimatedAvatar> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.diagonal3Values(_isHovered ? 1.2 : 1.0, _isHovered ? 1.2 : 1.0, 1.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: const Color(0xFFA5B4FC).withValues(alpha: 0.6),
                blurRadius: 20,
                spreadRadius: 2,
              )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered ? Colors.white : Colors.white.withValues(alpha: 0.2), 
              width: _isHovered ? 3 : 2,
            ),
          ),
          child: CircleAvatar(
            radius: 35,
            backgroundImage: AssetImage(widget.imagePath),
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat(reverse: true)).slideY(
        begin: 0.1,
        end: -0.1,
        duration: 2000.ms,
        delay: widget.delayMs.ms,
        curve: Curves.easeInOutSine,
      ),
    );
  }
}

class _PremiumCTAButton extends StatefulWidget {
  const _PremiumCTAButton();

  @override
  State<_PremiumCTAButton> createState() => _PremiumCTAButtonState();
}

class _PremiumCTAButtonState extends State<_PremiumCTAButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        transform: Matrix4.diagonal3Values(_isHovered ? 1.05 : 1.0, _isHovered ? 1.05 : 1.0, 1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFEC4899).withValues(alpha: _isHovered ? 0.6 : 0.3), // Pink glow
              blurRadius: _isHovered ? 30 : 20,
              spreadRadius: _isHovered ? 5 : 2,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFFEC4899)], // Indigo to Pink
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(100),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                child: Text(
                  "Start Free Course",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat(reverse: true)).shimmer(
        duration: 2000.ms,
        color: Colors.white.withValues(alpha: 0.2),
        blendMode: BlendMode.srcOver,
      ),
    );
  }
}
