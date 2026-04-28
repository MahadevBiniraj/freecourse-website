import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class PremiumHeroBackground extends StatefulWidget {
  final double scrollOffset;
  final Widget? child;

  const PremiumHeroBackground({
    super.key,
    required this.scrollOffset,
    this.child,
  });

  @override
  State<PremiumHeroBackground> createState() => _PremiumHeroBackgroundState();
}

class _PremiumHeroBackgroundState extends State<PremiumHeroBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // 1. Base Gradient
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF000000), // Deep Black
                  Color(0xFF020B1A), // Deep Blue
                  Color(0xFF000000), // Fade back to black
                ],
                stops: [0.0, 0.5, 1.0],
              ),
            ),
          ),
        ),

        // 2. Faint Grid Pattern (with Parallax)
        Positioned.fill(
          top: -widget.scrollOffset * 0.2,
          bottom: widget.scrollOffset * 0.2,
          child: Opacity(
            opacity: 0.08,
            child: CustomPaint(painter: _GridPainter()),
          ),
        ),

        // 3. Layered Floating Gradients (Animated)
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final phase = _animationController.value * 2 * math.pi;
            return Stack(
              children: [
                // Deep Blue Glow (Center-ish)
                _PositionedGlow(
                  top: 50 + (math.sin(phase) * 60),
                  left: -150 + (math.cos(phase * 0.5) * 120),
                  size: 900,
                  color: AppColors.darkAccent.withValues(alpha: 0.35),
                ),
                // Another Blue Glow
                _PositionedGlow(
                  bottom: -300 + (math.sin(phase + 2) * 100),
                  right: -150 + (math.cos(phase * 0.7) * 150),
                  size: 1100,
                  color: const Color(0xFF0D1B3E).withValues(alpha: 0.25),
                ),
                // Soft Green Diffusion (Pulsing)
                _PositionedGlow(
                  top: 300 + (math.cos(phase * 0.3) * 150),
                  left: screenWidth(context) * 0.1,
                  size: 700 + (math.sin(phase) * 50),
                  color: AppColors.primary.withValues(
                    alpha: 0.04 + (math.sin(phase) * 0.01),
                  ),
                ),

                // Neon Green Rim Lights
                _RimLight(
                  alignment: Alignment.topLeft,
                  color: AppColors.primary.withValues(alpha: 0.15),
                ),
                _RimLight(
                  alignment: Alignment.bottomRight,
                  color: AppColors.primary.withValues(alpha: 0.1),
                ),
              ],
            );
          },
        ),

        // 4. Spotlight behind Headline
        Center(
          child:
              Container(
                    width: 1000,
                    height: 500,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        colors: [
                          AppColors.darkAccent.withValues(alpha: 0.25),
                          AppColors.darkAccent.withValues(alpha: 0.05),
                          Colors.transparent,
                        ],
                        stops: const [0.0, 0.4, 1.0],
                        radius: 0.7,
                      ),
                    ),
                  )
                  .animate(onPlay: (c) => c.repeat(reverse: true))
                  .scale(
                    begin: const Offset(1, 1),
                    end: const Offset(1.1, 1.1),
                    duration: 4.seconds,
                    curve: Curves.easeInOut,
                  ),
        ),

        // 5. Light Streaks (Animated)
        Positioned.fill(
          child: CustomPaint(
            painter: _StreakPainter(animationValue: _animationController.value),
          ),
        ),

        // 5b. Particle/Dust Effect
        Positioned.fill(
          child: CustomPaint(
            painter: _ParticlePainter(
              animationValue: _animationController.value,
            ),
          ),
        ),

        // 6. Noise Texture
        Positioned.fill(
          child: Opacity(
            opacity: 0.04,
            child: Image.network(
              'https://grainy-gradients.vercel.app/noise.svg',
              repeat: ImageRepeat.repeat,
              fit: BoxFit.none,
            ),
          ),
        ),

        // 7. Glassmorphism Vignette
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.4),
                  Colors.black.withValues(alpha: 0.8),
                ],
                stops: const [0.5, 0.8, 1.0],
                radius: 1.2,
              ),
            ),
          ),
        ),

        if (widget.child != null) widget.child!,
      ],
    );
  }

  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
}

class _PositionedGlow extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final double size;
  final Color color;

  const _PositionedGlow({
    this.top,
    this.bottom,
    this.left,
    this.right,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(colors: [color, Colors.transparent]),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.1)
      ..strokeWidth = 0.5;

    const spacing = 40.0;

    for (double i = 0; i < size.width; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += spacing) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw dots at intersections
    final dotPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.2)
      ..strokeWidth = 1.0;

    for (double i = 0; i < size.width; i += spacing) {
      for (double j = 0; j < size.height; j += spacing) {
        canvas.drawCircle(Offset(i, j), 0.8, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StreakPainter extends CustomPainter {
  final double animationValue;

  _StreakPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          AppColors.primary.withValues(alpha: 0.1),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();
    double offset = animationValue * 200;

    for (int i = 0; i < 5; i++) {
      double startX = -200 + (i * 300) + offset;
      path.moveTo(startX, -100);
      path.lineTo(startX + 800, size.height + 100);
    }

    canvas.drawPath(
      path,
      paint
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(covariant _StreakPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}

class _RimLight extends StatelessWidget {
  final Alignment alignment;
  final Color color;

  const _RimLight({required this.alignment, required this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 400,
        height: 400,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [color, Colors.transparent],
            center: alignment == Alignment.topLeft
                ? const Alignment(-1, -1)
                : const Alignment(1, 1),
            radius: 1.0,
          ),
        ),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  final double animationValue;
  final List<Offset> particles;

  _ParticlePainter({required this.animationValue})
    : particles = List.generate(
        30,
        (index) => Offset(
          math.Random(index).nextDouble(),
          math.Random(index + 100).nextDouble(),
        ),
      );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withValues(alpha: 0.1);

    for (var particle in particles) {
      double x =
          (particle.dx * size.width +
              (math.sin(animationValue * 2 * math.pi + particle.dx * 10) *
                  20)) %
          size.width;
      double y =
          (particle.dy * size.height - (animationValue * 50)) % size.height;

      canvas.drawCircle(Offset(x, y), 0.8, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) => true;
}
