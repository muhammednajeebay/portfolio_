import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/entities/project.dart';
import '../widgets/project_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;
  const ProjectsSection({super.key, required this.projects});
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        FadeEffect(duration: 500.ms),
        MoveEffect(duration: 500.ms, begin: const Offset(0, 38))
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Projects",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary)),
          const SizedBox(height: 24),
          LayoutBuilder(builder: (context, c) {
            final isMobile = c.maxWidth < 700;
            return Wrap(
              spacing: 24,
              runSpacing: 22,
              children: projects
                  .map((proj) => SizedBox(
                        width: isMobile ? c.maxWidth : c.maxWidth * .43,
                        child: ProjectCard(
                          title: proj.title,
                          desc: proj.description,
                          imageUrl: proj.imageUrl,
                          tech: proj.technologies,
                          github: proj.githubUrl,
                        ),
                      ))
                  .toList(),
            );
          }),
        ],
      ),
    );
  }
}
