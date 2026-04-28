import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StudentReviewsSection extends StatelessWidget {
  const StudentReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final reviews = [
      {'name': 'Sarah J.', 'text': 'This bootcamp completely changed my career path. The mentors are top-notch!', 'image': 'assets/malavika.png'},
      {'name': 'James L.', 'text': 'I built a portfolio that landed me a job at a top tech company in months.', 'image': 'assets/athul.png'},
      {'name': 'Elena R.', 'text': 'The global network is amazing. I have connections all over the world now.', 'image': 'assets/parvathymrimage.png'},
      {'name': 'David K.', 'text': 'Highly recommend for anyone looking to break into web design.', 'image': 'assets/fahad.png'},
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 24),
      color: const Color(0xFFFAF9F6), // Soft Beige
      child: Column(
        children: [
          const Text(
            "Student Reviews",
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.black, letterSpacing: -1),
          ),
          const SizedBox(height: 16),
          const Text(
            "A word from our previous students.",
            style: TextStyle(fontSize: 18, color: Colors.black54),
          ),
          const SizedBox(height: 80),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: 0.65,
            ),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return _buildReviewCard(review, index);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(Map<String, String> review, int index) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 20, offset: const Offset(0, 10)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: AssetImage(review['image']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            review['name']!,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '"${review['text']!}"',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.black87, height: 1.5),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {},
            child: const Text("Read full review", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ).animate().fadeIn(delay: (200 * index).ms);
  }
}
