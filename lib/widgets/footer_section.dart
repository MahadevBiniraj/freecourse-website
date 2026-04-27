import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../theme.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      color: Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 80,
      ),
      child: Column(
        children: [
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLogo(),
                    const SizedBox(height: 64),
                    _buildLinks(),
                    const SizedBox(height: 64),
                    _buildSocials(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildLogo()),
                    Expanded(flex: 3, child: _buildLinks()),
                    Expanded(flex: 1, child: _buildSocials()),
                  ],
                ),
          const SizedBox(height: 80),
          const Divider(color: AppColors.grey, thickness: 1),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "© 2026 PortfolioBuilders. The future of coding education.",
                style: TextStyle(color: Colors.white38, fontSize: 13),
              ),
              if (!isMobile)
                Row(
                  children: [
                    _FooterSmallLink("Privacy Policy"),
                    const SizedBox(width: 24),
                    _FooterSmallLink("Terms of Service"),
                  ],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.code_rounded, color: Colors.black, size: 20),
            ),
            const SizedBox(width: 16),
            const Text(
              "PortfolioBuilders",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          "The future of coding education.",
          style: TextStyle(color: Colors.white70, fontSize: 15, height: 1.6),
        ),
      ],
    );
  }

  Widget _buildLinks() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _LinkColumn(title: "Company", links: const ["About", "Careers", "Blogs"]),
        _LinkColumn(title: "Categories", links: const ["Design", "Dev", "Marketing"]),
        _LinkColumn(title: "Support", links: const ["Help", "Privacy", "Terms"]),
      ],
    );
  }

  Widget _buildSocials() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          "Connect With Us",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 16),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _SocialIcon(icon: FontAwesomeIcons.twitter),
            const SizedBox(width: 16),
            _SocialIcon(icon: FontAwesomeIcons.linkedinIn),
            const SizedBox(width: 16),
            _SocialIcon(icon: FontAwesomeIcons.github),
          ],
        ),
      ],
    );
  }
}

class _LinkColumn extends StatelessWidget {
  final String title;
  final List<String> links;
  const _LinkColumn({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white, fontSize: 16, letterSpacing: 0.5),
        ),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _FooterLink(link),
            )),
      ],
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
          color: isHovered ? Colors.white : AppColors.textSecondary,
          fontSize: 15,
        ),
        child: Text(widget.title),
      ),
    );
  }
}

class _FooterSmallLink extends StatelessWidget {
  final String title;
  const _FooterSmallLink(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(color: AppColors.textSecondary.withValues(alpha: 0.5), fontSize: 13),
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
          color: isHovered ? AppColors.primary : AppColors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: FaIcon(widget.icon as FaIconData?, color: Colors.white, size: 20),
      ),
    );
  }
}
