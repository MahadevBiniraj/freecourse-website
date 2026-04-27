import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: isMobile ? 60 : 120,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildContent(context, isMobile: true),
                const SizedBox(height: 64),
                _buildImage(isMobile: true),
              ],
            )
          : Row(
              children: [
                Expanded(flex: 3, child: _buildContent(context)),
                const SizedBox(width: 64),
                Expanded(flex: 2, child: _buildImage()),
              ],
            ),
    );
  }

  Widget _buildContent(BuildContext context, {bool isMobile = false}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "Up-skill and accelerate your\nCareer in tech",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                height: 1.1,
                fontSize: isMobile ? 40 : 64,
                color: Colors.black,
              ),
        ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 24),
        Text(
          "Join 10,000+ students learning the most in-demand skills from industry experts.",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black54,
              ),
        ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 40),
        _buildActionButtons(isMobile),
      ],
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return Row(
      mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        _HoverButton(
          onPressed: () {},
          child: const Text("Get started"),
        ),
      ],
    ).animate().fadeIn(delay: 400.ms).scale(begin: const Offset(0.9, 0.9));
  }

  Widget _buildImage({bool isMobile = false}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: AppStyles.premiumShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Image.network(
          'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=1000&q=80',
          fit: BoxFit.cover,
        ),
      ),
    ).animate(onPlay: (c) => c.repeat(reverse: true))
     .moveY(begin: 0, end: -15, duration: 3.seconds, curve: Curves.easeInOut)
     .animate()
     .fadeIn(delay: 800.ms, duration: 1000.ms)
     .scale(begin: const Offset(0.8, 0.8));
  }
}

class _HoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback onPressed;
  const _HoverButton({required this.child, required this.onPressed});

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
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: widget.child,
        ),
      ),
    );
  }
}
