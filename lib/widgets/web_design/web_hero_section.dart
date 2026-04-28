import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WebHeroSection extends StatelessWidget {
  const WebHeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      height: 900,
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Stack(
        children: [
          // Globe Background
          Positioned(
            bottom: -200,
            left: -screenWidth * 0.25,
            right: -screenWidth * 0.25,
            child: Opacity(
              opacity: 0.8,
              child: Image.asset(
                'assets/globe.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ).animate().fadeIn(duration: 2000.ms).scale(begin: const Offset(1.1, 1.1), end: const Offset(1, 1), duration: 2000.ms),
          
          // Content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "All-inclusive online bootcamp",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2, end: 0),
                const SizedBox(height: 16),
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Colors.white, Color(0xFFFFDAB9), Colors.white],
                  ).createShader(bounds),
                  child: Text(
                    "Web Design|",
                    style: TextStyle(
                      fontSize: isMobile ? 64 : 120,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: -4,
                      height: 1,
                    ),
                  ),
                ).animate().fadeIn(delay: 700.ms).scale(begin: const Offset(0.9, 0.9)),
                const SizedBox(height: 24),
                SizedBox(
                  width: 600,
                  child: Text(
                    "Master the art of creating stunning interfaces. Learn from industry experts and build a portfolio that gets you hired.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.6),
                      fontSize: 18,
                      height: 1.6,
                    ),
                  ),
                ).animate().fadeIn(delay: 900.ms),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                  ),
                  child: const Text("GET STARTED", style: TextStyle(fontWeight: FontWeight.bold)),
                ).animate().fadeIn(delay: 1100.ms),
              ],
            ),
          ),
          
          // Portraits on globe
          Positioned(
            bottom: 220,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAvatar('assets/malavika.png', -10),
                _buildAvatar('assets/athul.png', -20),
                _buildAvatar('assets/fahad.png', -30),
                _buildAvatar('assets/tinu.png', -20),
                _buildAvatar('assets/parvathymrimage.png', -10),
              ],
            ).animate().fadeIn(delay: 1500.ms).slideY(begin: 0.5, end: 0),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(String image, double yOffset) {
    return Transform.translate(
      offset: Offset(0, yOffset),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 3),
        ),
        child: CircleAvatar(
          radius: 35,
          backgroundImage: AssetImage(image),
        ),
      ),
    );
  }
}
