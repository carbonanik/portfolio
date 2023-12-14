class Project {
  final String name;
  final String description;
  final String? imagePath;
  final String link;

  Project({
    required this.name,
    required this.description,
    this.imagePath,
    required this.link,
  });
}