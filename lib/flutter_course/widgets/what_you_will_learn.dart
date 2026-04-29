import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme.dart';

class WhatYouWillLearn extends StatelessWidget {
  const WhatYouWillLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    final topics = [
      {'icon': '🚀', 'title': 'Flutter & Dart Foundations', 'desc': 'Master the Dart language and Flutter framework from scratch.'},
      {'icon': '🎨', 'title': 'Beautiful UI Design', 'desc': 'Learn to create pixel-perfect, responsive layouts using Widgets.'},
      {'icon': '🏗️', 'title': 'State Management', 'desc': 'Understand Provider, Riverpod, and BLoC for scalable apps.'},
      {'icon': '🌐', 'title': 'API Integration', 'desc': 'Connect your apps to the world with REST APIs and JSON.'},
      {'icon': '🔥', 'title': 'Local Storage & Firebase', 'desc': 'Work with databases and cloud services for real-time data.'},
      {'icon': '📱', 'title': 'Deployment', 'desc': 'Publish your apps to Play Store and App Store like a pro.'},
    ];

    return Container(
      width: double.infinity,
      color: FlutterCourseColors.background,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 24 : screenWidth * 0.1, vertical: 120),
      child: Column(
        children: [
          Text("What You'll Learn", style: FlutterCourseFonts.body(isMobile ? 32 : 48, weight: FontWeight.w800, color: Colors.white)),
          const SizedBox(height: 16),
          Text("A comprehensive curriculum designed to take you from zero to expert.", style: FlutterCourseFonts.body(18, color: Colors.white54)),
          const SizedBox(height: 80),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : (screenWidth < 1200 ? 2 : 3),
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: 1.5,
            ),
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return _TopicCard(
                icon: topics[index]['icon']!,
                title: topics[index]['title']!,
                desc: topics[index]['desc']!,
              ).animate().fadeIn(delay: (index * 100).ms).slideY(begin: 0.1);
            },
          ),
        ],
      ),
    );
  }
}

class _TopicCard extends StatefulWidget {
  final String icon;
  final String title;
  final String desc;

  const _TopicCard({required this.icon, required this.title, required this.desc});

  @override
  State<_TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<_TopicCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: FlutterCourseColors.surface,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: isHovered ? FlutterCourseColors.primary.withValues(alpha: 0.1) : Colors.black.withValues(alpha: 0.2),
              blurRadius: isHovered ? 30 : 20,
              offset: Offset(0, isHovered ? 10 : 5),
            )
          ],
          border: Border.all(
            color: isHovered ? FlutterCourseColors.primary.withValues(alpha: 0.3) : Colors.white.withValues(alpha: 0.05),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.icon, style: const TextStyle(fontSize: 32)),
            const SizedBox(height: 20),
            Text(widget.title, style: FlutterCourseFonts.body(20, weight: FontWeight.w700, color: Colors.white)),
            const SizedBox(height: 12),
            Text(widget.desc, style: FlutterCourseFonts.body(15, color: Colors.white54, weight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}
