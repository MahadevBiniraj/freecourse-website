import 'package:flutter/material.dart';
import '../theme.dart';

class CurriculumSection extends StatelessWidget {
  const CurriculumSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final modules = [
      {'title': 'Getting Started', 'lessons': '4 Lessons • 45m'},
      {'title': 'Dart Essentials', 'lessons': '8 Lessons • 2h 15m'},
      {'title': 'Widgets & Layouts', 'lessons': '10 Lessons • 3h 30m'},
      {'title': 'Navigation', 'lessons': '5 Lessons • 1h 10m'},
      {'title': 'State Management', 'lessons': '7 Lessons • 2h 45m'},
      {'title': 'Networking', 'lessons': '6 Lessons • 1h 50m'},
      {'title': 'Firebase Integration', 'lessons': '5 Lessons • 2h 20m'},
      {'title': 'Publishing', 'lessons': '3 Lessons • 1h 00m'},
    ];

    return Container(
      width: double.infinity,
      color: FlutterCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.2, vertical: 120),
      child: Column(
        children: [
          Text("Course Curriculum", style: FlutterCourseFonts.body(isMobile ? 32 : 48, weight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 60),
          ...modules.asMap().entries.map((entry) {
            int idx = entry.key;
            var mod = entry.value;
            return _ModuleAccordion(
              number: idx + 1,
              title: mod['title']!,
              lessonsInfo: mod['lessons']!,
            );
          }),
        ],
      ),
    );
  }
}

class _ModuleAccordion extends StatefulWidget {
  final int number;
  final String title;
  final String lessonsInfo;

  const _ModuleAccordion({required this.number, required this.title, required this.lessonsInfo});

  @override
  State<_ModuleAccordion> createState() => _ModuleAccordionState();
}

class _ModuleAccordionState extends State<_ModuleAccordion> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: FlutterCourseColors.surface,
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: FlutterCourseColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text("${widget.number}", style: FlutterCourseFonts.label(16, color: FlutterCourseColors.primary, weight: FontWeight.w700)),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title, style: FlutterCourseFonts.body(18, weight: FontWeight.w700, color: Colors.white)),
                        const SizedBox(height: 4),
                        Text(widget.lessonsInfo, style: FlutterCourseFonts.body(14, color: Colors.white54)),
                      ],
                    ),
                  ),
                  Icon(isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: Colors.white70),
                ],
              ),
            ),
          ),
          if (isExpanded)
            Container(
              padding: const EdgeInsets.only(left: 84, right: 24, bottom: 24),
              child: Column(
                children: [
                  _LessonItem("Introduction to the module", "10:20"),
                  _LessonItem("Core concepts and theory", "15:45"),
                  _LessonItem("Practical coding exercise", "25:30"),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _LessonItem extends StatelessWidget {
  final String title;
  final String duration;

  const _LessonItem(this.title, this.duration);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.play_circle_outline, size: 20, color: FlutterCourseColors.primary),
              const SizedBox(width: 12),
              Text(title, style: FlutterCourseFonts.body(15, color: Colors.white70)),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: FlutterCourseColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text("Free", style: TextStyle(color: FlutterCourseColors.primary, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          Text(duration, style: FlutterCourseFonts.label(13, color: Colors.white30)),
        ],
      ),
    );
  }
}
