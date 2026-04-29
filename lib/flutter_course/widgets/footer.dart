import 'package:flutter/material.dart';
import '../theme.dart';

class Footer extends StatelessWidget {
  final String? brandName;
  final String? description;

  const Footer({
    super.key,
    this.brandName,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;
    
    final displayBrand = brandName ?? "Flutter Free Course";
    final displayDesc = description ?? "Empowering developers to build beautiful apps for any screen. Join our community and master your craft today.";

    return Container(
      width: double.infinity,
      color: Colors.black, // Use absolute black for consistency
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 100),
      child: Column(
        children: [
          const Divider(color: Colors.white10),
          const SizedBox(height: 80),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Column 1: Brand
              Expanded(
                flex: isMobile ? 1 : 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(displayBrand, style: FlutterCourseFonts.body(24, weight: FontWeight.w800, color: Colors.white)),
                    const SizedBox(height: 24),
                    Text(
                      displayDesc,
                      style: FlutterCourseFonts.body(16, color: Colors.white.withValues(alpha: 0.5), height: 1.6),
                    ),
                  ],
                ),
              ),
              if (!isMobile) const Spacer(flex: 1),
              
              // Column 2: Course
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: _FooterColumn("Course", ["Curriculum", "Instructors", "Reviews", "FAQ"]),
                ),
              
              // Column 3: Resources
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: _FooterColumn("Resources", ["Documentation", "GitHub Repo", "Community", "Support"]),
                ),
              
              // Column 4: Connect
              if (!isMobile)
                Expanded(
                  flex: 2,
                  child: _FooterColumn("Connect", ["Twitter", "LinkedIn", "YouTube", "Discord"]),
                ),
            ],
          ),
          
          if (isMobile)
            const Padding(
              padding: EdgeInsets.only(top: 48),
              child: Divider(color: Colors.white10),
            ),
          
          const SizedBox(height: 80),
          const Divider(color: Colors.white10),
          const SizedBox(height: 40),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("© 2024 $displayBrand. All rights reserved.", style: FlutterCourseFonts.body(14, color: Colors.white.withValues(alpha: 0.3))),
              if (!isMobile)
                Row(
                  children: [
                    _FooterLink("Privacy Policy"),
                    const SizedBox(width: 24),
                    _FooterLink("Terms of Service"),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: FlutterCourseFonts.body(16, weight: FontWeight.w800, color: Colors.white)),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _FooterLink(link),
        )),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  const _FooterLink(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(label, style: FlutterCourseFonts.body(14, color: Colors.white.withValues(alpha: 0.4)));
  }
}
