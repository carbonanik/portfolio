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
const String kHeroHeadline = 'Clean code.\nA human touch.';
const String kHeroSubtitle =
    'I build mobile apps that work smoothly and feel familiar, \n'
    'combining Flutter development with care for the person on the other side of the screen.';

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
    title: 'Plnze',
    subtitle: 'Communication and Collaboration App',
    description:
        'Real time chat voice and video calls\nwith instant and scheduled meeting.',
    tags: ['Flutter', 'Agora', 'Bloc'],
    icon: Icons.people_alt_rounded,
  ),
  ProjectData(
    title: 'Digital Logic Sim',
    subtitle: 'Digital Logic Circuit Simulator',
    description:
        'Interactive logic circuit simulator\nwith gates, wires and real-time logic.',
    tags: ['Flutter', 'Custom Rendering', 'Logic Simulation'],
    icon: Icons.account_tree_rounded,
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
    tags: ['Flutter', 'Stripe', 'Google Maps'],
    icon: Icons.build_circle_outlined,
  ),
  ProjectData(
    title: 'Instant Shop',
    subtitle: 'E-commerce App',
    description: 'Multi-vendor e-commerce\napp with modern UI.',
    tags: ['Flutter', 'Riverpod'],
    icon: Icons.shopping_bag_outlined,
  ),
  ProjectData(
    title: 'Gari Bhai',
    subtitle: 'Vehicle Rental & Hailing App',
    description:
        'A vehicle rental and hailing app\nfor seamless transportation.',
    tags: ['Flutter', 'REST API', 'Riverpod'],
    icon: Icons.commute_rounded,
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
    period: '2026 – Present',
    role: 'Mid-Level Flutter Developer',
    company: 'Antripe',
    description: 'Developing Plnze, a professional communication '
        'app with chat, calls, meetings, and news.',
  ),
  ExperienceData(
    period: '2025 – 2026',
    role: 'Flutter Developer',
    company: 'Join-Venture AI',
    description: 'Stabilized and rebuilt complex apps using '
        'Clean Architecture, Maps, and real-time systems.',
  ),
  ExperienceData(
    period: '2023 – 2025',
    role: 'Flutter Developer',
    company: 'Nagalay / Codes Break',
    description: 'Built booking platforms and client apps from '
        'scratch, leading a small development team.',
  ),
];

// ─────────────────────────────────────────────
// CONTACT / FOOTER SECTION
// ─────────────────────────────────────────────

const String kContactMeLink = 'http://linkedin.com/in/carbonanik';

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
  const SocialIconData({required this.icon, this.logo, this.url});
  final IconData icon;
  final String? logo;
  final String? url; // optional – add URLs when ready
}

const List<SocialIconData> kSocialIcons = [
  SocialIconData(
      logo: 'assets/logos/social/github.webp',
      icon: Icons.code_rounded,
      url: 'https://github.com/carbonanik'), // GitHub
  SocialIconData(
      logo: 'assets/logos/social/linkedin.webp',
      icon: Icons.business_center_outlined,
      url: 'https://linkedin.com/in/carbonanik'), // LinkedIn
  // SocialIconData(
  //     icon: Icons.alternate_email_rounded,
  //     url: 'https://x.com/carbonanik'), // Twitter / X
  // SocialIconData(
  //     icon: Icons.language_rounded,
  //     url: 'https://carbonanik.web.app'), // Website
];
