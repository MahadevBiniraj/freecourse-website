import 'package:flutter/material.dart';
import 'widgets/navbar.dart';
import 'widgets/hero_section.dart';
import 'widgets/stats_bar.dart';
import 'widgets/what_you_will_learn.dart';
import 'widgets/curriculum_section.dart';
import 'widgets/instructor_section.dart';
import 'widgets/testimonials_section.dart';
import 'widgets/faq_section.dart';
import 'widgets/enroll_cta.dart';
import 'widgets/footer.dart';
import 'theme.dart';

class FlutterCourseLandingPage extends StatefulWidget {
  const FlutterCourseLandingPage({super.key});

  @override
  State<FlutterCourseLandingPage> createState() => _FlutterCourseLandingPageState();
}

class _FlutterCourseLandingPageState extends State<FlutterCourseLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey curriculumKey = GlobalKey();
  final GlobalKey instructorKey = GlobalKey();
  final GlobalKey reviewsKey = GlobalKey();
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
      backgroundColor: FlutterCourseColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  onViewCurriculum: () => _scrollToSection(curriculumKey),
                ),
                const StatsBar(),
                const WhatYouWillLearn(),
                CurriculumSection(key: curriculumKey),
                InstructorSection(key: instructorKey),
                TestimonialsSection(key: reviewsKey),
                FAQSection(key: faqKey),
                const EnrollCTA(),
                const Footer(),
              ],
            ),
          ),
          Navbar(
            onNavigate: (section) {
              if (section == 'Curriculum') _scrollToSection(curriculumKey);
              if (section == 'Instructor') _scrollToSection(instructorKey);
              if (section == 'Reviews') _scrollToSection(reviewsKey);
              if (section == 'FAQ') _scrollToSection(faqKey);
            },
          ),
        ],
      ),
    );
  }
}
