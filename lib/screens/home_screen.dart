import 'package:flutter/material.dart';
import '../widgets/hero_section.dart';
import '../widgets/partners_section.dart';
import '../widgets/courses_section.dart';
import '../widgets/feature_section.dart';
import '../widgets/why_choose_us_section.dart';
import '../widgets/mentors_section.dart';
import '../widgets/faq_section.dart';
import '../widgets/cta_section.dart';
import '../widgets/footer_section.dart';
import '../theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                _buildNavBar(context),
                HeroSection(scrollOffset: _scrollOffset),
                const PartnersSection(),
                const CoursesSection(),
                const FeatureSection(),
                const WhyChooseUsSection(),
                const MentorsSection(),
                const FAQSection(),
                CTASection(scrollOffset: _scrollOffset),
                const FooterSection(),
              ],
            ),
          ),
          // Floating Nav Bar if needed, but for now just keep it in scroll
        ],
      ),
    );
  }

  Widget _buildNavBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 24,
      ),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.code_rounded, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              const Text(
                "PortfolioBuilders",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          if (!isMobile)
            Row(
              children: [
                _NavLink("Courses"),
                _NavLink("Mentors"),
                _NavLink("Features"),
                const SizedBox(width: 32),
                const Icon(Icons.menu_rounded, color: Colors.black, size: 28),
              ],
            )
          else
            const Icon(Icons.menu_rounded, color: Colors.black, size: 28),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String title;
  const _NavLink(this.title);

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: TextStyle(
                color: isHovered ? Colors.black : Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: isHovered ? 20 : 0,
              color: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
