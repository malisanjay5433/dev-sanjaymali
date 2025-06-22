import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../core/theme.dart';
import '../data/portfolio_data.dart';
import '../ui/widgets/hero_section.dart';
import '../ui/widgets/about_section.dart';
import '../ui/widgets/skills_section.dart';
import '../ui/widgets/contact_section.dart';
import '../ui/widgets/social_sidebar.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _fadeController;
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Start animations
    _fadeController.forward();
    Future.delayed(const Duration(milliseconds: 300), () {
      _slideController.forward();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 1200;
    final isTablet = MediaQuery.of(context).size.width > 700;

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Row(
        children: [
          // Social Sidebar (Desktop only)
          if (isWide) ...[const SocialSidebar(), const SizedBox(width: 32)],
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Hero Section
                  HeroSection(
                    fadeController: _fadeController,
                    slideController: _slideController,
                  ),

                  // About Section
                  AboutSection()
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .slideY(begin: 0.3),

                  // Skills Section
                  SkillsSection(skillCategories: skillCategories)
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 200.ms)
                      .slideY(begin: 0.3),

                  //TODO: uncomment when Experience and Projects sections are ready
                  // Experience Section
                  // ExperienceSection(experiences: experiences)
                  //     .animate()
                  //     .fadeIn(duration: 600.ms, delay: 400.ms)
                  //     .slideY(begin: 0.3),

                  // Projects Section
                  // ProjectsSection(projectCategories: projectCategories)
                  //     .animate()
                  //     .fadeIn(duration: 600.ms, delay: 600.ms)
                  //     .slideY(begin: 0.3),

                  // Contact Section
                  ContactSection()
                      .animate()
                      .fadeIn(duration: 600.ms, delay: 800.ms)
                      .slideY(begin: 0.3),

                  // Footer
                  _buildFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        children: [
          const Divider(color: AppTheme.textTertiary, height: 1),
          const SizedBox(height: 24),
          Text(
            '© 2025 ${PersonalInfo.name}. All rights reserved.',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Built with Flutter & ❤️',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).animate().fadeIn(duration: 600.ms, delay: 1000.ms);
  }
}
