import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../web_course_theme.dart';

class WebHeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const WebHeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 900),
      decoration: const BoxDecoration(
        color: WebCourseColors.background,
      ),
      child: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -100,
            left: -100,
            child: _Glow(color: WebCourseColors.primary.withValues(alpha: 0.1)),
          ),
          Positioned(
            bottom: 100,
            right: -100,
            child: _Glow(color: WebCourseColors.secondary.withValues(alpha: 0.1)),
          ),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 140),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: WebCourseStyles.glassBox(
                          opacity: 0.1,
                          borderColor: WebCourseColors.primary.withValues(alpha: 0.3),
                        ),
                        child: Text(
                          "🚀 Zero to Full Stack Hero",
                          style: WebCourseFonts.code(14, color: WebCourseColors.accent),
                        ),
                      ).animate().fadeIn().slideY(begin: 0.2),
                      
                      const SizedBox(height: 32),
                      
                      RichText(
                        text: TextSpan(
                          style: WebCourseFonts.heading(isMobile ? 48 : 72, weight: FontWeight.w900),
                          children: [
                            const TextSpan(text: "Master the Art of \n"),
                            TextSpan(
                              text: "Full Stack Development",
                              style: TextStyle(
                                foreground: Paint()
                                  ..shader = WebCourseColors.neonGradient.createShader(const Rect.fromLTWH(0, 0, 600, 100)),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                      
                      const SizedBox(height: 24),
                      
                      Text(
                        "Build high-performance web applications using the MERN stack. From frontend design to backend architecture, learn everything for free.",
                        style: WebCourseFonts.body(20, color: WebCourseColors.textSecondary, height: 1.6),
                      ).animate().fadeIn(delay: 400.ms),
                      
                      const SizedBox(height: 48),
                      
                      Row(
                        children: [
                          _PrimaryButton(label: "Start Learning Now", onTap: () {}),
                          const SizedBox(width: 20),
                          _SecondaryButton(label: "View Curriculum", onTap: onViewCurriculum),
                        ],
                      ).animate().fadeIn(delay: 600.ms),
                      
                      const SizedBox(height: 80),
                      
                      _SocialProof(),
                    ],
                  ),
                ),
                
                if (!isMobile)
                  Expanded(
                    flex: 5,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Floating Illustration
                          Image.asset(
                            'assets/web_dev_hero.png',
                            width: 600,
                            fit: BoxFit.contain,
                          )
                          .animate(onPlay: (c) => c.repeat(reverse: true))
                          .moveY(begin: 0, end: -30, duration: 3.seconds, curve: Curves.easeInOut),
                          
                          // Floating Tech Bubbles
                          _TechBubble(icon: Icons.javascript, top: 50, left: 50),
                          _TechBubble(icon: Icons.html, bottom: 50, right: 50),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;
  const _Glow({required this.color});
  @override
  Widget build(BuildContext context) => Container(width: 600, height: 600, decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [color, Colors.transparent])));
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryButton({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), gradient: WebCourseColors.neonGradient, boxShadow: [BoxShadow(color: WebCourseColors.primary.withValues(alpha: 0.3), blurRadius: 20)]),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Text(label, style: WebCourseFonts.body(16, weight: FontWeight.w800, color: Colors.black)),
    ),
  );
}

class _SecondaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SecondaryButton({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => OutlinedButton(
    onPressed: onTap,
    style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white.withValues(alpha: 0.1)), padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
    child: Text(label, style: WebCourseFonts.body(16, weight: FontWeight.w800, color: Colors.white)),
  );
}

class _TechBubble extends StatelessWidget {
  final IconData icon;
  final double? top, bottom, left, right;
  const _TechBubble({required this.icon, this.top, this.bottom, this.left, this.right});
  @override
  Widget build(BuildContext context) => Positioned(
    top: top, bottom: bottom, left: left, right: right,
    child: Container(
      padding: const EdgeInsets.all(20),
      decoration: WebCourseStyles.glassBox(opacity: 0.1),
      child: Icon(icon, color: WebCourseColors.primary, size: 32),
    ).animate(onPlay: (c) => c.repeat(reverse: true)).moveY(begin: 0, end: 15, duration: 2.seconds),
  );
}

class _SocialProof extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Wrap(
        children: List.generate(3, (i) => Align(widthFactor: 0.7, child: CircleAvatar(radius: 16, backgroundColor: WebCourseColors.surface, child: Text("${i+1}", style: const TextStyle(fontSize: 10))))),
      ),
      const SizedBox(width: 16),
      Text("Joined by 8,500+ web developers", style: WebCourseFonts.body(14, color: WebCourseColors.textSecondary)),
    ],
  );
}
