import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/neumorphic.dart';
import '../../core/theme.dart';
import '../../data/portfolio_data.dart';

class SocialSidebar extends StatelessWidget {
  const SocialSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Social Links
          ...PersonalInfo.socialLinks.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: NeumorphicIconButton(
                icon: _getSocialIcon(entry.key),
                onPressed: () => _launchUrl(entry.value),
                size: 56,
                depth: 8.0,
              ),
            );
          }).toList(),

          const Spacer(),

          // Vertical Line
          Container(
            width: 2,
            height: 100,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  IconData _getSocialIcon(String platform) {
    switch (platform.toLowerCase()) {
      case 'linkedin':
        return Icons.work;
      case 'github':
        return Icons.code;
      case 'twitter':
        return Icons.flutter_dash;
      case 'medium':
        return Icons.article;
      default:
        return Icons.link;
    }
  }
}
