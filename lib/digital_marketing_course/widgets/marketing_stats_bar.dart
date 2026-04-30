import 'package:flutter/material.dart';
import '../digital_marketing_course_theme.dart';

class MarketingStatsBar extends StatelessWidget {
  const MarketingStatsBar({super.key});

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
        color: MarketingCourseColors.surface,
        border: Border(
          top: BorderSide(color: MarketingCourseColors.border),
          bottom: BorderSide(color: MarketingCourseColors.border),
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildStat("15K+", "Active Marketers"),
                const SizedBox(height: 32),
                _buildStat("4.9", "Average Rating"),
                const SizedBox(height: 32),
                _buildStat("12+", "Live Campaigns"),
                const SizedBox(height: 32),
                _buildStat("100%", "ROI Focused"),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat("15K+", "Active Marketers"),
                _buildDivider(),
                _buildStat("4.9", "Average Rating"),
                _buildDivider(),
                _buildStat("12+", "Live Campaigns"),
                _buildDivider(),
                _buildStat("100%", "ROI Focused"),
              ],
            ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: MarketingCourseFonts.heading(48, color: MarketingCourseColors.primary),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: MarketingCourseFonts.body(16, color: MarketingCourseColors.textSecondary, weight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 60,
      color: MarketingCourseColors.border,
    );
  }
}
