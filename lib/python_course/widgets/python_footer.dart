import 'package:flutter/material.dart';
import '../python_course_theme.dart';

class PythonFooter extends StatelessWidget {
  const PythonFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      color: PythonCourseColors.background,
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
                        const Icon(Icons.terminal, color: PythonCourseColors.primary, size: 24),
                        const SizedBox(width: 12),
                        Text("PY-DJANGO", style: PythonCourseFonts.heading(20, weight: FontWeight.w800)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Empowering developers to build the next generation of web services with Python and Django.",
                      style: PythonCourseFonts.body(16, color: PythonCourseColors.textSecondary),
                    ),
                  ],
                ),
              ),
              if (!isMobile) ...[
                _FooterColumn("Course", ["Curriculum", "Projects", "Reviews", "FAQ"]),
                _FooterColumn("Company", ["About Us", "Contact", "Privacy", "Terms"]),
                _FooterColumn("Social", ["GitHub", "Discord", "Twitter", "LinkedIn"]),
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
                style: PythonCourseFonts.body(14, color: PythonCourseColors.textSecondary),
              ),
              Row(
                children: [
                  _SocialIcon(Icons.code),
                  const SizedBox(width: 20),
                  _SocialIcon(Icons.terminal),
                  const SizedBox(width: 20),
                  _SocialIcon(Icons.hub),
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
          Text(title, style: PythonCourseFonts.heading(16, weight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 24),
          ...links.map((link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(link, style: PythonCourseFonts.body(14, color: PythonCourseColors.textSecondary)),
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
