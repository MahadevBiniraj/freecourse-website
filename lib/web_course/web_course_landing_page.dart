import 'package:flutter/material.dart';
import 'widgets/web_hero_section.dart';
import 'widgets/web_info_cards.dart';
import 'widgets/web_what_you_learn.dart';
import 'widgets/web_curriculum.dart';
import 'widgets/projects_showcase.dart';
import 'widgets/web_enroll_cta.dart';
import '../flutter_course/widgets/footer.dart';
import 'web_course_theme.dart';

class WebCourseLandingPage extends StatefulWidget {
  const WebCourseLandingPage({super.key});

  @override
  State<WebCourseLandingPage> createState() => _WebCourseLandingPageState();
}

class _WebCourseLandingPageState extends State<WebCourseLandingPage> {
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
        scaffoldBackgroundColor: WebCourseColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: WebCourseColors.primary,
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
                  WebHeroSection(onViewCurriculum: () => _scrollToSection(curriculumKey)),
                  const WebInfoCards(),
                  const WebWhatYouLearn(),
                  WebCurriculum(key: curriculumKey),
                  ProjectsShowcase(key: projectsKey),
                  const WebEnrollCTA(),
                  const Footer(
                    brandName: "Full Stack Web Development Free Course",
                    description: "Master the MERN stack and build production-ready web applications. Join our community of web developers today.",
                  ),
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
        color: WebCourseColors.background.withValues(alpha: 0.8),
        border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.webhook_rounded, color: WebCourseColors.primary, size: 32),
              const SizedBox(width: 12),
              Text("FullStack Web", style: WebCourseFonts.heading(20, weight: FontWeight.w900)),
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
                  backgroundColor: WebCourseColors.primary,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                ),
                child: Text("Enroll Free", style: WebCourseFonts.body(14, weight: FontWeight.w700, color: Colors.black)),
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
        child: Text(title, style: WebCourseFonts.body(15, color: Colors.white70, weight: FontWeight.w600)),
      ),
    );
  }
}
