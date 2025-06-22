import 'package:flutter/material.dart';
import '../../core/neumorphic.dart';
import '../../core/theme.dart';
import '../../models/skill.dart';

class SkillsSection extends StatelessWidget {
  final List<SkillCategory> skillCategories;

  const SkillsSection({super.key, required this.skillCategories});

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
        vertical: isTablet ? 70 : 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              // Text(
              //   '02',
              //   style: Theme.of(context).textTheme.displaySmall?.copyWith(
              //     color: AppTheme.primaryColor,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(width: 16),
              Text(
                'Skills & Expertise',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Skills Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isWide ? 2 : 1,
              crossAxisSpacing: 32,
              mainAxisSpacing: 32,
              childAspectRatio: isWide ? 1.5 : 1.2,
            ),
            itemCount: skillCategories.length,
            itemBuilder: (context, index) {
              return _buildSkillCategory(context, skillCategories[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(BuildContext context, SkillCategory category) {
    return NeumorphicBox(
      depth: 8.0,
      borderRadius: 24,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Header
          Row(
            children: [
              Text(category.icon, style: const TextStyle(fontSize: 32)),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  category.name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Skills List
          Expanded(
            child: ListView.separated(
              itemCount: category.skills.length,
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildSkillItem(context, category.skills[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillItem(BuildContext context, Skill skill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(skill.icon, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                skill.name,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              '${(skill.proficiency * 100).toInt()}%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        NeumorphicProgressBar(
          value: skill.proficiency,
          height: 6,
          borderRadius: 3,
        ),
      ],
    );
  }
}
