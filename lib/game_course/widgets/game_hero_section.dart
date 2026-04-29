import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../game_course_theme.dart';

class GameHeroSection extends StatelessWidget {
  final VoidCallback onViewCurriculum;

  const GameHeroSection({super.key, required this.onViewCurriculum});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 900),
      decoration: const BoxDecoration(
        color: GameCourseColors.background,
      ),
      child: Stack(
        children: [
          // Background Glows
          Positioned(
            top: -100,
            right: -100,
            child: _Glow(color: GameCourseColors.primary.withValues(alpha: 0.1)),
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
                        decoration: GameCourseStyles.glassBox(
                          opacity: 0.1,
                          borderColor: GameCourseColors.primary.withValues(alpha: 0.3),
                        ),
                        child: Text(
                          "🎮 Level Up Your Career",
                          style: GameCourseFonts.mono(14, color: GameCourseColors.primary),
                        ),
                      ).animate().fadeIn().slideY(begin: 0.2),
                      
                      const SizedBox(height: 32),
                      
                      RichText(
                        text: TextSpan(
                          style: GameCourseFonts.heading(isMobile ? 48 : 72, weight: FontWeight.w900),
                          children: [
                            const TextSpan(text: "Build Your Own \n"),
                            TextSpan(
                              text: "Dream Games",
                              style: TextStyle(
                                foreground: Paint()
                                  ..shader = GameCourseColors.neonGradient.createShader(const Rect.fromLTWH(0, 0, 600, 100)),
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                      
                      const SizedBox(height: 24),
                      
                      Text(
                        "Master Unity, C#, and industry-standard game design principles. Create immersive 2D and 3D experiences from scratch.",
                        style: GameCourseFonts.body(20, color: GameCourseColors.textSecondary, height: 1.6),
                      ).animate().fadeIn(delay: 400.ms),
                      
                      const SizedBox(height: 48),
                      
                      Row(
                        children: [
                          _PrimaryButton(label: "Start Building Free", onTap: () {}),
                          const SizedBox(width: 20),
                          _SecondaryButton(label: "Explore Curriculum", onTap: onViewCurriculum),
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
                      child: Image.asset(
                        'assets/game_dev_hero.png',
                        width: 650,
                        fit: BoxFit.contain,
                      )
                      .animate(onPlay: (c) => c.repeat(reverse: true))
                      .moveY(begin: 0, end: -30, duration: 3.seconds, curve: Curves.easeInOut),
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
  Widget build(BuildContext context) => Container(width: 800, height: 800, decoration: BoxDecoration(shape: BoxShape.circle, gradient: RadialGradient(colors: [color, Colors.transparent])));
}

class _PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryButton({required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), gradient: GameCourseColors.neonGradient, boxShadow: [BoxShadow(color: GameCourseColors.primary.withValues(alpha: 0.3), blurRadius: 20)]),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      child: Text(label, style: GameCourseFonts.body(16, weight: FontWeight.w800, color: Colors.black)),
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
    child: Text(label, style: GameCourseFonts.body(16, weight: FontWeight.w800, color: Colors.white)),
  );
}

class _SocialProof extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Wrap(
        children: List.generate(3, (i) => Align(widthFactor: 0.7, child: CircleAvatar(radius: 16, backgroundColor: GameCourseColors.surface, child: Text("${i+1}", style: const TextStyle(fontSize: 10))))),
      ),
      const SizedBox(width: 16),
      Text("Join 5,200+ indie developers", style: GameCourseFonts.body(14, color: GameCourseColors.textSecondary)),
    ],
  );
}
