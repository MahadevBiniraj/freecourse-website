import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../python_course_theme.dart';

class PythonFoundationSection extends StatelessWidget {
  const PythonFoundationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      decoration: BoxDecoration(
        color: PythonCourseColors.surface,
        border: Border.symmetric(
          horizontal: BorderSide(color: PythonCourseColors.primary.withOpacity(0.1), width: 1),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 2,
                color: PythonCourseColors.primary,
              ),
              const SizedBox(width: 16),
              Text(
                "FOUNDATION FIRST",
                style: PythonCourseFonts.mono(14, color: PythonCourseColors.primary, weight: FontWeight.w700),
              ),
            ],
          ).animate().fadeIn(),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  children: [
                    _buildContent(isMobile),
                    const SizedBox(height: 60),
                    _buildVisual(isMobile),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _buildContent(isMobile)),
                    const SizedBox(width: 80),
                    Expanded(child: _buildVisual(isMobile)),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Complete Python Mastery\nIncluded for Free.",
          style: PythonCourseFonts.heading(isMobile ? 32 : 48, height: 1.1),
        ).animate().fadeIn(delay: 200.ms),
        const SizedBox(height: 24),
        Text(
          "Most Django courses assume you already know Python. We don't. We've integrated a full-scale Python programming course to ensure you have the rock-solid foundation needed to build complex web systems.",
          style: PythonCourseFonts.body(18, color: PythonCourseColors.textSecondary),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 40),
        _FeatureRow(icon: Icons.check_circle_outline, text: "Basic Syntax to Advanced OOP"),
        _FeatureRow(icon: Icons.check_circle_outline, text: "Functional & Asynchronous Programming"),
        _FeatureRow(icon: Icons.check_circle_outline, text: "Data Structures & Algorithms in Python"),
      ],
    );
  }

  Widget _buildVisual(bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.terminal, color: PythonCourseColors.primary, size: 18),
              const SizedBox(width: 12),
              Text("python_course.py", style: PythonCourseFonts.mono(12, color: PythonCourseColors.textSecondary)),
            ],
          ),
          const SizedBox(height: 24),
          _CodeLine(text: "def master_python():", color: Colors.purpleAccent),
          _CodeLine(text: "    foundation = learn_basics()", color: Colors.blueAccent, indent: 1),
          _CodeLine(text: "    logic = master_oop()", color: Colors.blueAccent, indent: 1),
          _CodeLine(text: "    return foundation + logic", color: Colors.purpleAccent, indent: 1),
          const SizedBox(height: 24),
          _CodeLine(text: "print(master_python())", color: Colors.greenAccent),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: PythonCourseColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              "> Result: Senior Backend Engineer 🚀",
              style: PythonCourseFonts.mono(12, color: PythonCourseColors.primary),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 600.ms).slideX(begin: 0.1);
  }
}

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, color: PythonCourseColors.primary, size: 20),
          const SizedBox(width: 12),
          Text(text, style: PythonCourseFonts.body(16, color: Colors.white, weight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _CodeLine extends StatelessWidget {
  final String text;
  final Color color;
  final int indent;

  const _CodeLine({required this.text, required this.color, this.indent = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: indent * 20.0),
      child: Text(
        text,
        style: PythonCourseFonts.mono(14, color: color),
      ),
    );
  }
}
