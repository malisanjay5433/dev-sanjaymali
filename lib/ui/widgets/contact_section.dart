import 'package:flutter/material.dart';
import '../../core/url_service.dart';
import '../../core/neumorphic.dart';
import '../../core/theme.dart';
import '../../data/portfolio_data.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

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
              //   '05',
              //   style: Theme.of(context).textTheme.displaySmall?.copyWith(
              //     color: AppTheme.primaryColor,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // const SizedBox(width: 16),
              Text(
                'Get In Touch',
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
                Expanded(flex: 1, child: _buildContactInfo(context)),
                const SizedBox(width: 64),
                Expanded(flex: 1, child: _buildContactForm(context)),
              ],
            ),
          ] else ...[
            // Mobile/Tablet Layout
            _buildContactInfo(context),
            const SizedBox(height: 48),
            _buildContactForm(context),
          ],
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Let\'s work together!',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your visions.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),

        // Contact Methods
        _buildContactMethod(
          context,
          Icons.email,
          'Email',
          PersonalInfo.email,
          () => _launchEmail(PersonalInfo.email),
        ),
        const SizedBox(height: 16),
        _buildContactMethod(
          context,
          Icons.location_on,
          'Location',
          PersonalInfo.location,
          null,
        ),
        const SizedBox(height: 32),

        // Social Links
        Text(
          'Follow me on',
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Row(
          children: PersonalInfo.socialLinks.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(right: 16),
              child: NeumorphicIconButton(
                icon: _getSocialIcon(entry.key),
                onPressed: () => _launchUrl(entry.value),
                size: 48,
                depth: 6.0,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildContactMethod(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    VoidCallback? onTap,
  ) {
    return NeumorphicButton(
      onPressed: onTap,
      depth: 6.0,
      borderRadius: 12,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: AppTheme.textTertiary,
                  ),
                ),
                Text(
                  value,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          if (onTap != null)
            const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.textTertiary,
              size: 16,
            ),
        ],
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    return NeumorphicBox(
      depth: 8.0,
      borderRadius: 24,
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send me a message',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Name Field
            _buildTextField(
              controller: _nameController,
              label: 'Name',
              icon: Icons.person,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Email Field
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              icon: Icons.email,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                ).hasMatch(value)) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Message Field
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              icon: Icons.message,
              maxLines: 4,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: NeumorphicButton(
                onPressed: _submitForm,
                depth: 6.0,
                borderRadius: 12,
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.send, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Send Message',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.textTertiary.withOpacity(0.3)),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: maxLines,
            validator: validator,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppTheme.textPrimary),
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: AppTheme.textTertiary),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.all(16),
              hintText: 'Enter your $label',
              hintStyle: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: AppTheme.textTertiary),
            ),
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Get form data
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();
      final message = _messageController.text.trim();
      
      // Create email content
      final subject = 'Portfolio Contact: Message from $name';
      final body = '''
Hello Sanjay,

You have received a new message from your portfolio website:

Name: $name
Email: $email
Message: $message

Best regards,
Portfolio Contact Form
''';
      
      // Create mailto URI
      final mailtoUri = Uri.parse(
        'mailto:malisanjay5433@gmail.com?subject=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}'
      );
      
      // Launch email client
      _launchEmail(mailtoUri.toString());
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Thank you for your message! Opening email client...',
          ),
          backgroundColor: AppTheme.primaryColor,
        ),
      );

      // Clear form
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  void _launchEmail(String email) async {
    final uri = Uri.parse(email.startsWith('mailto:') ? email : 'mailto:$email');
    if (await URLService.canLaunchUrl(uri)) {
      await URLService.launchUrl(uri);
    }
  }

  void _launchUrl(String url) async {
    if (await URLService.canLaunchUrl(Uri.parse(url))) {
      await URLService.launchUrl(Uri.parse(url));
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
