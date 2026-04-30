import 'package:flutter/material.dart';
import '../digital_marketing_course_theme.dart';

class MarketingFooter extends StatelessWidget {
  const MarketingFooter({super.key});

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
        color: MarketingCourseColors.background,
        border: Border(top: BorderSide(color: MarketingCourseColors.border)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.insights, color: MarketingCourseColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    "GrowthOS",
                    style: MarketingCourseFonts.heading(18, color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  _footerLink("Twitter"),
                  const SizedBox(width: 24),
                  _footerLink("LinkedIn"),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: MarketingCourseColors.border),
          const SizedBox(height: 32),
          Text(
            "© 2024 PortfolioBuilders. All rights reserved.",
            style: MarketingCourseFonts.body(14, color: MarketingCourseColors.textSecondary),
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
        style: MarketingCourseFonts.body(14, color: MarketingCourseColors.textSecondary),
      ),
    );
  }
}
