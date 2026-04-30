import 'package:flutter/material.dart';
import '../digital_marketing_course_theme.dart';

class MarketingCurriculum extends StatefulWidget {
  const MarketingCurriculum({super.key});

  @override
  State<MarketingCurriculum> createState() => _MarketingCurriculumState();
}

class _MarketingCurriculumState extends State<MarketingCurriculum> {
  int? _expandedIndex;

  final modules = [
    {
      'title': 'Module 1: Foundations of Marketing',
      'lessons': [
        'Understanding the Customer Journey',
        'Buyer Personas & Market Research',
        'Brand Positioning & Messaging',
      ],
    },
    {
      'title': 'Module 2: SEO & Content Strategy',
      'lessons': [
        'Keyword Research & Intent Mapping',
        'On-Page & Technical SEO',
        'Content Creation & Link Building',
      ],
    },
    {
      'title': 'Module 3: Social Media Marketing',
      'lessons': [
        'Platform-Specific Strategies (IG, TikTok, LinkedIn)',
        'Content Calendars & Scheduling',
        'Community Management & Influencer Outreach',
      ],
    },
    {
      'title': 'Module 4: Paid Advertising (PPC)',
      'lessons': [
        'Google Ads: Search, Display & Video',
        'Meta Ads: Targeting & Creatives',
        'Retargeting & ROI Optimization',
      ],
    },
    {
      'title': 'Module 5: Email Marketing & Funnels',
      'lessons': [
        'Building High-Converting Landing Pages',
        'Lead Magnets & Opt-in Strategies',
        'Automated Email Sequences',
      ],
    },
    {
      'title': 'Module 6: Analytics & Reporting',
      'lessons': [
        'Setting up Google Analytics 4 (GA4)',
        'Tracking Pixels & Conversions',
        'Creating Data Studio Dashboards',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      color: MarketingCourseColors.surface,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: MarketingCourseColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "CURRICULUM",
                  style: MarketingCourseFonts.heading(12, color: MarketingCourseColors.primary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Step-by-Step Roadmap",
            style: MarketingCourseFonts.heading(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 64),
          ...List.generate(modules.length, (index) => _buildModule(index)),
        ],
      ),
    );
  }

  Widget _buildModule(int index) {
    final isExpanded = _expandedIndex == index;
    final module = modules[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: MarketingCourseColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isExpanded ? MarketingCourseColors.primary : MarketingCourseColors.border,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _expandedIndex = expanded ? index : null;
            });
          },
          iconColor: MarketingCourseColors.primary,
          collapsedIconColor: MarketingCourseColors.textSecondary,
          title: Text(
            module['title'] as String,
            style: MarketingCourseFonts.heading(18, color: isExpanded ? MarketingCourseColors.primary : Colors.white),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: MarketingCourseColors.border)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (module['lessons'] as List<String>).map((lesson) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.play_circle_outline, color: MarketingCourseColors.textSecondary, size: 20),
                        const SizedBox(width: 12),
                        Text(lesson, style: MarketingCourseFonts.body(16)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
