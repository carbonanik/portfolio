import 'package:flutter/material.dart';

// ─────────────────────────────────────────────
// BRAND / GENERAL
// ─────────────────────────────────────────────

const String kBrandName = 'Sheikh Anik';
const String kCopyrightText = '© 2026 Carbon Anik. All rights reserved.';

// ─────────────────────────────────────────────
// HERO SECTION
// ─────────────────────────────────────────────

const String kHeroEyebrow = 'FLUTTER DEVELOPER';
const String kHeroHeadline = 'Building beautiful\napps with Flutter';
const String kHeroSubtitle =
    'I build cross-platform mobile applications that are\n'
    'fast, beautiful and provide exceptional user experiences.';

// ─────────────────────────────────────────────
// ABOUT SECTION
// ─────────────────────────────────────────────

const String kAboutEyebrow = 'ABOUT ME';
const String kAboutHeadline = 'Hi, I\'m Anik\nFlutter Developer';
const String kAboutBio =
    'I\'m a self-taught Flutter developer with a passion for building\n'
    'clean, scalable and user-friendly mobile applications.\n'
    'I love turning ideas into real products.';

class StatData {
  const StatData({
    required this.icon,
    required this.value,
    required this.label,
  });
  final IconData icon;
  final String value;
  final String label;
}

const List<StatData> kAboutStats = [
  StatData(
    icon: Icons.timelapse_rounded,
    value: '3+',
    label: 'Years Experience',
  ),
  StatData(
    icon: Icons.work_outline_rounded,
    value: '15+',
    label: 'Projects Completed',
  ),
  StatData(
    icon: Icons.thumb_up_alt_outlined,
    value: '100%',
    label: 'Client Satisfaction',
  ),
];

// ─────────────────────────────────────────────
// SKILLS SECTION
// ─────────────────────────────────────────────

class SkillData {
  const SkillData({
    required this.name,
    required this.logoAsset,
    required this.color,
  });
  final String name;
  final String logoAsset;
  final Color color;
}

const List<SkillData> kSkills = [
  SkillData(
    name: 'Flutter',
    logoAsset: 'assets/logos/flutter.webp',
    color: Color(0xFF19A7E8),
  ),
  SkillData(
    name: 'Dart',
    logoAsset: 'assets/logos/dart.webp',
    color: Color(0xFF48A9E6),
  ),
  SkillData(
    name: 'Firebase',
    logoAsset: 'assets/logos/firebase.webp',
    color: Color(0xFFFFB000),
  ),
  SkillData(
    name: 'Riverpod',
    logoAsset: 'assets/logos/riverpod.webp',
    color: Color(0xFF4CA5DB),
  ),
  SkillData(
    name: 'Hive',
    logoAsset: 'assets/logos/hive.webp',
    color: Color(0xFFF2C839),
  ),
  SkillData(
    name: 'REST API',
    logoAsset: 'assets/logos/rest_api.webp',
    color: Color(0xFFE7E7E7),
  ),
  SkillData(
    name: 'Git',
    logoAsset: 'assets/logos/git.webp',
    color: Color(0xFFF1502F),
  ),
  SkillData(
    name: 'Docker',
    logoAsset: 'assets/logos/docker.webp',
    color: Color(0xFF2496ED),
  ),
];

// ─────────────────────────────────────────────
// PROJECTS SECTION
// ─────────────────────────────────────────────

class ProjectData {
  const ProjectData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.tags,
    required this.icon,
  });
  final String title;
  final String subtitle;
  final String description;
  final List<String> tags;
  final IconData icon;
}

const List<ProjectData> kProjects = [
  ProjectData(
    title: 'Gari Bhai',
    subtitle: 'Ride Sharing App',
    description: 'A complete ride sharing solution\nwith real-time tracking.',
    tags: ['Flutter', 'Firebase'],
    icon: Icons.commute_rounded,
  ),
  ProjectData(
    title: 'Tour Shongi',
    subtitle: 'Travel Companion',
    description: 'Travel app with places, guides\nand trip management.',
    tags: ['Flutter', 'Hive', 'Maps'],
    icon: Icons.landscape_rounded,
  ),
  ProjectData(
    title: 'Wrangle Wave',
    subtitle: 'Mechanic App',
    description: 'Vehicle service app for garages\nand customers.',
    tags: ['Flutter', 'Stripe', 'Firebase'],
    icon: Icons.build_circle_outlined,
  ),
  ProjectData(
    title: 'Instant Shop',
    subtitle: 'E-commerce App',
    description: 'Multi-vendor e-commerce\napp with modern UI.',
    tags: ['Flutter', 'Riverpod'],
    icon: Icons.shopping_bag_outlined,
  ),
];

// ─────────────────────────────────────────────
// EXPERIENCE SECTION
// ─────────────────────────────────────────────

class ExperienceData {
  const ExperienceData({
    required this.period,
    required this.role,
    required this.company,
    required this.description,
  });
  final String period;
  final String role;
  final String company;
  final String description;
}

const List<ExperienceData> kExperience = [
  ExperienceData(
    period: '2022 – Present',
    role: 'Flutter Developer (Remote)',
    company: 'KLwecoo (Upwork)',
    description: 'Building cross-platform mobile apps\nfor clients worldwide.',
  ),
  ExperienceData(
    period: '2021 – 2022',
    role: 'Flutter Developer',
    company: 'Softenin, Dhaka',
    description: 'Developed and maintained multiple\nproduction apps.',
  ),
  ExperienceData(
    period: '2020 – 2021',
    role: 'Android Developer (Kotlin)',
    company: 'ApexDv, Dhaka',
    description: 'Worked on native Android apps\nusing Kotlin and MVVM.',
  ),
];

// ─────────────────────────────────────────────
// CONTACT / FOOTER SECTION
// ─────────────────────────────────────────────

const String kContactEyebrow = 'LET\u2019S WORK TOGETHER';
const String kContactTagline =
    'Have a project in mind? Let\u2019s build something amazing together.';

class ContactLineData {
  const ContactLineData({required this.icon, required this.text});
  final IconData icon;
  final String text;
}

const List<ContactLineData> kContactLines = [
  ContactLineData(
    icon: Icons.mail_outline_rounded,
    text: 'sheikhanikbd@gmail.com',
  ),
  ContactLineData(
    icon: Icons.phone_outlined,
    text: '+880 1766-785027',
  ),
  ContactLineData(
    icon: Icons.location_on_outlined,
    text: 'Dhaka, Bangladesh',
  ),
];

class SocialIconData {
  const SocialIconData({required this.icon, this.url});
  final IconData icon;
  final String? url; // optional – add URLs when ready
}

const List<SocialIconData> kSocialIcons = [
  SocialIconData(
      icon: Icons.code_rounded, url: 'https://github.com/carbonanik'), // GitHub
  SocialIconData(
      icon: Icons.business_center_outlined,
      url: 'https://linkedin.com/in/carbonanik'), // LinkedIn
  SocialIconData(
      icon: Icons.alternate_email_rounded,
      url: 'https://twitter.com/carbonanik'), // Twitter / X
  SocialIconData(
      icon: Icons.language_rounded,
      url: 'https://carbonanik.web.app'), // Website
];
