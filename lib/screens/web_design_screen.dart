import 'package:flutter/material.dart';
import '../theme.dart';
import '../widgets/web_design/web_hero_section.dart';
import '../widgets/web_design/global_network_section.dart';
import '../widgets/web_design/ready_for_game_section.dart';
import '../widgets/web_design/curriculum_section.dart';
import '../widgets/web_design/live_mentoring_section.dart';
import '../widgets/web_design/advance_portfolio_builders_section.dart';
import '../widgets/web_design/student_reviews_section.dart';
import '../widgets/web_design/faq_section.dart';
import '../widgets/web_design/footer_section.dart';

class WebDesignScreen extends StatelessWidget {
  const WebDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: const [
            WebHeroSection(),
            GlobalNetworkSection(),
            ReadyForGameSection(),
            CurriculumSection(),
            LiveMentoringSection(),
            AdvancePortfolioBuildersSection(),
            StudentReviewsSection(),
            FAQSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
