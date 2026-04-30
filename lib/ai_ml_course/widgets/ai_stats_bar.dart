import 'package:flutter/material.dart';
import '../ai_ml_course_theme.dart';

class AIStatsBar extends StatelessWidget {
  const AIStatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 48,
      ),
      decoration: const BoxDecoration(
        color: AICourseColors.surface,
        border: Border(
          top: BorderSide(color: AICourseColors.border),
          bottom: BorderSide(color: AICourseColors.border),
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildStat("1.2M", "Data Points Processed"),
                const SizedBox(height: 32),
                _buildStat("98%", "Model Accuracy"),
                const SizedBox(height: 32),
                _buildStat("5+", "Real-world Datasets"),
                const SizedBox(height: 32),
                _buildStat("24/7", "Compute Access"),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat("1.2M", "Data Points Processed"),
                _buildDivider(),
                _buildStat("98%", "Model Accuracy"),
                _buildDivider(),
                _buildStat("5+", "Real-world Datasets"),
                _buildDivider(),
                _buildStat("24/7", "Compute Access"),
              ],
            ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AICourseFonts.display(48, color: AICourseColors.primary),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: AICourseFonts.code(14, color: AICourseColors.textSecondary, weight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 60,
      color: AICourseColors.border,
    );
  }
}
