import 'package:flutter/material.dart';
import '../ai_ml_course_theme.dart';

class AIFooter extends StatelessWidget {
  const AIFooter({super.key});

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
        color: AICourseColors.background,
        border: Border(top: BorderSide(color: AICourseColors.border)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.memory, color: AICourseColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    "AI.Labs",
                    style: AICourseFonts.heading(18, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  _footerLink("GitHub"),
                  const SizedBox(width: 24),
                  _footerLink("Discord"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: AICourseColors.border),
          const SizedBox(height: 32),
          Text(
            "© 2024 PortfolioBuilders. All rights reserved. System Operational.",
            style: AICourseFonts.code(14, color: AICourseColors.textSecondary),
          ),
        ],
      ),
    );
  }

  Widget _footerLink(String text) {
    return InkWell(
      onTap: () {},
      child: Text(
        text,
        style: AICourseFonts.code(14, color: AICourseColors.textSecondary),
      ),
    );
  }
}
