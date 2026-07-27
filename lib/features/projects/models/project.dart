class Project {
  final String name;
  final String description;
  final String? imagePath;
  final List<ProjectLink> links;
  final List<String> tags;

  // Case Study Fields
  final String? platform;
  final String? role;
  final String? problemStatement;
  final List<String>? goals;
  final List<String>? constraints;
  final List<String>? thinkingProcess;
  final List<String>? designDecisions;
  final List<String>? technicalImplementation;
  final List<ChallengeSolution>? challenges;
  final List<String>? results;
  final List<String>? futureImprovements;
  final List<String>? screenshots;

  Project({
    required this.name,
    required this.description,
    this.imagePath,
    required this.links,
    required this.tags,
    this.platform,
    this.role,
    this.problemStatement,
    this.goals,
    this.constraints,
    this.thinkingProcess,
    this.designDecisions,
    this.technicalImplementation,
    this.challenges,
    this.results,
    this.futureImprovements,
    this.screenshots,
  });
}

class ChallengeSolution {
  final String challenge;
  final String solution;

  ChallengeSolution({
    required this.challenge,
    required this.solution,
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
