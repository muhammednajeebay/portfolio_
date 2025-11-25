import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/repositories/portfolio_repository.dart';
import '../datasources/portfolio_local_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl({required this.localDataSource});

  @override
  Future<List<Project>> getProjects() async {
    return await localDataSource.getProjects();
  }

  @override
  Future<List<Skill>> getSkills() async {
    return await localDataSource.getSkills();
  }
}
