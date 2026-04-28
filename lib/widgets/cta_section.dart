import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'scroll_appear.dart';

class CTASection extends StatelessWidget {
  final double scrollOffset;
  const CTASection({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    // Simplified parallax factor
    final parallaxY = (scrollOffset * 0.1) % 100;

    return Container(
      width: double.infinity,
      height: 500,
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 120,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Stack(
          children: [
            Positioned.fill(
              top: -parallaxY,
              child: Image.network(
                'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1400&q=80',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(color: Colors.black.withValues(alpha: 0.6)),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScrollAppear(
                      child: const Text(
                        "Transform your life.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ScrollAppear(
                      delay: 200.ms,
                      child: const Text(
                        "Start your journey today and join thousands of students.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white70),
                      ),
                    ),
                    const SizedBox(height: 48),
                    _PulseButton(
                      onPressed: () {},
                      child: const Text("Get Started"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PulseButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  const _PulseButton({required this.child, required this.onPressed});

  @override
  State<_PulseButton> createState() => _PulseButtonState();
}

class _PulseButtonState extends State<_PulseButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
