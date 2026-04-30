import 'package:flutter/material.dart';
import '../ai_ml_course_theme.dart';

class AIProjectShowcase extends StatelessWidget {
  const AIProjectShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deployed Models",
            style: AICourseFonts.display(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "Build a portfolio of real-world AI applications and models.",
            style: AICourseFonts.body(18, color: AICourseColors.textSecondary),
          ),
          const SizedBox(height: 64),
          isMobile
              ? Column(
                  children: [
                    _buildProjectCard(
                      'Customer Churn Predictor',
                      'A classification model trained on telecom data to predict user retention.',
                      Icons.people_alt,
                    ),
                    const SizedBox(height: 24),
                    _buildProjectCard(
                      'Housing Price Estimator',
                      'A multivariate regression model for real estate valuation.',
                      Icons.real_estate_agent,
                    ),
                    const SizedBox(height: 24),
                    _buildProjectCard(
                      'Computer Vision Classifier',
                      'A CNN deep learning model for image classification using TensorFlow.',
                      Icons.visibility,
                    ),
                  ],
                )
              : Row(
                  children: [
                    Expanded(
                      child: _buildProjectCard(
                        'Customer Churn Predictor',
                        'A classification model trained on telecom data to predict user retention.',
                        Icons.people_alt,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildProjectCard(
                        'Housing Price Estimator',
                        'A multivariate regression model for real estate valuation.',
                        Icons.real_estate_agent,
                      ),
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: _buildProjectCard(
                        'Computer Vision Classifier',
                        'A CNN deep learning model for image classification using TensorFlow.',
                        Icons.visibility,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(String title, String desc, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AICourseColors.glassBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AICourseColors.glassBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AICourseColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AICourseColors.border),
            ),
            child: Icon(icon, color: AICourseColors.primary, size: 40),
          ),
          const SizedBox(height: 32),
          Text(title, style: AICourseFonts.heading(24, color: Colors.white)),
          const SizedBox(height: 16),
          Text(desc, style: AICourseFonts.body(16, color: AICourseColors.textSecondary)),
        ],
      ),
    );
  }
}
