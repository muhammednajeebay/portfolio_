import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/skill.dart';
import '../../domain/usecases/get_projects.dart';
import '../../domain/usecases/get_skills.dart';
import '../sections/about_section.dart';
import '../sections/contact_section.dart';
import '../sections/hero_section.dart';
import '../sections/projects_section.dart';
import '../sections/skills_section.dart';
import '../widgets/animated_navbar.dart';
import '../widgets/section_container.dart';
import '../widgets/section_divider.dart';

class HomePage extends StatefulWidget {
  final GetProjects getProjects;
  final GetSkills getSkills;

  const HomePage({
    super.key,
    required this.getProjects,
    required this.getSkills,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _sc = ScrollController();
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final skillsKey = GlobalKey();
  final contactKey = GlobalKey();

  List<Project> _projects = [];
  List<Skill> _skills = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final projects = await widget.getProjects();
    final skills = await widget.getSkills();
    setState(() {
      _projects = projects;
      _skills = skills;
    });
  }

  void scrollTo(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutQuart,
    );
    final name = {
      homeKey: 'home',
      aboutKey: 'about',
      projectsKey: 'projects',
      skillsKey: 'skills',
      contactKey: 'contact',
    }[key];
    if (name != null) GoRouter.of(context).go('/#$name');
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: AnimatedNavbar(
          onTap: (label) {
            switch (label) {
              case 'Home':
                scrollTo(homeKey);
                break;
              case 'About':
                scrollTo(aboutKey);
                break;
              case 'Projects':
                scrollTo(projectsKey);
                break;
              case 'Skills':
                scrollTo(skillsKey);
                break;
              case 'Contact':
                scrollTo(contactKey);
                break;
            }
          },
          isMobile: isMobile,
        ),
      ),
      drawer: isMobile
          ? Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: .8),
                          Theme.of(context)
                              .colorScheme
                              .secondary
                              .withValues(alpha: .8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text("Najeeb AY",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.white))),
                  ),
                  ...['Home', 'About', 'Projects', 'Skills', 'Contact']
                      .map((l) {
                    return ListTile(
                        title: Text(l),
                        onTap: () {
                          Navigator.of(context).pop();
                          scrollTo({
                            'Home': homeKey,
                            'About': aboutKey,
                            'Projects': projectsKey,
                            'Skills': skillsKey,
                            'Contact': contactKey,
                          }[l]!);
                        });
                  }),
                ],
              ),
            )
          : null,
      body: SingleChildScrollView(
        controller: _sc,
        child: Column(
          children: [
            SectionContainer(
              key: homeKey,
              spacerBelow: false,
              child: const HeroSection(),
            ),
            const SectionDivider(curveType: CurveType.bottom),
            SectionContainer(key: aboutKey, child: const AboutSection()),
            const SectionDivider(curveType: CurveType.top),
            SectionContainer(
                key: projectsKey, child: ProjectsSection(projects: _projects)),
            const SectionDivider(curveType: CurveType.bottom),
            SectionContainer(
                key: skillsKey, child: SkillsSection(skills: _skills)),
            const SectionDivider(curveType: CurveType.top),
            SectionContainer(key: contactKey, child: const ContactSection()),
          ],
        ),
      ),
    );
  }
}
