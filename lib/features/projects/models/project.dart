class Project {
  final String name;
  final String description;
  final String? imagePath;
  final List<ProjectLink> links;
  final List<String> tags;

  Project({
    required this.name,
    required this.description,
    this.imagePath,
    required this.links,
    required this.tags,
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