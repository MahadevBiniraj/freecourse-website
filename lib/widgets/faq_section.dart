import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'scroll_appear.dart';

class FAQSection extends StatelessWidget {
  const FAQSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final faqs = [
      {'q': 'What is PortfolioBuilders?', 'a': 'PortfolioBuilders is an online platform that provides high-quality tech education for free.'},
      {'q': 'Is it free?', 'a': 'Yes, all our courses are 100% free with no hidden charges.'},
      {'q': 'Who is it for?', 'a': 'Anyone looking to start or advance their career in tech, from beginners to experienced pros.'},
      {'q': 'How long does it take?', 'a': 'Most courses range from 10 to 16 weeks depending on the intensity and topic.'},
      {'q': 'Do I need prior experience?', 'a': 'No prior experience is required for our foundational courses. We start from the basics.'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 120,
      ),
      color: Colors.white,
      child: Column(
        children: [
          ScrollAppear(
            child: const Text(
              "We've got the answers\nFor your questions",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                letterSpacing: -0.5,
              ),
            ),
          ),
          const SizedBox(height: 80),
          ...faqs.asMap().entries.map((entry) => ScrollAppear(
                delay: (entry.key * 100).ms,
                child: _FAQItem(question: entry.value['q']!, answer: entry.value['a']!),
              )),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(vertical: 12),
          title: Text(
            widget.question,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(4),
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 18,
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Text(
                widget.answer,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
