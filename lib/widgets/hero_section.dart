import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
        children: [
          _buildBackground(screenWidth),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: isMobile ? 80 : 160,
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildContent(context, isMobile: true),
                      const SizedBox(height: 80),
                      _buildImage(isMobile: true),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(flex: 3, child: _buildContent(context)),
                      const SizedBox(width: 80),
                      Expanded(flex: 2, child: _buildImage()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(double width) {
    final py = scrollOffset * 0.2;

    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF8FAFC), Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: -100 - py,
            right: -100,
            child: _Blob(
              color: const Color(0xFF6366F1).withValues(alpha: 0.15),
              size: 500,
            ),
          ),
          Positioned(
            bottom: -200 + py,
            left: -100,
            child: _Blob(
              color: const Color(0xFF8B5CF6).withValues(alpha: 0.12),
              size: 600,
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.015,
              child: Image.network(
                'https://grainy-gradients.vercel.app/noise.svg',
                repeat: ImageRepeat.repeat,
                fit: BoxFit.none,
              ),
            ),
          ),
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
          "Limited seats • Open for students nationwide".toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF2D1B69),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
            fontSize: 12,
          ),
        ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.1, end: 0),
        const SizedBox(height: 16),
        Text(
          "₹10 Crore Scholarship Program — Learn Skills for Free",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                height: 1.1,
                fontSize: isMobile ? 44 : 68,
                color: const Color(0xFF0F172A),
                fontWeight: FontWeight.w900,
                letterSpacing: -1.5,
              ),
        ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.1, end: 0),
        const SizedBox(height: 32),
        Text(
          "Portfolio Builders is offering free access to premium tech courses for students across India. Apply now and start building your future.",
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade600,
            height: 1.6,
          ),
        ).animate().fadeIn(delay: 300.ms, duration: 800.ms),
        const SizedBox(height: 48),
        _buildActionButtons(isMobile),
      ],
    );
  }

  Widget _buildActionButtons(bool isMobile) {
    return _HoverButton(
      onPressed: () {},
      child: const Text("Apply Now"),
    ).animate().fadeIn(delay: 500.ms).scale(begin: const Offset(0.95, 0.95), curve: Curves.elasticOut);
  }

  Widget _buildImage({bool isMobile = false}) {
    return _TiltWrapper(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2D1B69).withValues(alpha: 0.1),
              blurRadius: 40,
              offset: const Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.network(
            'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&w=1000&q=80',
            fit: BoxFit.cover,
          ),
        ),
      )
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .moveY(begin: 0, end: -20, duration: 4.seconds, curve: Curves.easeInOut)
          .animate()
          .fadeIn(delay: 600.ms, duration: 1000.ms)
          .scale(begin: const Offset(0.9, 0.9), duration: 1000.ms, curve: Curves.easeOutQuart),
    );
  }
}

class _Blob extends StatelessWidget {
  final Color color;
  final double size;
  const _Blob({required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    ).animate(onPlay: (c) => c.repeat(reverse: true))
     .moveY(begin: 0, end: 30, duration: 5.seconds, curve: Curves.easeInOut)
     .scale(begin: const Offset(1, 1), end: const Offset(1.1, 1.1), duration: 7.seconds);
  }
}

class _TiltWrapper extends StatefulWidget {
  final Widget child;
  const _TiltWrapper({required this.child});

  @override
  State<_TiltWrapper> createState() => _TiltWrapperState();
}

class _TiltWrapperState extends State<_TiltWrapper> {
  double x = 0;
  double y = 0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (e) {
        final box = context.findRenderObject() as RenderBox;
        final w = box.size.width;
        final h = box.size.height;
        setState(() {
          x = (e.localPosition.dy - h / 2) / h;
          y = (e.localPosition.dx - w / 2) / w;
        });
      },
      onExit: (_) => setState(() { x = 0; y = 0; }),
      child: Transform(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateX(-x * 0.1)
          ..rotateY(y * 0.1),
        alignment: Alignment.center,
        child: widget.child,
      ),
    );
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
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(
              colors: [Color(0xFF2D1B69), Color(0xFF4338CA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: isHovered ? [
              BoxShadow(
                color: const Color(0xFF2D1B69).withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ] : [],
          ),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.white,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            ),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
