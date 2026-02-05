import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color red = Color(0xFFD32F2F); // Lasta Red
  static const Color black = Color(0xFF1A1A1A); // Deep charcoal
  static const Color lightYellow = Color(0xFFFFD54F); // LED display yellow
  static const Color lightGrey = Color(0xFFF5F5F5); // Interior bus grey
  static const Color darkBlue = Color(0xFF1976D2); // Contrast blue

  // Gradients
  static const Gradient standardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFFD32F2F),
      Color(0xFFB71C1C), // Slightly darker red
    ],
  );

  static final Gradient animatedBackgroundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.red.shade400,
      Colors.white,
    ],
  );
}

class AnimatedBusBackground extends StatefulWidget {
  final Widget? child;
  final Duration duration;
  const AnimatedBusBackground({
    Key? key,
    this.child,
    this.duration = const Duration(seconds: 4),
  }) : super(key: key);

  @override
  State<AnimatedBusBackground> createState() => _AnimatedBusBackgroundState();
}

class _AnimatedBusBackgroundState extends State<AnimatedBusBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _alignmentAnimation =
        AlignmentTween(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _alignmentAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: _alignmentAnimation.value,
              end: Alignment.center,
              colors: [
                Colors.red.shade400,
                Colors.white,
              ],
            ),
          ),
          child: widget.child,
        );
      },
      child: widget.child,
    );
  }
}

class AppFonts {
  // Preporuka: "Roboto" je odličan za chat aplikacije, moderan i čitljiv.
  static TextStyle chatText(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle title(BuildContext context) => GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle subtitle(BuildContext context) => GoogleFonts.roboto(
    fontSize: 18,
    color: Theme.of(context).colorScheme.onBackground,
  );

  static TextStyle button(BuildContext context) => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Theme.of(context).colorScheme.onPrimary,
  );
}
