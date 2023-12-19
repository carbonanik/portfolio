class Project {
  final String name;
  final String description;
  final String? imagePath;
  final List<ProjectLink> links;

  Project({
    required this.name,
    required this.description,
    this.imagePath,
    required this.links,
  });
}

class ProjectLink {
  final String name;
  final String link;

  ProjectLink({
    required this.name,
    required this.link,
  });
}