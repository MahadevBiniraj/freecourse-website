import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      color: AppColors.background,
      child: Column(
        children: [
          // Final CTA Section
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : screenWidth * 0.1,
              vertical: 120,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.3),
                  blurRadius: 60,
                  offset: const Offset(0, 20),
                )
              ],
            ),
            child: Stack(
              children: [
                // Decorative blur
                Positioned(
                  top: -100,
                  right: -100,
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: isMobile ? 64 : 100,
                    horizontal: isMobile ? 24 : 64,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: const Text(
                          "🔥 Limited seats available for the next cohort",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                          ),
                        ),
                      ).animate().fadeIn().slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 32),
                      const Text(
                        "Ready to start your design career?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: -1,
                          height: 1.1,
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 24),
                      const Text(
                        "Join thousands of students and build a portfolio that gets you hired.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, color: Colors.white70),
                      ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
                      const SizedBox(height: 48),
                      const _CTAGlowButton().animate().fadeIn(delay: 600.ms).scale(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Minimal Footer
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 80,
              horizontal: isMobile ? 24 : screenWidth * 0.1,
            ),
            color: const Color(0xFF0A0A0A),
            child: Column(
              children: [
                Flex(
                  direction: isMobile ? Axis.vertical : Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: isMobile ? 0 : 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: const BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(Icons.palette_rounded, color: Colors.white, size: 20),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "PortfolioBuilders",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            "Empowering the next generation\nof product designers.",
                            style: TextStyle(color: Colors.white60, fontSize: 16, height: 1.5),
                          ),
                          const SizedBox(height: 32),
                          Row(
                            children: const [
                              _SocialIcon(icon: FontAwesomeIcons.twitter),
                              SizedBox(width: 16),
                              _SocialIcon(icon: FontAwesomeIcons.linkedinIn),
                              SizedBox(width: 16),
                              _SocialIcon(icon: FontAwesomeIcons.github),
                            ],
                          ),
                          if (isMobile) const SizedBox(height: 64),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: _buildFooterColumn("Platform", ["Courses", "Mentors", "Community"]),
                    ),
                    if (isMobile) const SizedBox(height: 40),
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: _buildFooterColumn("Company", ["About Us", "Careers", "Blog"]),
                    ),
                    if (isMobile) const SizedBox(height: 40),
                    Expanded(
                      flex: isMobile ? 0 : 1,
                      child: _buildFooterColumn("Legal", ["Privacy", "Terms", "Contact"]),
                    ),
                  ],
                ),
                const SizedBox(height: 80),
                const Divider(color: Colors.white10),
                const SizedBox(height: 32),
                const Text(
                  "© 2026 PortfolioBuilders. All rights reserved.",
                  style: TextStyle(color: Colors.white54, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterColumn(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _FooterLink(link),
        )),
      ],
    );
  }
}

class _CTAGlowButton extends StatefulWidget {
  const _CTAGlowButton();

  @override
  State<_CTAGlowButton> createState() => _CTAGlowButtonState();
}

class _CTAGlowButtonState extends State<_CTAGlowButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedScale(
        scale: isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
            boxShadow: isHovered ? [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.4),
                blurRadius: 30,
                spreadRadius: 5,
              )
            ] : [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.1),
                blurRadius: 20,
              )
            ],
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primary,
              shadowColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 24),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            child: const Text("Apply Now"),
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String title;
  const _FooterLink(this.title);

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 200),
        style: TextStyle(
          color: isHovered ? AppColors.primary : Colors.white60,
          fontSize: 15,
          fontWeight: isHovered ? FontWeight.w600 : FontWeight.normal,
        ),
        child: Text(widget.title),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final dynamic icon;
  const _SocialIcon({required this.icon});

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isHovered ? AppColors.primary : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: FaIcon(widget.icon as FaIconData?, color: Colors.white, size: 20),
      ),
    );
  }
}
