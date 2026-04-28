import 'package:flutter/material.dart';
import '../widgets/web_design/web_hero_section.dart';
import '../widgets/web_design/global_network_section.dart';
import '../widgets/web_design/ready_for_game_section.dart';
import '../widgets/web_design/curriculum_section.dart';
import '../widgets/web_design/live_mentoring_section.dart';
import '../widgets/web_design/advance_bootcamp_section.dart';
import '../widgets/web_design/student_reviews_section.dart';
import '../widgets/web_design/faq_section.dart';
import '../widgets/web_design/footer_section.dart';

class WebDesignScreen extends StatelessWidget {
  const WebDesignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const WebHeroSection(),
            const GlobalNetworkSection(),
            const ReadyForGameSection(),
            const CurriculumSection(),
            const LiveMentoringSection(),
            const AdvanceBootcampSection(),
            const StudentReviewsSection(),
            const FAQSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
