import 'package:flutter/material.dart';
import 'widgets/game_hero_section.dart';
import 'widgets/game_info_cards.dart';
import 'widgets/game_what_you_learn.dart';
import 'widgets/game_curriculum.dart';
import 'widgets/game_project_showcase.dart';
import 'widgets/game_enroll_cta.dart';
import '../flutter_course/widgets/footer.dart';
import 'game_course_theme.dart';

class GameCourseLandingPage extends StatefulWidget {
  const GameCourseLandingPage({super.key});

  @override
  State<GameCourseLandingPage> createState() => _GameCourseLandingPageState();
}

class _GameCourseLandingPageState extends State<GameCourseLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey curriculumKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();

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
    return Theme(
      data: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: GameCourseColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: GameCourseColors.primary,
          brightness: Brightness.dark,
        ),
      ),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GameHeroSection(onViewCurriculum: () => _scrollToSection(curriculumKey)),
                  const GameInfoCards(),
                  const GameWhatYouLearn(),
                  GameCurriculum(key: curriculumKey),
                  GameProjectShowcase(key: projectsKey),
                  const GameEnrollCTA(),
                  const Footer(),
                ],
              ),
            ),
            _buildThemedNavbar(),
          ],
        ),
      ),
    );
  }

  Widget _buildThemedNavbar() {
    return Container(
      width: double.infinity,
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      decoration: BoxDecoration(
        color: GameCourseColors.background.withValues(alpha: 0.8),
        border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.videogame_asset_rounded, color: GameCourseColors.primary, size: 32),
              const SizedBox(width: 12),
              Text("GameDev Master", style: GameCourseFonts.heading(20, weight: FontWeight.w900)),
            ],
          ),
          Row(
            children: [
              _NavLink("Curriculum", () => _scrollToSection(curriculumKey)),
              _NavLink("Projects", () => _scrollToSection(projectsKey)),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: GameCourseColors.primary,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                ),
                child: Text("Enroll Free", style: GameCourseFonts.body(14, weight: FontWeight.w700, color: Colors.black)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const _NavLink(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(title, style: GameCourseFonts.body(15, color: Colors.white70, weight: FontWeight.w600)),
      ),
    );
  }
}
