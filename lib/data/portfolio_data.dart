import '../models/skill.dart';
import '../models/project.dart';

// Personal Information
class PersonalInfo {
  static const String name = 'Sanjay Mali';
  static const String title =
      'Mobile Architect | iOS & Flutter Specialist | AI Enthusiast';
  static const String subtitle =
      'Building beautiful, responsive apps using Native iOS and Flutter for mobile and web for domains like Fintech, Insurance, Blockchain, Banking and more.';
  static const String avatarUrl = 'images/avatar.jpeg';
  static const String email = 'malisanjay5433@gmail.com';
  static const String location = 'Mumbai, India';
  static const String about = '''
👋 Hi, I'm Sanjay Mali — a passionate developer crafting beautiful, scalable apps for iOS, Android, Flutter, and Web. If it runs code, I'll probably build something for it.\n
With over 11+ years of experience in developing high-quality mobile applications, I specialize in creating intuitive user experiences and leveraging AI to enhance app functionality.
\nWhen I'm not debugging or deploying, you'll likely find me:
🎮 dominating on the PlayStation
🏏 chasing boundaries on the cricket field
👨‍👩‍👧‍👦 proudly serving my most important roles, full-time husband and father to my beautiful daughter.

Let's build, break, and ship great things together (preferably in that order)!
''';

  static const Map<String, String> socialLinks = {
    'LinkedIn': 'https://www.linkedin.com/in/sanjaymali10/',
    'GitHub': 'https://github.com/malisanjay5433',
    'Twitter': 'https://x.com/_connectsanjay',
    'Medium': 'https://medium.com/@sanjaymali',
  };
}

// Skills Data
final List<SkillCategory> skillCategories = [
  SkillCategory(
    name: 'Mobile Development',
    icon: '📱',
    skills: [
      Skill(name: 'iOS', category: 'Mobile', proficiency: 0.95, icon: '🍎'),
      Skill(name: 'Flutter', category: 'Mobile', proficiency: 0.80, icon: '🍎'),
      Skill(
        name: 'React Native',
        category: 'Mobile',
        proficiency: 0.70,
        icon: '🤖',
      ),
      Skill(name: 'Android', category: 'Mobile', proficiency: 0.65, icon: '🤖'),
    ],
  ),
  SkillCategory(
    name: 'Architecture & Patterns',
    icon: '🏗️',
    skills: [
      Skill(
        name: 'Clean Architecture',
        category: 'Architecture',
        proficiency: 0.90,
        icon: '🧹',
      ),
      Skill(
        name: 'MVVM',
        category: 'Architecture',
        proficiency: 0.90,
        icon: '📊',
      ),
      Skill(
        name: 'MVC',
        category: 'Architecture',
        proficiency: 0.95,
        icon: '📋',
      ),
      Skill(
        name: 'VIPER',
        category: 'Architecture',
        proficiency: 0.75,
        icon: '🐍',
      ),
      Skill(
        name: 'TCA',
        category: 'Architecture',
        proficiency: 0.80,
        icon: '🔄',
      ),
      Skill(
        name: 'Modular Architecture',
        category: 'Architecture',
        proficiency: 0.85,
        icon: '🧩',
      ),
    ],
  ),
  SkillCategory(
    name: 'Development Tools',
    icon: '🛠️',
    skills: [
      Skill(name: 'Xcode', category: 'Tools', proficiency: 0.95, icon: '💻'),
      Skill(name: 'Git', category: 'Tools', proficiency: 0.90, icon: '📝'),
      Skill(name: 'VSCode', category: 'Tools', proficiency: 0.85, icon: '💻'),
      Skill(name: 'XCTest', category: 'Testing', proficiency: 0.80, icon: '✅'),
      Skill(name: 'Appium', category: 'Testing', proficiency: 0.70, icon: '🤖'),
    ],
  ),
  SkillCategory(
    name: 'LLM & AI',
    icon: '🧪',
    skills: [
      Skill(name: 'ChatGPT', category: 'AI', proficiency: 0.80, icon: '✅'),
      Skill(name: 'Claude AI', category: 'AI', proficiency: 0.70, icon: '🤖'),
      Skill(name: 'Cursor AI', category: 'AI', proficiency: 0.85, icon: '🧪'),
      Skill(
        name: 'GitHub Copilot',
        category: 'AI',
        proficiency: 0.75,
        icon: '🎨',
      ),
    ],
  ),
];

