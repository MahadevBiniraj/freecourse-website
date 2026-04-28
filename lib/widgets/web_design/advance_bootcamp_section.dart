import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AdvanceBootcampSection extends StatelessWidget {
  const AdvanceBootcampSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      color: const Color(0xFF8B0000), // Deep Red
      child: Stack(
        children: [
          // Background Polygon
          Positioned.fill(
            child: Opacity(
              opacity: 0.1,
              child: CustomPaint(
                painter: _PolygonPainter(),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
            child: Column(
              children: [
                const Text(
                  "Advance UX & UI Design Bootcamp",
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
                  "Learn to design engaging experiences, master design tools, and build a portfolio\nthat will get you hired as a product designer.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 18),
                ).animate().fadeIn(delay: 400.ms),
                const SizedBox(height: 80),
                
                // 3 Columns of Features
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildFeature(
                      Icons.book_outlined,
                      "Job Ready\nPortfolio",
                      "Build a diverse portfolio with real-world projects that showcase your problem-solving skills.",
                    ),
                    if (!isMobile) const SizedBox(width: 60),
                    if (isMobile) const SizedBox(height: 40),
                    _buildFeature(
                      Icons.people_outline,
                      "1 on 1\nMentoring",
                      "Get personalized feedback and career guidance from experienced industry professionals.",
                    ),
                    if (!isMobile) const SizedBox(width: 60),
                    if (isMobile) const SizedBox(height: 40),
                    _buildFeature(
                      Icons.work_outline,
                      "Career\nSupport",
                      "Interview preparation, resume building, and direct introductions to our hiring partners.",
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                
                // Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFD700), // Gold
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text("APPLY NOW", style: TextStyle(fontWeight: FontWeight.bold)),
                ).animate().fadeIn(delay: 800.ms),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String title, String desc) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 48),
          const SizedBox(height: 24),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.2, end: 0),
    );
  }
}

class _PolygonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
