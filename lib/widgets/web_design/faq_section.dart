import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final faqs = [
      {
        'q': 'What is this course about?',
        'a': 'This comprehensive course covers everything you need to know about modern web design, from user research and wireframing to advanced UI design and prototyping. You will learn to use industry-standard tools and build a professional portfolio.',
      },
      {
        'q': 'Do you provide placement support?',
        'a': 'Yes, we provide 100% placement assistance. Our career support team helps you with resume building, portfolio review, mock interviews, and connects you directly with our hiring partners across the globe.',
      },
      {
        'q': 'Will I get a certificate?',
        'a': 'Absolutely. Upon successful completion of all modules and final projects, you will receive an industry-recognized certificate that you can showcase on your resume and LinkedIn profile.',
      },
      {
        'q': 'What is the course duration?',
        'a': 'The program is designed to be completed in 12 weeks with a commitment of 10-15 hours per week. However, you have lifetime access to the materials so you can learn at your own pace.',
      },
      {
        'q': 'Who is this course for?',
        'a': 'This course is ideal for beginners looking to start a career in design, developers wanting to improve their UI/UX skills, and anyone passionate about creating beautiful and functional digital experiences. No prior design experience is required.',
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 140,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
            ),
            child: const Text(
              "FAQ",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
                fontSize: 12,
                letterSpacing: 1.2,
              ),
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 24),
          const Text(
            "Frequently Asked Questions",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 80),
          
          ...faqs.asMap().entries.map((entry) {
            return _FAQItem(
              question: entry.value['q']!,
              answer: entry.value['a']!,
            ).animate().fadeIn(delay: (400 + entry.key * 100).ms).slideY(begin: 0.1, end: 0);
          }),
        ],
      ),
    );
  }
}

class _FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  const _FAQItem({required this.question, required this.answer});

  @override
  State<_FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<_FAQItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: _isExpanded ? AppColors.primary.withValues(alpha: 0.05) : AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: _isExpanded ? AppColors.primary.withValues(alpha: 0.3) : Colors.white10,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.question,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _isExpanded ? AppColors.primary : AppColors.textPrimary,
                        ),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: _isExpanded ? AppColors.primary : AppColors.background,
                        shape: BoxShape.circle,
                      ),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0, end: _isExpanded ? 1 : 0),
                        duration: const Duration(milliseconds: 300),
                        builder: (context, value, child) {
                          return Transform.rotate(
                            angle: value * math.pi / 4,
                            child: Icon(
                              Icons.add,
                              color: _isExpanded ? Colors.white : AppColors.primary,
                              size: 24,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuart,
                  child: Container(
                    height: _isExpanded ? null : 0,
                    padding: const EdgeInsets.only(top: 24),
                    child: Text(
                      widget.answer,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.textSecondary,
                        height: 1.6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
