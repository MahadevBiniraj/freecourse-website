import 'package:flutter/material.dart';
import 'widgets/python_navbar.dart';
import 'widgets/python_hero_section.dart';
import 'widgets/python_stats_bar.dart';
import 'widgets/python_what_you_learn.dart';
import 'widgets/python_curriculum.dart';
import 'widgets/python_project_showcase.dart';
import 'widgets/python_enroll_cta.dart';
import 'widgets/python_footer.dart';
import 'widgets/python_foundation_section.dart';
import 'python_course_theme.dart';

class PythonCourseLandingPage extends StatefulWidget {
  const PythonCourseLandingPage({super.key});

  @override
  State<PythonCourseLandingPage> createState() => _PythonCourseLandingPageState();
}

class _PythonCourseLandingPageState extends State<PythonCourseLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey curriculumKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey faqKey = GlobalKey();

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
      backgroundColor: PythonCourseColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                PythonHeroSection(
                  onViewCurriculum: () => _scrollToSection(curriculumKey),
                ),
                const PythonStatsBar(),
                const PythonFoundationSection(),
                const PythonWhatYouLearn(),
                PythonCurriculum(key: curriculumKey),
                PythonProjectShowcase(key: projectsKey),
                const PythonEnrollCTA(),
                const PythonFooter(),
              ],
            ),
          ),
          PythonNavbar(
            onNavigate: (section) {
              if (section == 'Curriculum') _scrollToSection(curriculumKey);
              if (section == 'Projects') _scrollToSection(projectsKey);
              if (section == 'FAQ') _scrollToSection(faqKey);
            },
          ),
        ],
      ),
    );
  }
}
