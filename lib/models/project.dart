class Project {
  final String title;
  final String description;
  final String imageUrl;
  final String? liveUrl;
  final String? githubUrl;
  final List<String> technologies;
  final List<String> features;
  final String category;
  final bool isFeatured;

  const Project({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.liveUrl,
    this.githubUrl,
    required this.technologies,
    required this.features,
    required this.category,
    this.isFeatured = false,
  });
}

class ProjectCategory {
  final String name;
  final String icon;
  final List<Project> projects;

  const ProjectCategory({
    required this.name,
    required this.icon,
    required this.projects,
  });
}
