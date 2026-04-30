import 'package:flutter/material.dart';
import '../blockchain_course_theme.dart';

class BlockchainStatsBar extends StatelessWidget {
  const BlockchainStatsBar({super.key});

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
        color: BlockchainCourseColors.surface,
        border: Border(
          top: BorderSide(color: BlockchainCourseColors.border),
          bottom: BorderSide(color: BlockchainCourseColors.border),
        ),
      ),
      child: isMobile
          ? Column(
              children: [
                _buildStat("50K+", "Nodes Deployed"),
                const SizedBox(height: 32),
                _buildStat("100%", "Immutable"),
                const SizedBox(height: 32),
                _buildStat("15+", "Smart Contracts"),
                const SizedBox(height: 32),
                _buildStat("24/7", "Network Uptime"),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStat("50K+", "Nodes Deployed"),
                _buildDivider(),
                _buildStat("100%", "Immutable"),
                _buildDivider(),
                _buildStat("15+", "Smart Contracts"),
                _buildDivider(),
                _buildStat("24/7", "Network Uptime"),
              ],
            ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: BlockchainCourseFonts.display(48, color: BlockchainCourseColors.primary),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: BlockchainCourseFonts.code(14, color: BlockchainCourseColors.textSecondary, weight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1,
      height: 60,
      color: BlockchainCourseColors.border,
    );
  }
}
