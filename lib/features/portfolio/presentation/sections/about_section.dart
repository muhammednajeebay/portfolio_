import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(duration: 500.ms),
        MoveEffect(duration: 500.ms, begin: const Offset(0, 32))
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About Me",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 38,
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/10593757?v=4'),
              ),
              const SizedBox(width: 32),
              Expanded(
                child: Text(
                  '''I'm a passionate Flutter developer with a special love for modern state management and clean, scalable architecture.

- Built 10+ robust mobile apps (BLoC, Provider, GetX, Clean Architecture)
- Comfortable with: REST, GraphQL, Firebase, CI/CD, Testing
- Love to collaborate and stay on top of new UI/UX trends

Let's build delightful experiences together!''',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 19),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
