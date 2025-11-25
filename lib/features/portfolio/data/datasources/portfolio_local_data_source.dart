import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/project_model.dart';
import '../models/skill_model.dart';

abstract class PortfolioLocalDataSource {
  Future<List<ProjectModel>> getProjects();
  Future<List<SkillModel>> getSkills();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    // Simulating a delay if needed, but for local data it's instant
    return const [
      ProjectModel(
        imageUrl:
            'https://repository-images.githubusercontent.com/479239619/c718eeb7-4ec6-4816-86ad-a6f7733f66d7',
        title: 'Job Posting Portal',
        description:
            'Job platform for student and parents with real-time job posting and applications.',
        technologies: ['Flutter', 'Provider', 'REST'],
        githubUrl: 'https://github.com/muhammednajeebay/jobportal',
      ),
      ProjectModel(
        imageUrl:
            'https://repository-images.githubusercontent.com/236710041/1b0dfd00-0c69-11eb-826d-d4543825a7ea',
        title: 'News Aggregator',
        description:
            'News app with live data from NewsAPI, clean UI and state with Provider.',
        technologies: ['Flutter', 'Provider', 'REST'],
        githubUrl: 'https://github.com/muhammednajeebay/news-app',
      ),
      ProjectModel(
        imageUrl:
            'https://repository-images.githubusercontent.com/385889541/83e8c980-0715-11eb-96eb-adcd24bec505',
        title: 'Recipe Recommendation',
        description:
            'Collaboration app with ML backend, user-uploaded recipes, and live recommendations.',
        technologies: ['Flutter', 'Http', 'Python'],
        githubUrl: 'https://github.com/muhammednajeebay/recipe_app',
      ),
      ProjectModel(
        imageUrl:
            'https://repository-images.githubusercontent.com/458759867/a066389d-0de3-4e60-b3ac-401be1409509',
        title: 'Mobile Banking Demo',
        description:
            'UI/UX for mobile banking with transaction and transfer simulation.',
        technologies: ['Flutter', 'Provider', 'REST'],
        githubUrl: 'https://github.com/muhammednajeebay/bank-app',
      ),
    ];
  }

  @override
  Future<List<SkillModel>> getSkills() async {
    return const [
      SkillModel(
          icon: FontAwesomeIcons.mobileScreenButton, name: 'Flutter & Dart'),
      SkillModel(
          icon: FontAwesomeIcons.codeBranch, name: 'BLoC, Provider, GetX'),
      SkillModel(icon: FontAwesomeIcons.globe, name: 'GraphQL, REST API'),
      SkillModel(icon: FontAwesomeIcons.fire, name: 'Firebase'),
      SkillModel(icon: FontAwesomeIcons.code, name: 'Clean Code'),
      SkillModel(icon: FontAwesomeIcons.gitAlt, name: 'Git, GitHub'),
      SkillModel(icon: FontAwesomeIcons.gears, name: 'CI/CD, Testing'),
      SkillModel(
          icon: FontAwesomeIcons.laptopCode, name: 'Android Studio, VS Code'),
    ];
  }
}
