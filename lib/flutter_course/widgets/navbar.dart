import 'package:flutter/material.dart';
import '../theme.dart';

class Navbar extends StatelessWidget {
  final Function(String) onNavigate;

  const Navbar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : screenWidth * 0.1),
      decoration: BoxDecoration(
        color: FlutterCourseColors.background.withValues(alpha: 0.95),
        border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo
          Row(
            children: [
              _FlutterLogo(),
              const SizedBox(width: 12),
              Text(
                "Flutter Free Course",
                style: FlutterCourseFonts.body(18, weight: FontWeight.w800, color: Colors.white),
              ),
            ],
          ),

          if (!isMobile)
            Row(
              children: [
                _NavLink("Curriculum", () => onNavigate("Curriculum")),
                _NavLink("Instructor", () => onNavigate("Instructor")),
                _NavLink("Reviews", () => onNavigate("Reviews")),
                _NavLink("FAQ", () => onNavigate("FAQ")),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FlutterCourseColors.primary,
                    foregroundColor: Colors.black,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    "Enroll Free →",
                    style: FlutterCourseFonts.body(14, weight: FontWeight.w700, color: Colors.black),
                  ),
                ),
              ],
            )
          else
            const Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavLink(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: FlutterCourseFonts.body(15, weight: FontWeight.w600, color: Colors.white70),
        ),
      ),
    );
  }
}

class _FlutterLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: CustomPaint(
        painter: _FlutterLogoPainter(),
      ),
    );
  }
}

class _FlutterLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final tealPaint = Paint()..color = FlutterCourseColors.primary;
    final bluePaint = Paint()..color = FlutterCourseColors.secondary;

    final path1 = Path()
      ..moveTo(size.width * 0.6, 0)
      ..lineTo(size.width, size.height * 0.4)
      ..lineTo(size.width * 0.6, size.height * 0.8)
      ..close();
    
    final path2 = Path()
      ..moveTo(size.width * 0.4, size.height * 0.2)
      ..lineTo(size.width * 0.8, size.height * 0.6)
      ..lineTo(size.width * 0.4, size.height)
      ..close();

    canvas.drawPath(path1, tealPaint);
    canvas.drawPath(path2, bluePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
