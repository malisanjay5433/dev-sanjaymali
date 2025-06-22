import 'package:flutter/material.dart';
import 'theme.dart';

class NeumorphicBox extends StatelessWidget {
  final Widget child;
  final double depth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool isPressed;

  const NeumorphicBox({
    super.key,
    required this.child,
    this.depth = 8.0,
    this.borderRadius = 16.0,
    this.padding,
    this.margin,
    this.color,
    this.isPressed = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? AppTheme.surfaceColor;
    final lightShadow = AppTheme.lightShadow;
    final darkShadow = AppTheme.darkShadow;

    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: isPressed
            ? [
                BoxShadow(
                  color: darkShadow,
                  offset: const Offset(2, 2),
                  blurRadius: depth,
                ),
                BoxShadow(
                  color: lightShadow,
                  offset: const Offset(-2, -2),
                  blurRadius: depth,
                ),
              ]
            : [
                BoxShadow(
                  color: darkShadow,
                  offset: const Offset(4, 4),
                  blurRadius: depth,
                ),
                BoxShadow(
                  color: lightShadow,
                  offset: const Offset(-4, -4),
                  blurRadius: depth,
                ),
              ],
      ),
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

class NeumorphicButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double depth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool isEnabled;

  const NeumorphicButton({
    super.key,
    required this.child,
    this.onPressed,
    this.depth = 8.0,
    this.borderRadius = 12.0,
    this.padding,
    this.color,
    this.isEnabled = true,
  });

  @override
  State<NeumorphicButton> createState() => _NeumorphicButtonState();
}

class _NeumorphicButtonState extends State<NeumorphicButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isEnabled && widget.onPressed != null) {
      setState(() => _isPressed = true);
      _controller.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isEnabled && widget.onPressed != null) {
      setState(() => _isPressed = false);
      _controller.reverse();
      widget.onPressed!();
    }
  }

  void _onTapCancel() {
    if (widget.isEnabled) {
      setState(() => _isPressed = false);
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) => Transform.scale(
          scale: _scaleAnimation.value,
          child: NeumorphicBox(
            depth: widget.depth,
            borderRadius: widget.borderRadius,
            padding: widget.padding,
            color: widget.color,
            isPressed: _isPressed,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class NeumorphicCard extends StatelessWidget {
  final Widget child;
  final double depth;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final VoidCallback? onTap;

  const NeumorphicCard({
    super.key,
    required this.child,
    this.depth = 6.0,
    this.borderRadius = 20.0,
    this.padding,
    this.margin,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = NeumorphicBox(
      depth: depth,
      borderRadius: borderRadius,
      padding: padding,
      margin: margin,
      color: color,
      child: child,
    );

    if (onTap != null) {
      return NeumorphicButton(
        onPressed: onTap,
        depth: depth,
        borderRadius: borderRadius,
        padding: EdgeInsets.zero,
        color: color,
        child: child,
      );
    }

    return card;
  }
}

class NeumorphicIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final double size;
  final double depth;
  final Color? iconColor;
  final Color? backgroundColor;

  const NeumorphicIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.size = 56.0,
    this.depth = 6.0,
    this.iconColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      depth: depth,
      borderRadius: size / 2,
      padding: EdgeInsets.zero,
      color: backgroundColor,
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          icon,
          color: iconColor ?? AppTheme.textPrimary,
          size: size * 0.4,
        ),
      ),
    );
  }
}

class NeumorphicProgressBar extends StatelessWidget {
  final double value;
  final double height;
  final Color? backgroundColor;
  final Color? progressColor;
  final double borderRadius;

  const NeumorphicProgressBar({
    super.key,
    required this.value,
    this.height = 8.0,
    this.backgroundColor,
    this.progressColor,
    this.borderRadius = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicBox(
      depth: 4.0,
      borderRadius: borderRadius,
      padding: EdgeInsets.zero,
      color: backgroundColor ?? AppTheme.surfaceColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: LinearProgressIndicator(
          value: value.clamp(0.0, 1.0),
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(
            progressColor ?? AppTheme.primaryColor,
          ),
          minHeight: height,
        ),
      ),
    );
  }
}
