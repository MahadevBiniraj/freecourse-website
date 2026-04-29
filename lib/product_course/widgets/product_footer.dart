import 'package:flutter/material.dart';
import '../product_course_theme.dart';

class ProductFooter extends StatelessWidget {
  const ProductFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      color: ProductCourseColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 80,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: ProductCourseColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.analytics_rounded, color: Colors.black, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Text("PRODUCT MASTER", style: ProductCourseFonts.heading(20, weight: FontWeight.w800)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Training the next generation of strategic product leaders to build products that users love and businesses need.",
                      style: ProductCourseFonts.body(16, color: ProductCourseColors.textSecondary),
                    ),
                  ],
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 40),
                _FooterColumn("Course", ["Curriculum", "Case Studies", "Reviews", "FAQ"]),
                _FooterColumn("Resources", ["PRD Templates", "Roadmap Tools", "Metrics Guide", "PLG eBook"]),
                _FooterColumn("Company", ["About Us", "Contact", "Privacy", "Terms"]),
              ],
            ],
          ),
          const SizedBox(height: 80),
          Divider(color: Colors.white.withOpacity(0.05)),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "© 2024 PortfolioBuilders. All rights reserved.",
                style: ProductCourseFonts.body(14, color: ProductCourseColors.textSecondary),
              ),
              Row(
                children: [
                  _SocialIcon(Icons.dashboard_customize_outlined),
                  const SizedBox(width: 20),
                  _SocialIcon(Icons.insights_rounded),
                  const SizedBox(width: 20),
                  _SocialIcon(Icons.hub_outlined),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FooterColumn extends StatelessWidget {
  final String title;
  final List<String> links;

  const _FooterColumn(this.title, this.links);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: ProductCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 24),
          ...links.map((link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(link, style: ProductCourseFonts.body(14, color: ProductCourseColors.textSecondary)),
          )),
        ],
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  const _SocialIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Colors.white.withOpacity(0.5), size: 20);
  }
}
