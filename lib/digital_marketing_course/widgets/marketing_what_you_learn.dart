import 'package:flutter/material.dart';
import '../digital_marketing_course_theme.dart';

class MarketingWhatYouLearn extends StatelessWidget {
  const MarketingWhatYouLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final skills = [
      {'icon': Icons.search, 'title': 'SEO Mastery', 'desc': 'Rank higher on Google with advanced technical and on-page SEO strategies.'},
      {'icon': Icons.ads_click, 'title': 'Google & Meta Ads', 'desc': 'Create high-converting paid campaigns to drive targeted traffic and sales.'},
      {'icon': Icons.share, 'title': 'Social Media Marketing', 'desc': 'Build engaged communities and viral content across all major platforms.'},
      {'icon': Icons.email, 'title': 'Email & Funnels', 'desc': 'Design automated email sequences and high-converting sales funnels.'},
      {'icon': Icons.analytics, 'title': 'Data Analytics', 'desc': 'Track, measure, and optimize campaigns using Google Analytics and tracking pixels.'},
      {'icon': Icons.auto_graph, 'title': 'Growth Strategy', 'desc': 'Develop scalable marketing plans for long-term brand growth and retention.'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What You'll Learn",
            style: MarketingCourseFonts.heading(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "A comprehensive curriculum designed to make you a full-stack digital marketer.",
            style: MarketingCourseFonts.body(18, color: MarketingCourseColors.textSecondary),
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2 : 1.2,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: MarketingCourseColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        skills[index]['icon'] as IconData,
                        color: MarketingCourseColors.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      skills[index]['title'] as String,
                      style: MarketingCourseFonts.heading(20, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Text(
                        skills[index]['desc'] as String,
                        style: MarketingCourseFonts.body(14, color: MarketingCourseColors.textSecondary),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
