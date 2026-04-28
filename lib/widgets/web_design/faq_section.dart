import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'What is this course about?',
      'answer': 'This comprehensive course covers everything you need to know about modern web design, from user research and wireframing to advanced UI design and prototyping. You will learn to use industry-standard tools and build a professional portfolio.',
      'isExpanded': false,
    },
    {
      'question': 'Do you provide placement support?',
      'answer': 'Yes, we provide 100% placement assistance. Our career support team helps you with resume building, portfolio review, mock interviews, and connects you directly with our hiring partners across the globe.',
      'isExpanded': false,
    },
    {
      'question': 'Will I get a certificate?',
      'answer': 'Absolutely. Upon successful completion of all modules and final projects, you will receive an industry-recognized certificate that you can showcase on your resume and LinkedIn profile.',
      'isExpanded': false,
    },
    {
      'question': 'What is the course duration?',
      'answer': 'The bootcamp is designed to be completed in 12 weeks with a commitment of 10-15 hours per week. However, you have lifetime access to the materials so you can learn at your own pace.',
      'isExpanded': false,
    },
    {
      'question': 'Who is this course for?',
      'answer': 'This course is ideal for beginners looking to start a career in design, developers wanting to improve their UI/UX skills, and anyone passionate about creating beautiful and functional digital experiences. No prior design experience is required.',
      'isExpanded': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            "FAQ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              letterSpacing: -1,
            ),
          ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          const Text(
            "Frequently asked questions about the bootcamp.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ).animate().fadeIn(delay: 400.ms),
          const SizedBox(height: 80),
          
          SizedBox(
            width: screenWidth > 800 ? 800 : double.infinity,
            child: Column(
              children: List.generate(_faqs.length, (index) {
                return _buildFAQItem(_faqs[index], index);
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(Map<String, dynamic> faq, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          if (faq['isExpanded'])
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            faq['question'],
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: faq['isExpanded'] ? Colors.black : Colors.black87,
            ),
          ),
          trailing: Icon(
            faq['isExpanded'] ? Icons.remove : Icons.add,
            color: Colors.black54,
          ),
          onExpansionChanged: (expanded) {
            setState(() {
              faq['isExpanded'] = expanded;
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
              child: Text(
                faq['answer'],
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(delay: (100 * index).ms);
  }
}
