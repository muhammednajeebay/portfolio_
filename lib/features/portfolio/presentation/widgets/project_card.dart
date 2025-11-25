import 'package:flutter/material.dart';
import 'tech_icon.dart';

class ProjectCard extends StatelessWidget {
  final String title, desc, imageUrl, github;
  final List<String> tech;
  const ProjectCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.imageUrl,
      required this.tech,
      required this.github});
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary.withValues(alpha: 0.13);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
      elevation: 7,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.network(imageUrl,
                  height: 185,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                      height: 185,
                      color: color,
                      child: const Center(child: Icon(Icons.image, size: 35)))),
            ),
            const SizedBox(height: 16),
            Text(title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(height: 7),
            Text(desc, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            Wrap(
              spacing: 9,
              children: tech
                  .map((t) => Chip(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withValues(alpha: .2),
                        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TechIcon(t),
                            const SizedBox(width: 4),
                            Text(t,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Open GitHub link
                  },
                  icon: const Icon(Icons.code, size: 19, color: Colors.white),
                  label: const Text("GitHub",
                      style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
