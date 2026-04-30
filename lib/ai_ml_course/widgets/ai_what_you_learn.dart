import 'package:flutter/material.dart';
import '../ai_ml_course_theme.dart';

class AIWhatYouLearn extends StatelessWidget {
  const AIWhatYouLearn({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    final skills = [
      {'icon': Icons.code, 'title': 'Python & Data Science', 'desc': 'Master Pandas, NumPy, and Matplotlib for data manipulation and exploratory data analysis (EDA).'},
      {'icon': Icons.account_tree, 'title': 'Supervised Learning', 'desc': 'Build predictive models using Linear Regression, Decision Trees, and Random Forests.'},
      {'icon': Icons.scatter_plot, 'title': 'Unsupervised Learning', 'desc': 'Discover hidden patterns with K-Means clustering, PCA, and anomaly detection.'},
      {'icon': Icons.memory, 'title': 'Deep Learning Basics', 'desc': 'Understand neural networks, backpropagation, and build your first models using TensorFlow/Keras.'},
      {'icon': Icons.query_stats, 'title': 'Model Evaluation', 'desc': 'Master cross-validation, precision/recall, F1 score, and hyperparameter tuning to optimize performance.'},
      {'icon': Icons.cloud_upload, 'title': 'Model Deployment', 'desc': 'Export models and deploy them as scalable APIs using Flask, FastAPI, and Docker containers.'},
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.1,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Core Competencies",
            style: AICourseFonts.display(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 24),
          Text(
            "Acquire the technical skills to process data, train models, and deploy AI solutions.",
            style: AICourseFonts.body(18, color: AICourseColors.textSecondary),
          ),
          const SizedBox(height: 64),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2 : 1.2,
            ),
            itemCount: skills.length,
            itemBuilder: (context, index) {
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
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AICourseColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AICourseColors.primary.withOpacity(0.2)),
                      ),
                      child: Icon(
                        skills[index]['icon'] as IconData,
                        color: AICourseColors.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      skills[index]['title'] as String,
                      style: AICourseFonts.heading(20, color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: Text(
                        skills[index]['desc'] as String,
                        style: AICourseFonts.body(14, color: AICourseColors.textSecondary),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
