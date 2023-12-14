import 'package:portfolio/features/projects/models/project.dart';

class ProjectCategory {
  final String name;
  final List<Project> projects;

  ProjectCategory({
    required this.name,
    required this.projects,
  });
}