import 'package:flutter/material.dart';
import 'widgets/marketing_navbar.dart';
import 'widgets/marketing_hero_section.dart';
import 'widgets/marketing_stats_bar.dart';
import 'widgets/marketing_what_you_learn.dart';
import 'widgets/marketing_curriculum.dart';
import 'widgets/marketing_project_showcase.dart';
import 'widgets/marketing_enroll_cta.dart';
import 'widgets/marketing_footer.dart';
import 'digital_marketing_course_theme.dart';

class DigitalMarketingCourseLandingPage extends StatefulWidget {
  const DigitalMarketingCourseLandingPage({super.key});

  @override
  State<DigitalMarketingCourseLandingPage> createState() => _DigitalMarketingCourseLandingPageState();
}

class _DigitalMarketingCourseLandingPageState extends State<DigitalMarketingCourseLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey curriculumKey = GlobalKey();
  final GlobalKey showcaseKey = GlobalKey();
  final GlobalKey faqKey = GlobalKey(); // Currently maps to nothing or footer if added later

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MarketingCourseColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                MarketingHeroSection(
                  onViewCurriculum: () => _scrollToSection(curriculumKey),
                ),
                const MarketingStatsBar(),
                const MarketingWhatYouLearn(),
                MarketingCurriculum(key: curriculumKey),
                MarketingProjectShowcase(key: showcaseKey),
                const MarketingEnrollCTA(),
                const MarketingFooter(),
              ],
            ),
          ),
          MarketingNavbar(
            onNavigate: (section) {
              if (section == 'Curriculum') _scrollToSection(curriculumKey);
              if (section == 'Showcase') _scrollToSection(showcaseKey);
              // FAQ can be added later, currently handled by simple placeholder if needed
            },
          ),
        ],
      ),
    );
  }
}
