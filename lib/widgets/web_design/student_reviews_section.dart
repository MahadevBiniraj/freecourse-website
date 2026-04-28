import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme.dart';

class StudentReviewsSection extends StatelessWidget {
  const StudentReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final reviews = [
      {'name': 'Sarah Jenkins', 'role': 'UX Designer @ Spotify', 'text': 'This bootcamp completely changed my career path. The mentors are top-notch and the curriculum is intensely practical.', 'image': 'assets/malavika.png'},
      {'name': 'James Lin', 'role': 'Product Designer', 'text': 'I built a portfolio that landed me a job at a top tech company in just 4 months. The 1-on-1 feedback was game-changing.', 'image': 'assets/athul.png'},
      {'name': 'Elena Rodriguez', 'role': 'UI Lead', 'text': 'The global network is amazing. I have connections all over the world now. The web design principles taught are timeless.', 'image': 'assets/parvathymrimage.png'},
      {'name': 'David Kim', 'role': 'Freelance Designer', 'text': 'Highly recommend for anyone looking to break into web design. The lessons on Figma and No-code tools are extremely valuable.', 'image': 'assets/fahad.png'},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.15,
        vertical: 140,
      ),
      color: AppColors.background,
      child: Column(
        children: [
          const Text(
            "Loved by Students Worldwide",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: AppColors.textPrimary,
              letterSpacing: -1,
            ),
          ).animate().fadeIn().slideY(begin: 0.2, end: 0),
          const SizedBox(height: 16),
          const Text(
            "Don't just take our word for it. Here's what our alumni have to say.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, color: AppColors.textSecondary),
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 80),
          
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 2,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: isMobile ? 0.8 : 1.3,
            ),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return _ReviewCard(review: review, index: index);
            },
          ),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatefulWidget {
  final Map<String, String> review;
  final int index;

  const _ReviewCard({required this.review, required this.index});

  @override
  State<_ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<_ReviewCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutQuart,
        transform: Matrix4.translationValues(0, isHovered ? -10 : 0, 0),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white10),
          boxShadow: isHovered ? [
            BoxShadow(color: AppColors.primary.withValues(alpha: 0.1), blurRadius: 40, offset: const Offset(0, 20))
          ] : [
            BoxShadow(color: Colors.black.withValues(alpha: 0.5), blurRadius: 20, offset: const Offset(0, 10))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: List.generate(5, (index) => const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 24)),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Text(
                '"${widget.review['text']!}"',
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.textPrimary,
                  height: 1.6,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(widget.review['image']!),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.review['name']!,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.textPrimary),
                    ),
                    Text(
                      widget.review['role']!,
                      style: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ).animate().fadeIn(delay: (400 + widget.index * 150).ms).slideY(begin: 0.1, end: 0),
    );
  }
}
