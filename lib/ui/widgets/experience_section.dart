import 'package:flutter/material.dart';
import '../../core/neumorphic.dart';
import '../../core/theme.dart';
import '../../data/portfolio_data.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 1200;
    final isTablet = MediaQuery.of(context).size.width > 700;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isWide
            ? 80
            : isTablet
            ? 40
            : 24,
        vertical: isTablet ? 80 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              // Text(
              //   '04',
              //   style: Theme.of(context).textTheme.displaySmall?.copyWith(
              //     color: AppTheme.primaryColor,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(width: 16),
              Text(
                'Work Experience',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),

          const SizedBox(height: 48),

          // Experience Timeline
          if (isWide) ...[
            // Desktop Layout - Side by side
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: experiences.asMap().entries.map((entry) {
                      final index = entry.key;
                      final experience = entry.value;
                      return _buildExperienceCard(
                        context,
                        experience,
                        index,
                        isLeft: true,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 64),
                Expanded(
                  child: Column(
                    children: experiences.asMap().entries.map((entry) {
                      final index = entry.key;
                      final experience = entry.value;
                      return _buildExperienceCard(
                        context,
                        experience,
                        index,
                        isLeft: false,
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ] else ...[
            // Mobile/Tablet Layout - Single column
            ...experiences.asMap().entries.map((entry) {
              final index = entry.key;
              final experience = entry.value;
              return _buildExperienceCard(
                context,
                experience,
                index,
                isLeft: true,
              );
            }).toList(),
          ],
        ],
      ),
    );
  }

  Widget _buildExperienceCard(
    BuildContext context,
    Experience experience,
    int index, {
    required bool isLeft,
  }) {
    final isWide = MediaQuery.of(context).size.width > 1200;

    return Container(
      margin: EdgeInsets.only(bottom: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline Dot
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Experience Card
          Expanded(
            child: NeumorphicBox(
              depth: 8.0,
              borderRadius: 20,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experience.position,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.primaryColor,
                                  ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              experience.company,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: AppTheme.primaryColor.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          experience.duration,
                          style: Theme.of(context).textTheme.labelMedium
                              ?.copyWith(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    experience.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Achievements
                  Text(
                    'Key Achievements',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...experience.achievements.map(
                    (achievement) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 6),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              color: AppTheme.secondaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              achievement,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(color: AppTheme.textSecondary),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
