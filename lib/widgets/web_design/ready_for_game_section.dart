import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ReadyForGameSection extends StatelessWidget {
  const ReadyForGameSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: Colors.black,
      child: Column(
        children: [
          const Text(
            "Ready for a Game?",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          Text(
            "We are always ready to solve your problems & creating",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 18),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 60),
          
          // Image with overlapping button
          SizedBox(
            width: screenWidth > 800 ? 800 : double.infinity,
            height: 400,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Main Image
                Container(
                  margin: const EdgeInsets.only(bottom: 25), // Space for button overlap
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      // Using a placeholder or existing asset for the thumbnail
                      image: const AssetImage('assets/courses/project_management.png'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.3), BlendMode.darken),
                    ),
                  ),
                ),
                
                // Play Icon Overlay
                const Center(
                  child: Icon(Icons.play_circle_outline, color: Colors.white70, size: 80),
                ),
                
                // Overlay Button
                Positioned(
                  bottom: 0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                      elevation: 10,
                    ),
                    child: const Text("VIEW PROJECTS", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 600.ms).scale(),
          ),
        ],
      ),
    );
  }
}
