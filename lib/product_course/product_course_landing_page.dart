import 'package:flutter/material.dart';
import 'widgets/product_navbar.dart';
import 'widgets/product_hero_section.dart';
import 'widgets/product_stats_bar.dart';
import 'widgets/product_what_you_learn.dart';
import 'widgets/product_curriculum.dart';
import 'widgets/product_case_study.dart';
import 'widgets/product_enroll_cta.dart';
import 'widgets/product_footer.dart';
import 'product_course_theme.dart';

class ProductCourseLandingPage extends StatefulWidget {
  const ProductCourseLandingPage({super.key});

  @override
  State<ProductCourseLandingPage> createState() => _ProductCourseLandingPageState();
}

class _ProductCourseLandingPageState extends State<ProductCourseLandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey curriculumKey = GlobalKey();
  final GlobalKey caseStudyKey = GlobalKey();
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
      backgroundColor: ProductCourseColors.background,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                ProductHeroSection(
                  onViewCurriculum: () => _scrollToSection(curriculumKey),
                ),
                const ProductStatsBar(),
                const ProductWhatYouLearn(),
                ProductCurriculum(key: curriculumKey),
                ProductCaseStudy(key: caseStudyKey),
                const ProductEnrollCTA(),
                const ProductFooter(),
              ],
            ),
          ),
          ProductNavbar(
            onNavigate: (section) {
              if (section == 'Curriculum') _scrollToSection(curriculumKey);
              if (section == 'Case Studies') _scrollToSection(caseStudyKey);
              if (section == 'FAQ') _scrollToSection(faqKey);
            },
          ),
        ],
      ),
    );
  }
}
