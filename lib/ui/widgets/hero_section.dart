import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../core/url_service.dart';
import '../../core/neumorphic.dart';
import '../../core/theme.dart';
import '../../data/portfolio_data.dart';

class HeroSection extends StatelessWidget {
  final AnimationController fadeController;
  final AnimationController slideController;

  const HeroSection({
    super.key,
    required this.fadeController,
    required this.slideController,
  });

  @override
  Widget build(BuildContext context) {
    final isWide = MediaQuery.of(context).size.width > 1200;
    final isTablet = MediaQuery.of(context).size.width > 700;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(
        horizontal: isWide
            ? 80
            : isTablet
            ? 40
            : 24,
        vertical: isTablet ? 80 : 40,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Avatar and Name
          AnimatedBuilder(
            animation: fadeController,
            builder: (context, child) => Opacity(
              opacity: fadeController.value,
              child: Transform.translate(
                offset: Offset(0, 50 * (1 - fadeController.value)),
                child: child,
              ),
            ),
            child: Column(
              children: [
                // Avatar
                NeumorphicBox(
                  depth: 12.0,
                  borderRadius: 100,
                  padding: const EdgeInsets.all(8),
                  child: CircleAvatar(
                    radius: isWide
                        ? 80
                        : isTablet
                        ? 60
                        : 50,
                    backgroundImage: const AssetImage(PersonalInfo.avatarUrl),
                  ),
                ),
                const SizedBox(height: 32),

                // Name
                Text(
                  PersonalInfo.name,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: isWide
                        ? 56
                        : isTablet
                        ? 48
                        : 36,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                    // background: Paint()
                    //   ..shader =
                    //       const LinearGradient(
                    //         colors: [
                    //           AppTheme.primaryColor,
                    //           AppTheme.secondaryColor,
                    //         ],
                    //       ).createShader(
                    //         const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                    //       ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Animated Title
          AnimatedBuilder(
            animation: slideController,
            builder: (context, child) => Opacity(
              opacity: slideController.value,
              child: Transform.translate(
                offset: Offset(0, 30 * (1 - slideController.value)),
                child: child,
              ),
            ),
            child: Column(
              children: [
                Text(
                  PersonalInfo.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: isWide
                        ? 32
                        : isTablet
                        ? 28
                        : 24,
                    color: AppTheme.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Animated typing text
                SizedBox(
                  height: 100,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        PersonalInfo.subtitle,
                        textStyle: Theme.of(context).textTheme.bodyLarge
                            ?.copyWith(
                              fontSize: isWide
                                  ? 20
                                  : isTablet
                                  ? 18
                                  : 16,
                              color: AppTheme.textSecondary,
                            ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    totalRepeatCount: 1,
                    displayFullTextOnTap: true,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 48),

          // Action Buttons
          AnimatedBuilder(
            animation: slideController,
            builder: (context, child) => Opacity(
              opacity: slideController.value,
              child: Transform.translate(
                offset: Offset(0, 40 * (1 - slideController.value)),
                child: child,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NeumorphicButton(
                  onPressed: () => _launchCV(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.download, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Download CV',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 24),
                NeumorphicButton(
                  onPressed: () => _scrollToContact(),
                  // color: AppTheme.secondaryColor,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.email, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        'Get In Touch',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 64),

          // Scroll Indicator
          AnimatedBuilder(
            animation: fadeController,
            builder: (context, child) =>
                Opacity(opacity: fadeController.value * 0.7, child: child),
            child: Column(
              children: [
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: AppTheme.textTertiary,
                  size: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  'Scroll to explore',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _launchCV() async {

    const url = 'https://drive.google.com/file/d/1LIfN8TzdEeVrAHpeJ6yyUJ02i3Vv7Nz_/view?usp=sharing';
    if (await URLService.canLaunchUrl(Uri.parse(url))) {
      await URLService.launchUrl(Uri.parse(url));
    }
  }

  void _scrollToContact() {
    // TODO: Implement scroll to contact section
  }
}
