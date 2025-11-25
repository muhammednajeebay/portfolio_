import '../entities/project.dart';
import '../entities/skill.dart';

abstract class PortfolioRepository {
  Future<List<Project>> getProjects();
  Future<List<Skill>> getSkills();
}
