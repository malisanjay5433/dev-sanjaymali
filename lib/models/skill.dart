class Skill {
  final String name;
  final String category;
  final double proficiency; // 0.0 to 1.0
  final String icon;
  final String? description;

  const Skill({
    required this.name,
    required this.category,
    required this.proficiency,
    required this.icon,
    this.description,
  });
}

class SkillCategory {
  final String name;
  final String icon;
  final List<Skill> skills;

  const SkillCategory({
    required this.name,
    required this.icon,
    required this.skills,
  });
}
