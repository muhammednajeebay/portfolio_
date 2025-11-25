import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      alignment: Alignment.center,
      children: [
        // Gradient background
        Positioned.fill(
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colorScheme.primary.withValues(alpha: .15),
                    colorScheme.secondary.withValues(alpha: .09),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ),
        LayoutBuilder(builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 650;
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Avatar
              Animate(
                effects: const [
                  FadeEffect(),
                  ScaleEffect(
                      begin: Offset(0.7, 0.7),
                      duration: Duration(milliseconds: 700))
                ],
                child: CircleAvatar(
                  radius: isMobile ? 55 : 85,
                  backgroundImage: const NetworkImage(
                    'https://avatars.githubusercontent.com/u/10593757?v=4', // Replace with your image URL!
                  ),
                  backgroundColor: colorScheme.primary.withValues(alpha: .2),
                ),
              ),
              if (!isMobile) const SizedBox(width: 48),
              Expanded(
                child: Column(
                  crossAxisAlignment: isMobile
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Animate(
                      effects: [
                        FadeEffect(duration: 400.ms, delay: 200.ms),
                        MoveEffect(
                            begin: const Offset(0, 26),
                            duration: 550.ms,
                            curve: Curves.easeOutQuart)
                      ],
                      child: Text(
                        "Hi, I'm Muhammed Najeeb AY",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(fontSize: isMobile ? 32 : 40),
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Animate(
                      effects: [
                        FadeEffect(duration: 450.ms, delay: 300.ms),
                        MoveEffect(
                            begin: const Offset(0, 16), duration: 400.ms),
                      ],
                      child: RichText(
                        textAlign: isMobile ? TextAlign.center : TextAlign.left,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.bodyMedium,
                          children: const [
                            TextSpan(text: "Flutter "),
                            TextSpan(
                                text: "Developer",
                                style: TextStyle(
                                    color: Color(0xFF4A90E2),
                                    fontWeight: FontWeight.bold)),
                            TextSpan(text: "  •  "),
                            TextSpan(text: "BLoC, GetX, Provider "),
                            TextSpan(
                                text: "• ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: "Clean Architecture",
                                style: TextStyle(
                                    color: Color(0xFF27AE60),
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 22),
                    Animate(
                      effects: const [FadeEffect(), ScaleEffect()],
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.download_rounded,
                            color: Colors.white),
                        label: const Text("Download CV",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          // TODO: Implement CV download link
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
