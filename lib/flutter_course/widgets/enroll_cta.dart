import 'package:flutter/material.dart';
import '../theme.dart';

class EnrollCTA extends StatelessWidget {
  const EnrollCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: FlutterCourseColors.background,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background Glow
          Container(
            width: 800,
            height: 400,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  FlutterCourseColors.primary.withValues(alpha: 0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
            child: Column(
              children: [
                Text(
                  "Ready to Build Your First Flutter App?",
                  textAlign: TextAlign.center,
                  style: FlutterCourseFonts.body(MediaQuery.of(context).size.width < 900 ? 32 : 48, weight: FontWeight.w900, color: Colors.white),
                ),
                const SizedBox(height: 24),
                Text(
                  "Join thousands of students and start your journey today. It's completely free!",
                  textAlign: TextAlign.center,
                  style: FlutterCourseFonts.body(20, color: Colors.white60),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FlutterCourseColors.primary,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 20,
                    shadowColor: FlutterCourseColors.primary.withValues(alpha: 0.5),
                  ),
                  child: Text("Start Learning — It's Free", style: FlutterCourseFonts.body(18, weight: FontWeight.w800, color: Colors.black)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
