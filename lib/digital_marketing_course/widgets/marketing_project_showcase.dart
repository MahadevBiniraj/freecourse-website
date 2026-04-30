import 'package:flutter/material.dart';
import '../digital_marketing_course_theme.dart';

class MarketingProjectShowcase extends StatelessWidget {
  const MarketingProjectShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Campaign Showcase",
            style: MarketingCourseFonts.heading(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "Build a portfolio of real-world marketing campaigns and dashboards.",
            style: MarketingCourseFonts.body(18, color: MarketingCourseColors.textSecondary),
          ),
          const SizedBox(height: 64),
          isMobile
              ? Column(
                  children: [
                    _buildProjectCard(
                      'SEO Audit & Strategy',
                      'Comprehensive website audit and 6-month growth plan.',
                      Icons.manage_search,
                    ),
                    const SizedBox(height: 24),
                    _buildProjectCard(
                      'Live Ad Campaign',
                      'End-to-end setup of a profitable Facebook Ads campaign.',
                      Icons.campaign,
                    ),
                    const SizedBox(height: 24),
                    _buildProjectCard(
                      'Analytics Dashboard',
                      'Custom Data Studio dashboard tracking key KPIs and ROI.',
                      Icons.dashboard,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildProjectCard(
                        'SEO Audit & Strategy',
                        'Comprehensive website audit and 6-month growth plan.',
                        Icons.manage_search,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildProjectCard(
                        'Live Ad Campaign',
                        'End-to-end setup of a profitable Facebook Ads campaign.',
                        Icons.campaign,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildProjectCard(
                        'Analytics Dashboard',
                        'Custom Data Studio dashboard tracking key KPIs and ROI.',
                        Icons.dashboard,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: MarketingCourseColors.glassBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: MarketingCourseColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: MarketingCourseColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: MarketingCourseColors.border),
            ),
            child: Icon(icon, color: MarketingCourseColors.primary, size: 40),
          ),
          const SizedBox(height: 32),
          Text(title, style: MarketingCourseFonts.heading(24, color: Colors.white)),
          const SizedBox(height: 16),
          Text(desc, style: MarketingCourseFonts.body(16, color: MarketingCourseColors.textSecondary)),
        ],
      ),
    );
  }
}
