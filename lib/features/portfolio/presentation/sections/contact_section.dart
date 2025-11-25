import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(), MoveEffect(begin: Offset(0, 24))],
      child: Card(
        elevation: 7,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        shadowColor:
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
        color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 32),
          child: Column(
            children: [
              Text("Contact Me",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary)),
              const SizedBox(height: 16),
              Text(
                "Reach out via email or social channels below!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.email,
                      color: Theme.of(context).colorScheme.primary),
                  const SizedBox(width: 6),
                  SelectableText(
                    'najeebnaju512@gmail.com',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android,
                      color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(width: 6),
                  SelectableText(
                    '+91 99475 99827',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                children: [
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.github),
                    iconSize: 34,
                    color: const Color(0xFF24292F),
                    onPressed: () {
                      // Open your real GitHub link
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.linkedin),
                    iconSize: 34,
                    color: const Color(0xFF0A66C2),
                    onPressed: () {
                      // Open your real LinkedIn
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.telegram),
                    iconSize: 34,
                    color: const Color(0xFF0088CC),
                    onPressed: () {
                      // Open Telegram
                    },
                  ),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.twitter),
                    iconSize: 34,
                    color: const Color(0xFF1DA1F2),
                    onPressed: () {
                      // Open Twitter
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
