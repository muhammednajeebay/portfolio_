import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/entities/skill.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;
  const SkillsSection({super.key, required this.skills});
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect(), MoveEffect(begin: Offset(0, 28))],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skills",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 24),
          Wrap(
            spacing: 18,
            runSpacing: 10,
            children: skills
                .map((s) => Chip(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      labelPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 2),
                      avatar: Icon(
                        s.icon,
                        color: Theme.of(context).colorScheme.primary,
                        size: 16,
                      ),
                      label: Text(
                        s.name,
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withValues(alpha: .1),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
