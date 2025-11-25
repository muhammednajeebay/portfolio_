import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/portfolio/data/datasources/portfolio_local_data_source.dart';
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'features/portfolio/domain/usecases/get_projects.dart';
import 'features/portfolio/domain/usecases/get_skills.dart';
import 'features/portfolio/presentation/pages/home_page.dart';

void main() {
  runApp(const AppEntry());
}

class AppEntry extends StatelessWidget {
  const AppEntry({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection (Simple Manual DI for now)
    final dataSource = PortfolioLocalDataSourceImpl();
    final repository = PortfolioRepositoryImpl(localDataSource: dataSource);
    final getProjects = GetProjects(repository);
    final getSkills = GetSkills(repository);

    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomePage(
            getProjects: getProjects,
            getSkills: getSkills,
          ),
        ),
      ],
    );
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Portfolio',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: themeMode,
            routerConfig: router,
          );
        },
      ),
    );
  }
}
