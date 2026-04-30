import 'package:flutter/material.dart';
import 'widgets/blockchain_navbar.dart';
import 'widgets/blockchain_hero_section.dart';
import 'widgets/blockchain_stats_bar.dart';
import 'widgets/blockchain_what_you_learn.dart';
import 'widgets/blockchain_curriculum.dart';
import 'widgets/blockchain_project_showcase.dart';
import 'widgets/blockchain_enroll_cta.dart';
import 'widgets/blockchain_footer.dart';
import 'blockchain_course_theme.dart';

class BlockchainCourseLandingPage extends StatefulWidget {
  const BlockchainCourseLandingPage({super.key});

  @override
  State<BlockchainCourseLandingPage> createState() => _BlockchainCourseLandingPageState();
}

class _BlockchainCourseLandingPageState extends State<BlockchainCourseLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey curriculumKey = GlobalKey();
  final GlobalKey showcaseKey = GlobalKey();

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
      backgroundColor: BlockchainCourseColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                BlockchainHeroSection(
                  onViewCurriculum: () => _scrollToSection(curriculumKey),
                ),
                const BlockchainStatsBar(),
                const BlockchainWhatYouLearn(),
                BlockchainCurriculum(key: curriculumKey),
                BlockchainProjectShowcase(key: showcaseKey),
                const BlockchainEnrollCTA(),
                const BlockchainFooter(),
              ],
            ),
          ),
          BlockchainNavbar(
            onNavigate: (section) {
              if (section == 'Curriculum') _scrollToSection(curriculumKey);
              if (section == 'DApps') _scrollToSection(showcaseKey);
            },
          ),
        ],
      ),
    );
  }
}
