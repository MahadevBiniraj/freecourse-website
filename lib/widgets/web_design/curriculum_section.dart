import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class CurriculumSection extends StatefulWidget {
  const CurriculumSection({super.key});

  @override
  State<CurriculumSection> createState() => _CurriculumSectionState();
}

class _CurriculumSectionState extends State<CurriculumSection> {
  int _expandedIndex = 0;

  final modules = [
    {
      'title': 'Module 1: Design Fundamentals',
      'desc': 'Understand color theory, typography, spacing, and the core principles of creating aesthetically pleasing interfaces.'
    },
    {
      'title': 'Module 2: User Experience (UX) Research',
      'desc': 'Learn how to conduct user interviews, create personas, map user journeys, and identify pain points.'
    },
    {
      'title': 'Module 3: Wireframing & Prototyping',
      'desc': 'Translate your ideas into low and high-fidelity wireframes using Figma. Build interactive prototypes.'
    },
    {
      'title': 'Module 4: Advanced UI Design',
      'desc': 'Master complex components, design systems, auto-layout, and micro-interactions.'
    },
    {
      'title': 'Module 5: Webflow & No-Code',
      'desc': 'Bring your designs to life by developing responsive websites without writing a single line of code.'
    },
    {
      'title': 'Module 6: Portfolio & Career Preparation',
      'desc': 'Compile your best work into a stunning portfolio. Learn interview techniques and land your first gig.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 120,
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
              "CURRICULUM",
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
            "What you will learn",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: AppColors.textPrimary, letterSpacing: -1),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          const Text(
            "A step-by-step path from beginner to industry-ready product designer.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 64),
          
          ...modules.asMap().entries.map((entry) {
            final index = entry.key;
            final module = entry.value;
            final isExpanded = _expandedIndex == index;

            return _buildAccordionItem(index, module, isExpanded)
                .animate()
                .fadeIn(delay: (600 + index * 100).ms)
                .slideY(begin: 0.2, end: 0);
          }),
        ],
      ),
    );
  }

  Widget _buildAccordionItem(int index, Map<String, String> module, bool isExpanded) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isExpanded ? AppColors.primary.withValues(alpha: 0.05) : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isExpanded ? AppColors.primary.withValues(alpha: 0.3) : Colors.white10,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            setState(() {
              _expandedIndex = isExpanded ? -1 : index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isExpanded ? AppColors.primary : AppColors.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "0${index + 1}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isExpanded ? Colors.white : AppColors.textSecondary,
                        ),
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: Text(
                        module['title']!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isExpanded ? AppColors.primary : AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                      color: isExpanded ? AppColors.primary : AppColors.textSecondary,
                    ),
                  ],
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuart,
                  child: Container(
                    height: isExpanded ? null : 0,
                    padding: const EdgeInsets.only(top: 24, left: 64),
                    child: Text(
                      module['desc']!,
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
