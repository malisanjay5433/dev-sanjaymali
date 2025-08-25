import 'package:flutter/material.dart';
import '../../core/neumorphic.dart';
import '../../core/theme.dart';
import '../../data/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
        vertical: isTablet ? 70 : 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              // Text(
              //   '01',
              //   style: Theme.of(context).textTheme.displaySmall?.copyWith(
              //     color: AppTheme.primaryColor,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(width: 16),
              Text(
                'About Me',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),

          const SizedBox(height: 48),

          // Content
          if (isWide) ...[
            // Desktop Layout
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: _buildAboutContent(context)),
                const SizedBox(width: 64),
                Expanded(flex: 1, child: _buildStats(context)),
              ],
            ),
          ] else ...[
            // Mobile/Tablet Layout
            _buildAboutContent(context),
            const SizedBox(height: 48),
            _buildStats(context),
          ],
        ],
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context) {
    return NeumorphicBox(
      depth: 8.0,
      borderRadius: 24,
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            PersonalInfo.about,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
          ),
          const SizedBox(height: 32),

          // // Quick Info
          // Wrap(
          //   spacing: 32,
          //   runSpacing: 16,
          //   children: [
          //     _buildInfoItem(
          //       context,
          //       Icons.location_on,
          //       'Location',
          //       PersonalInfo.location,
          //     ),
          //     _buildInfoItem(context, Icons.email, 'Email', PersonalInfo.email),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, color: AppTheme.primaryColor, size: 20),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.labelMedium?.copyWith(color: AppTheme.textTertiary),
            ),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStats(BuildContext context) {
    return Column(
      children: [
        _buildStatCard(context, '11', ' Years Experience', Icons.work),
        const SizedBox(height: 16),
        _buildStatCard(context, '25+', ' Projects Completed', Icons.code),
        const SizedBox(height: 16),
        _buildStatCard(
          context,
          '',
          ' Fintech, Insurancetech, Blockchain, Banking',
          Icons.domain,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String number,
    String label,
    IconData icon,
  ) {
    return NeumorphicBox(
      depth: 6.0,
      borderRadius: 16,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 32),
          const SizedBox(height: 12),
          Text(
            number,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondary),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
