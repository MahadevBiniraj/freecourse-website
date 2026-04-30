import 'package:flutter/material.dart';
import 'widgets/ai_navbar.dart';
import 'widgets/ai_hero_section.dart';
import 'widgets/ai_stats_bar.dart';
import 'widgets/ai_what_you_learn.dart';
import 'widgets/ai_curriculum.dart';
import 'widgets/ai_project_showcase.dart';
import 'widgets/ai_enroll_cta.dart';
import 'widgets/ai_footer.dart';
import 'ai_ml_course_theme.dart';

class AIMLCourseLandingPage extends StatefulWidget {
  const AIMLCourseLandingPage({super.key});

  @override
  State<AIMLCourseLandingPage> createState() => _AIMLCourseLandingPageState();
}

class _AIMLCourseLandingPageState extends State<AIMLCourseLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey curriculumKey = GlobalKey();
  final GlobalKey showcaseKey = GlobalKey();
  final GlobalKey faqKey = GlobalKey(); // Handled by footer/placeholder if needed

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
      backgroundColor: AICourseColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                AIHeroSection(
                  onViewCurriculum: () => _scrollToSection(curriculumKey),
                ),
                const AIStatsBar(),
                const AIWhatYouLearn(),
                AICurriculum(key: curriculumKey),
                AIProjectShowcase(key: showcaseKey),
                const AIEnrollCTA(),
                const AIFooter(),
              ],
            ),
          ),
          AINavbar(
            onNavigate: (section) {
              if (section == 'Curriculum') _scrollToSection(curriculumKey);
              if (section == 'Models') _scrollToSection(showcaseKey);
            },
          ),
        ],
      ),
    );
  }
}
