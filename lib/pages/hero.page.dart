// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class HeroLandingPage extends StatelessWidget {
//   const HeroLandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final isWide = MediaQuery.of(context).size.width > 900;
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8F7F4),
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(64),
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: isWide ? 64 : 16),
//           child: Row(
//             children: [
//               Text(
//                 '< /Sanjay Mali>',
//                 style: TextStyle(
//                   color: Colors.orange[700],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 24,
//                   letterSpacing: 1.2,
//                 ),
//               ),
//               const Spacer(),
//               if (isWide) ...[
//                 _NavItem('Home'),
//                 _NavItem('About'),
//                 _NavItem('Projects'),
//                 _NavItem('Articles'),
//                 _NavItem('Contact'),
//                 const SizedBox(width: 24),
//                 Icon(Icons.wb_sunny_outlined, color: Colors.grey[700]),
//                 const SizedBox(width: 16),
//                 Row(
//                   children: [
//                     Icon(Icons.email_outlined, color: Colors.orange[700]),
//                     const SizedBox(width: 4),
//                     Text(
//                       'malisanjay5433@gmail.com',
//                       style: TextStyle(
//                         color: Colors.orange[700],
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ] else
//                 IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
//             ],
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           // Subtle background shape
//           Positioned(
//             left: -100,
//             top: 100,
//             child: Container(
//               width: 300,
//               height: 300,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: RadialGradient(
//                   colors: [Colors.orange.withOpacity(0.12), Colors.transparent],
//                   radius: 0.8,
//                 ),
//               ),
//             ),
//           ),
//           // Subtle bottom wave (placeholder, replace with custom painter or SVG for more detail)
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Opacity(
//               opacity: 0.2,
//               child: Image.asset(
//                 'images/avatar.jpeg', // Use a subtle SVG or PNG wave here
//                 fit: BoxFit.cover,
//                 height: 120,
//               ),
//             ),
//           ),
//           // Main content
//           Center(
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isWide ? 120 : 24,
//                 vertical: isWide ? 80 : 32,
//               ),
//               child: Row(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // Social bar (hide on small screens)
//                   if (isWide)
//                     Padding(
//                       padding: const EdgeInsets.only(right: 48),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           _SocialIcon(
//                             FontAwesomeIcons.github,
//                             'https://github.com/yourprofile',
//                           ),
//                           const SizedBox(height: 16),
//                           _SocialIcon(
//                             FontAwesomeIcons.linkedin,
//                             'https://linkedin.com/in/yourprofile',
//                           ),
//                           const SizedBox(height: 16),
//                           _SocialIcon(
//                             FontAwesomeIcons.twitter,
//                             'https://twitter.com/yourprofile',
//                           ),
//                           const SizedBox(height: 16),
//                           _SocialIcon(
//                             FontAwesomeIcons.instagram,
//                             'https://instagram.com/yourprofile',
//                           ),
//                         ],
//                       ),
//                     ),
//                   // Main hero text and button
//                   Expanded(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: isWide
//                           ? CrossAxisAlignment.start
//                           : CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Sanjay Mali',
//                           style: TextStyle(
//                             color: Colors.grey[700],
//                             fontWeight: FontWeight.w600,
//                             fontSize: isWide ? 18 : 14,
//                             letterSpacing: 2,
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         RichText(
//                           textAlign: isWide ? TextAlign.left : TextAlign.center,
//                           text: TextSpan(
//                             style: TextStyle(
//                               fontSize: isWide ? 56 : 32,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black,
//                               height: 1.1,
//                             ),
//                             children: [
//                               const TextSpan(text: 'Developer '),
//                               TextSpan(
//                                 text: '+',
//                                 style: TextStyle(
//                                   color: Colors.orange[700],
//                                   fontWeight: FontWeight.w900,
//                                   fontSize: isWide ? 60 : 36,
//                                 ),
//                               ),
//                               const TextSpan(text: ' Designer'),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 24),
//                         SizedBox(
//                           width: isWide ? null : double.infinity,
//                           child: OutlinedButton(
//                             style: OutlinedButton.styleFrom(
//                               foregroundColor: Colors.black,
//                               side: BorderSide(color: Colors.grey[700]!),
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 32,
//                                 vertical: 18,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                             onPressed: () {},
//                             child: const Text('Say Hello'),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget _NavItem(String label) => Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 16),
//   child: Text(
//     label,
//     style: const TextStyle(
//       color: Colors.black87,
//       fontWeight: FontWeight.w500,
//       fontSize: 16,
//     ),
//   ),
// );

// class _SocialIcon extends StatelessWidget {
//   final IconData icon;
//   final String url;
//   const _SocialIcon(this.icon, this.url);

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: FaIcon(icon, color: Colors.black87),
//       onPressed: () {
//         // TODO: launch URL
//       },
//       tooltip: url,
//     );
//   }
// }
