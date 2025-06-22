import 'package:dev_portfolio_sanjaymali/core/theme.dart';
import 'package:dev_portfolio_sanjaymali/pages/portfolio_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const SanjayMaliApp());
}

class SanjayMaliApp extends StatelessWidget {
  const SanjayMaliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '< /Sanjay Mali>',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const PortfolioPage(),
    );
  }
}
