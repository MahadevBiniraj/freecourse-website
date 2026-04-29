import 'package:flutter/material.dart';
import '../theme.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final faqs = [
      {'q': 'Is this course really free?', 'a': 'Yes, the entire course is 100% free with no hidden charges. We believe in making quality education accessible to everyone.'},
      {'q': 'Do I need prior coding experience?', 'a': 'Not at all! We start from the very basics of Dart and move gradually to advanced Flutter concepts.'},
      {'q': 'Will I get a certificate?', 'a': 'Yes, upon completing all modules and the final project, you will receive a digital certificate of completion.'},
      {'q': 'How long does it take to finish?', 'a': 'Most students finish the course in 4-6 weeks by dedicating about 5-10 hours per week.'},
      {'q': 'Can I access the course on mobile?', 'a': 'Absolutely! Our platform is fully responsive, and you can learn on any device, anywhere.'},
    ];

    return Container(
      width: double.infinity,
      color: FlutterCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.25, vertical: 120),
      child: Column(
        children: [
          Text("Frequently Asked Questions", style: FlutterCourseFonts.body(isMobile ? 32 : 48, weight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 80),
          ...faqs.map((faq) => _FAQItem(question: faq['q']!, answer: faq['a']!)),
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

class _FAQItemState extends State<_FAQItem> with SingleTickerProviderStateMixin {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.white.withValues(alpha: 0.05))),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => isOpen = !isOpen),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(widget.question, style: FlutterCourseFonts.body(18, weight: FontWeight.w700, color: Colors.white)),
                  ),
                  AnimatedRotation(
                    turns: isOpen ? 0.125 : 0, // 45 degrees
                    duration: const Duration(milliseconds: 300),
                    child: Icon(Icons.add, color: FlutterCourseColors.primary, size: 28),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(widget.answer, style: FlutterCourseFonts.body(16, color: Colors.white54, height: 1.6)),
            ),
            crossFadeState: isOpen ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
