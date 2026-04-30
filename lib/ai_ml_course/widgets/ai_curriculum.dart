import 'package:flutter/material.dart';
import '../ai_ml_course_theme.dart';

class AICurriculum extends StatefulWidget {
  const AICurriculum({super.key});

  @override
  State<AICurriculum> createState() => _AICurriculumState();
}

class _AICurriculumState extends State<AICurriculum> {
  int? _expandedIndex;

  final modules = [
    {
      'title': 'Module 1: Python for Data Science',
      'lessons': [
        'Python Basics & Data Structures',
        'NumPy Arrays & Vectorization',
        'Data Manipulation with Pandas',
        'Data Visualization (Matplotlib & Seaborn)',
      ],
    },
    {
      'title': 'Module 2: Applied Statistics & EDA',
      'lessons': [
        'Descriptive & Inferential Statistics',
        'Probability Distributions',
        'Exploratory Data Analysis (EDA) Techniques',
        'Handling Missing Data & Outliers',
      ],
    },
    {
      'title': 'Module 3: Machine Learning - Supervised',
      'lessons': [
        'Linear & Logistic Regression',
        'Decision Trees & Random Forests',
        'Support Vector Machines (SVM)',
        'Model Evaluation Metrics (Accuracy, Precision, Recall)',
      ],
    },
    {
      'title': 'Module 4: Machine Learning - Unsupervised',
      'lessons': [
        'K-Means Clustering',
        'Hierarchical Clustering',
        'Principal Component Analysis (PCA)',
        'Anomaly Detection Systems',
      ],
    },
    {
      'title': 'Module 5: Deep Learning Foundations',
      'lessons': [
        'Introduction to Artificial Neural Networks',
        'Forward & Backward Propagation',
        'Building Models with TensorFlow & Keras',
        'Hyperparameter Tuning & Optimization',
      ],
    },
    {
      'title': 'Module 6: Model Deployment',
      'lessons': [
        'Saving & Loading Models (Pickle/H5)',
        'Building REST APIs with Flask/FastAPI',
        'Containerization with Docker',
        'Deploying to Cloud Platforms (AWS/GCP)',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;

    return Container(
      color: AICourseColors.surface,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : screenWidth * 0.2,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AICourseColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: AICourseColors.primary.withOpacity(0.3)),
                ),
                child: Text(
                  "ARCHITECTURE",
                  style: AICourseFonts.code(12, color: AICourseColors.primary, weight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            "Training Sequence",
            style: AICourseFonts.display(isMobile ? 36 : 48, color: Colors.white),
          ),
          const SizedBox(height: 64),
          ...List.generate(modules.length, (index) => _buildModule(index)),
        ],
      ),
    );
  }

  Widget _buildModule(int index) {
    final isExpanded = _expandedIndex == index;
    final module = modules[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AICourseColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isExpanded ? AICourseColors.primary : AICourseColors.border,
        ),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: isExpanded,
          onExpansionChanged: (expanded) {
            setState(() {
              _expandedIndex = expanded ? index : null;
            });
          },
          iconColor: AICourseColors.primary,
          collapsedIconColor: AICourseColors.textSecondary,
          title: Text(
            module['title'] as String,
            style: AICourseFonts.heading(18, color: isExpanded ? AICourseColors.primary : Colors.white),
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: AICourseColors.border)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: (module['lessons'] as List<String>).map((lesson) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.check_box_outline_blank, color: AICourseColors.textSecondary, size: 16),
                        const SizedBox(width: 12),
                        Text(lesson, style: AICourseFonts.body(16)),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
