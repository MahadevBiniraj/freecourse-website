import 'dart:ui';
import 'package:flutter/material.dart';
import '../ai_ml_course_theme.dart';

class AINavbar extends StatelessWidget {
  final Function(String) onNavigate;

  const AINavbar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : screenWidth * 0.1,
        vertical: 24,
      ),
      height: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: AICourseColors.glassBackground,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AICourseColors.glassBorder),
            ),
            child: Row(
              children: [
                // Logo
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AICourseColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AICourseColors.primary.withOpacity(0.3)),
                      ),
                      child: const Icon(Icons.memory, color: AICourseColors.primary, size: 24),
                    ),
                    const SizedBox(width: 12),
                    if (!isMobile)
                      Text(
                        "AI.Labs",
                        style: AICourseFonts.heading(20, weight: FontWeight.w800),
                      ),
                  ],
                ),
                const Spacer(),
                
                // Nav Items
                if (!isMobile)
                  Row(
                    children: [
                      _navItem("Curriculum"),
                      const SizedBox(width: 32),
                      _navItem("Models"),
                      const SizedBox(width: 32),
                      _navItem("FAQ"),
                    ],
                  ),
                
                const Spacer(),

                // CTA
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: AICourseColors.border),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    elevation: 0,
                  ),
                  child: Text("DISCONNECT", style: AICourseFonts.code(14, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem(String label) {
    return InkWell(
      onTap: () => onNavigate(label),
      child: Text(
        label,
        style: AICourseFonts.code(14, color: Colors.white.withOpacity(0.7), weight: FontWeight.w600),
      ),
    );
  }
}