// Projects Data
final List<ProjectCategory> projectCategories = [
  ProjectCategory(
    name: 'Featured Projects',
    icon: '⭐',
    projects: [
      Project(
        title: 'Fintech Mobile App',
        description:
            'A comprehensive financial technology application with real-time trading, portfolio management, and AI-powered investment recommendations.',
        imageUrl: 'images/avatar.jpeg',
        liveUrl: 'https://github.com/malisanjay5433/fintech-app',
        githubUrl: 'https://github.com/sanjaymali/fintech-app',
        technologies: [
          'Flutter',
          'Dart',
          'Firebase',
          'TensorFlow Lite',
          'Stripe',
        ],
        features: [
          'Real-time market data integration',
          'AI-powered investment recommendations',
          'Secure biometric authentication',
          'Portfolio tracking and analytics',
          'Push notifications for market alerts',
        ],
        category: 'Fintech',
        isFeatured: true,
      ),
      Project(
        title: 'Insurance Tech Platform',
        description:
            'Modern insurance platform with automated claims processing, policy management, and customer portal.',
        imageUrl: 'images/avatar.jpeg',
        liveUrl: 'https://github.com/malisanjay5433/insurance-platform',
        githubUrl: 'https://github.com/sanjaymali/insurance-platform',
        technologies: [
          'Swift',
          'SwiftUI',
          'Core Data',
          'AWS',
          'Machine Learning',
        ],
        features: [
          'Automated claims processing with AI',
          'Real-time policy management',
          'Customer self-service portal',
          'Document scanning and OCR',
          'Multi-language support',
        ],
        category: 'Insurance',
        isFeatured: true,
      ),
    ],
  ),
  ProjectCategory(
    name: 'Mobile Applications',
    icon: '📱',
    projects: [
      Project(
        title: 'Blockchain Wallet',
        description:
            'Secure cryptocurrency wallet with multi-chain support and DeFi integration.',
        imageUrl: 'images/avatar.jpeg',
        technologies: [
          'Flutter',
          'Dart',
          'Web3',
          'Secure Enclave',
          'Biometrics',
        ],
        features: [
          'Multi-chain cryptocurrency support',
          'Secure key management',
          'DeFi protocol integration',
          'Real-time price tracking',
          'Transaction history and analytics',
        ],
        category: 'Blockchain',
      ),
      Project(
        title: 'Banking App',
        description:
            'Modern banking application with advanced security features and seamless user experience.',
        imageUrl: 'images/avatar.jpeg',
        technologies: [
          'Kotlin',
          'Android',
          'Jetpack Compose',
          'Kotlin Coroutines',
          'Room DB',
        ],
        features: [
          'Secure biometric authentication',
          'Real-time transaction monitoring',
          'Bill payment and transfers',
          'Investment portfolio management',
          'Customer support chatbot',
        ],
        category: 'Banking',
      ),
      Project(
        title: 'Real Estate Platform',
        description:
            'Comprehensive real estate platform with property search, virtual tours, and mortgage calculator.',
        imageUrl: 'images/avatar.jpeg',
        technologies: ['Flutter', 'Dart', 'Google Maps', 'AR Kit', 'Firebase'],
        features: [
          'Advanced property search filters',
          'Virtual property tours with AR',
          'Mortgage calculator and pre-approval',
          'Agent-client communication',
          'Property comparison tools',
        ],
        category: 'Real Estate',
      ),
      Project(
        title: 'Social Media App',
        description:
            'Next-generation social media platform with AI-powered content curation and privacy controls.',
        imageUrl: 'images/avatar.jpeg',
        technologies: [
          'Swift',
          'SwiftUI',
          'Core ML',
          'CloudKit',
          'Push Notifications',
        ],
        features: [
          'AI-powered content recommendations',
          'Advanced privacy controls',
          'Real-time messaging and video calls',
          'Content creation tools',
          'Analytics and insights',
        ],
        category: 'Social Media',
      ),
    ],
  ),
];

// Experience Data
class Experience {
  final String company;
  final String position;
  final String duration;
  final String description;
  final List<String> achievements;

  const Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
    required this.achievements,
  });
}

final List<Experience> experiences = [
  Experience(
    company: 'TechCorp Solutions',
    position: 'Senior Mobile Engineer',
    duration: '2022 - Present',
    description:
        'Leading mobile development initiatives for fintech and insurance applications.',
    achievements: [
      'Led development of 5+ high-impact mobile applications',
      'Implemented Clean Architecture across all projects',
      'Reduced app crash rate by 60% through improved testing',
      'Mentored 3 junior developers',
    ],
  ),
  Experience(
    company: 'InnovateMobile',
    position: 'Mobile App Developer',
    duration: '2020 - 2022',
    description:
        'Developed cross-platform mobile applications using Flutter and native technologies.',
    achievements: [
      'Built 8+ mobile applications for various industries',
      'Achieved 4.8+ star ratings on app stores',
      'Optimized app performance by 40%',
      'Implemented CI/CD pipelines for automated deployment',
    ],
  ),
  Experience(
    company: 'StartupHub',
    position: 'iOS Developer',
    duration: '2018 - 2020',
    description:
        'Specialized in iOS development with focus on user experience and performance.',
    achievements: [
      'Developed 6 iOS applications from concept to launch',
      'Implemented advanced UI animations and transitions',
      'Integrated third-party APIs and services',
      'Maintained 99.9% app store compliance',
    ],
  ),
];
