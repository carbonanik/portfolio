import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carbon Anik',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          surface: Colors.black,
        ),
        textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final skillsKey = GlobalKey();
  final projectsKey = GlobalKey();
  final experienceKey = GlobalKey();
  final contactKey = GlobalKey();

  Future<void> _goTo(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 650),
        curve: Curves.easeInOutCubic,
        alignment: .04,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final mobile = width < 760;

    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: _BackgroundLines()),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mobile ? 20 : 42,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _Navbar(
                          mobile: mobile,
                          onHome: () => _goTo(homeKey),
                          onAbout: () => _goTo(aboutKey),
                          onSkills: () => _goTo(skillsKey),
                          onProjects: () => _goTo(projectsKey),
                          onExperience: () => _goTo(experienceKey),
                          onContact: () => _goTo(contactKey),
                        ),
                        SizedBox(height: mobile ? 42 : 28),
                        Container(
                          key: homeKey,
                          child: _HeroSection(
                            mobile: mobile,
                            onWork: () => _goTo(projectsKey),
                            onContact: () => _goTo(contactKey),
                          ),
                        ),
                        SizedBox(height: mobile ? 46 : 20),
                        Container(
                          key: aboutKey,
                          child: _AboutSection(mobile: mobile),
                        ),
                        const SizedBox(height: 34),
                        Container(
                          key: skillsKey,
                          child: const _SkillsSection(),
                        ),
                        const SizedBox(height: 34),
                        Container(
                          key: projectsKey,
                          child: const _ProjectsSection(),
                        ),
                        const SizedBox(height: 38),
                        Container(
                          key: experienceKey,
                          child: const _ExperienceSection(),
                        ),
                        const SizedBox(height: 34),
                        Container(
                          key: contactKey,
                          child: _Footer(mobile: mobile),
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Navbar extends StatelessWidget {
  const _Navbar({
    required this.mobile,
    required this.onHome,
    required this.onAbout,
    required this.onSkills,
    required this.onProjects,
    required this.onExperience,
    required this.onContact,
  });

  final bool mobile;
  final VoidCallback onHome;
  final VoidCallback onAbout;
  final VoidCallback onSkills;
  final VoidCallback onProjects;
  final VoidCallback onExperience;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final navItems = <MapEntry<String, VoidCallback>>[
      MapEntry('Home', onHome),
      MapEntry('About', onAbout),
      MapEntry('Skills', onSkills),
      MapEntry('Projects', onProjects),
      MapEntry('Experience', onExperience),
      MapEntry('Contact', onContact),
    ];

    return SizedBox(
      height: 72,
      child: Row(
        children: [
          const _Brand(),
          const Spacer(),
          if (!mobile) ...[
            for (final item in navItems)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: _NavButton(
                  text: item.key,
                  onTap: item.value,
                  active: item.key == 'Home',
                ),
              ),
            const SizedBox(width: 28),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.download_rounded, size: 16),
              label: const Text('Download CV'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF272727)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ] else
            PopupMenuButton<VoidCallback>(
              icon: const Icon(Icons.menu_rounded),
              color: const Color(0xFF101010),
              onSelected: (callback) => callback(),
              itemBuilder: (_) => [
                for (final item in navItems)
                  PopupMenuItem(
                    value: item.value,
                    child: Text(item.key),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.rotate(
          angle: .78,
          child: const Icon(Icons.close_rounded,
              color: Color(0xFF9C9C9C), size: 27),
        ),
        const SizedBox(width: 10),
        Text(
          'Carbon Anik',
          style: GoogleFonts.inter(
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.text,
    required this.onTap,
    this.active = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 13,
                color: active ? Colors.white : const Color(0xFFD2D2D2),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: active ? 31 : 0,
              height: 1,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.mobile,
    required this.onWork,
    required this.onContact,
  });

  final bool mobile;
  final VoidCallback onWork;
  final VoidCallback onContact;

  @override
  Widget build(BuildContext context) {
    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _Eyebrow('FLUTTER DEVELOPER'),
        const SizedBox(height: 22),
        Text(
          'Building beautiful\napps with Flutter',
          style: GoogleFonts.inter(
            fontSize: mobile ? 45 : 54,
            height: 1.08,
            letterSpacing: -2.5,
            fontWeight: FontWeight.w800,
            color: const Color(0xFFF6F6F6),
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Text(
            'I build cross-platform mobile applications that are\nfast, beautiful and provide exceptional user experiences.',
            style: GoogleFonts.inter(
              fontSize: mobile ? 14 : 15,
              height: 1.65,
              color: const Color(0xFFB3B3B3),
            ),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 14,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: onWork,
              iconAlignment: IconAlignment.end,
              icon: const Icon(Icons.arrow_forward_rounded, size: 18),
              label: const Text('View My Work'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onContact,
              iconAlignment: IconAlignment.end,
              icon: const Icon(Icons.mail_outline_rounded, size: 18),
              label: const Text('Contact Me'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF4A4A4A)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 19),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ],
        ),
      ],
    );

    final phone = SizedBox(
      height: mobile ? 420 : 450,
      child: Align(
        alignment: Alignment.centerRight,
        child: Image.asset(
          'assets/images/phone_mockup.png',
          fit: BoxFit.contain,
        ),
      ),
    );

    return mobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [copy, const SizedBox(height: 18), phone],
          )
        : SizedBox(
            height: 445,
            child: Row(
              children: [
                Expanded(flex: 57, child: copy),
                Expanded(flex: 43, child: phone),
              ],
            ),
          );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final image = ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.cover,
        ),
      ),
    );

    final content = Padding(
      padding: EdgeInsets.all(mobile ? 22 : 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Eyebrow('ABOUT ME'),
          const SizedBox(height: 16),
          Text(
            'Hi, I’m Anik\nFlutter Developer',
            style: GoogleFonts.inter(
              fontSize: mobile ? 30 : 34,
              height: 1.05,
              letterSpacing: -1.2,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'I’m a self-taught Flutter developer with a passion for building\n'
            'clean, scalable and user-friendly mobile applications.\n'
            'I love turning ideas into real products.',
            style: GoogleFonts.inter(
              fontSize: 13,
              height: 1.55,
              color: const Color(0xFFB5B5B5),
            ),
          ),
          const SizedBox(height: 20),
          const Wrap(
            spacing: 30,
            runSpacing: 18,
            children: [
              _Stat(
                  icon: Icons.timelapse_rounded,
                  value: '5+',
                  label: 'Years Experience'),
              _Stat(
                  icon: Icons.work_outline_rounded,
                  value: '20+',
                  label: 'Projects Completed'),
              _Stat(
                  icon: Icons.thumb_up_alt_outlined,
                  value: '100%',
                  label: 'Client Satisfaction'),
            ],
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () {},
            iconAlignment: IconAlignment.end,
            icon: const Icon(Icons.person_outline_rounded, size: 18),
            label: const Text('More About Me'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF454545)),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xBB050505),
        border: Border.all(color: const Color(0xFF292929)),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(mobile ? 18 : 20),
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [image, content],
            )
          : Row(
              children: [
                SizedBox(width: 330, child: image),
                Expanded(child: content),
              ],
            ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF5A5A5A)),
            ),
            child: Icon(icon, size: 15, color: const Color(0xFFBFBFBF)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700)),
                Text(
                  label,
                  maxLines: 1,
                  style:
                      const TextStyle(fontSize: 10.5, color: Color(0xFF9A9A9A)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  static const skills = [
    ('Flutter', Icons.flutter_dash_rounded, Color(0xFF19A7E8)),
    ('Dart', Icons.change_history_rounded, Color(0xFF48A9E6)),
    ('Firebase', Icons.local_fire_department_rounded, Color(0xFFFFB000)),
    ('Riverpod', Icons.hub_outlined, Color(0xFF4CA5DB)),
    ('Hive', Icons.hexagon_rounded, Color(0xFFF2C839)),
    ('REST API', Icons.api_rounded, Color(0xFFE7E7E7)),
    ('Git', Icons.alt_route_rounded, Color(0xFFF1502F)),
    ('Docker', Icons.directions_boat_filled_rounded, Color(0xFF2496ED)),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('MY SKILLS'),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth > 950
                ? 8
                : constraints.maxWidth > 620
                    ? 4
                    : 2;
            final gap = 12.0;
            final itemWidth =
                (constraints.maxWidth - gap * (columns - 1)) / columns;

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final skill in skills)
                  SizedBox(
                    width: itemWidth,
                    child: _SkillCard(
                      name: skill.$1,
                      icon: skill.$2,
                      color: skill.$3,
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _SkillCard extends StatelessWidget {
  const _SkillCard({
    required this.name,
    required this.icon,
    required this.color,
  });

  final String name;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
      decoration: BoxDecoration(
        color: const Color(0xAA060606),
        border: Border.all(color: const Color(0xFF282828)),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 38),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontSize: 12.5)),
        ],
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  static const projects = [
    _ProjectData(
      title: 'Gari Bhai',
      subtitle: 'Ride Sharing App',
      description: 'A complete ride sharing solution\nwith real-time tracking.',
      tags: ['Flutter', 'Firebase'],
      icon: Icons.commute_rounded,
    ),
    _ProjectData(
      title: 'Tour Shongi',
      subtitle: 'Travel Companion',
      description: 'Travel app with places, guides\nand trip management.',
      tags: ['Flutter', 'Hive', 'Maps'],
      icon: Icons.landscape_rounded,
    ),
    _ProjectData(
      title: 'Wrangle Wave',
      subtitle: 'Mechanic App',
      description: 'Vehicle service app for garages\nand customers.',
      tags: ['Flutter', 'Stripe', 'Firebase'],
      icon: Icons.build_circle_outlined,
    ),
    _ProjectData(
      title: 'Instant Shop',
      subtitle: 'E-commerce App',
      description: 'Multi-vendor e-commerce\napp with modern UI.',
      tags: ['Flutter', 'Riverpod'],
      icon: Icons.shopping_bag_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: _SectionTitle('FEATURED PROJECTS')),
            Text(
              'View All Projects  →',
              style: TextStyle(fontSize: 11, color: Color(0xFFA9A9A9)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final columns = constraints.maxWidth > 900
                ? 4
                : constraints.maxWidth > 600
                    ? 2
                    : 1;
            final gap = 14.0;
            final itemWidth =
                (constraints.maxWidth - gap * (columns - 1)) / columns;

            return Wrap(
              spacing: gap,
              runSpacing: gap,
              children: [
                for (final p in projects)
                  SizedBox(
                    width: itemWidth,
                    child: _ProjectCard(data: p),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.data});

  final _ProjectData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xAA060606),
        border: Border.all(color: const Color(0xFF292929)),
        borderRadius: BorderRadius.circular(9),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFF161616),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(data.icon, color: Colors.white70),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 13),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      data.subtitle,
                      style: const TextStyle(
                          color: Color(0xFF9B9B9B), fontSize: 10.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            data.description,
            style: const TextStyle(
              color: Color(0xFFAEAEAE),
              fontSize: 11.5,
              height: 1.45,
            ),
          ),
          const Spacer(),
          Wrap(
            spacing: 6,
            children: [
              for (final tag in data.tags) _Tag(tag),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProjectData {
  const _ProjectData({
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

class _Tag extends StatelessWidget {
  const _Tag(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF202020)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 9.5, color: Color(0xFFAAAAAA)),
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection();

  static const entries = [
    (
      '2022 – Present',
      'Flutter Developer (Remote)',
      'KLwecoo (Upwork)',
      'Building cross-platform mobile apps\nfor clients worldwide.'
    ),
    (
      '2021 – 2022',
      'Flutter Developer',
      'Softenin, Dhaka',
      'Developed and maintained multiple\nproduction apps.'
    ),
    (
      '2020 – 2021',
      'Android Developer (Kotlin)',
      'ApexDv, Dhaka',
      'Worked on native Android apps\nusing Kotlin and MVVM.'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: _SectionTitle('EXPERIENCE')),
            Text(
              'View Full Resume  →',
              style: TextStyle(fontSize: 11, color: Color(0xFFA9A9A9)),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final narrow = constraints.maxWidth < 700;
            return Column(
              children: [
                for (int i = 0; i < entries.length; i++) ...[
                  _ExperienceRow(data: entries[i], narrow: narrow),
                  if (i != entries.length - 1) const SizedBox(height: 20),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

class _ExperienceRow extends StatelessWidget {
  const _ExperienceRow({
    required this.data,
    required this.narrow,
  });

  final (String, String, String, String) data;
  final bool narrow;

  @override
  Widget build(BuildContext context) {
    if (narrow) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF242424)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.$1,
                style: const TextStyle(color: Color(0xFF9D9D9D), fontSize: 11)),
            const SizedBox(height: 10),
            Text(data.$2,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
            Text(data.$3,
                style:
                    const TextStyle(color: Color(0xFF909090), fontSize: 10.5)),
            const SizedBox(height: 12),
            Text(data.$4,
                style: const TextStyle(
                    color: Color(0xFFAAAAAA), fontSize: 11.5, height: 1.5)),
          ],
        ),
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 150,
          child: Text(
            data.$1,
            style: const TextStyle(color: Color(0xFF989898), fontSize: 12),
          ),
        ),
        SizedBox(
          width: 60,
          child: Column(
            children: [
              Container(
                width: 11,
                height: 11,
                decoration: BoxDecoration(
                  color: const Color(0xFF646464),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF8A8A8A)),
                ),
              ),
              Container(
                width: 1,
                height: 45,
                color: const Color(0xFF222222),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.$2,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 5),
              Text(
                data.$3,
                style:
                    const TextStyle(fontSize: 10.5, color: Color(0xFF929292)),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            data.$4,
            style: const TextStyle(
              fontSize: 11.5,
              height: 1.55,
              color: Color(0xFFAAAAAA),
            ),
          ),
        ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Eyebrow('LET’S WORK TOGETHER'),
        const SizedBox(height: 16),
        const Text(
          'Have a project in mind? Let’s build something amazing together.',
          style: TextStyle(fontSize: 11.5, color: Color(0xFF949494)),
        ),
      ],
    );

    final contact = const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactLine(Icons.mail_outline_rounded, 'anik.mis085@gmail.com'),
        SizedBox(height: 12),
        _ContactLine(Icons.phone_outlined, '+880 1234-567890'),
        SizedBox(height: 12),
        _ContactLine(Icons.location_on_outlined, 'Dhaka, Bangladesh'),
      ],
    );

    final social = const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _SocialIcon(Icons.code_rounded),
        SizedBox(width: 22),
        _SocialIcon(Icons.business_center_outlined),
        SizedBox(width: 22),
        _SocialIcon(Icons.alternate_email_rounded),
        SizedBox(width: 22),
        _SocialIcon(Icons.language_rounded),
      ],
    );

    return Container(
      padding: const EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF1D1D1D))),
      ),
      child: Column(
        children: [
          if (mobile) ...[
            Align(alignment: Alignment.centerLeft, child: intro),
            const SizedBox(height: 28),
            Align(alignment: Alignment.centerLeft, child: contact),
            const SizedBox(height: 28),
            Align(alignment: Alignment.centerLeft, child: social),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: intro),
                Expanded(flex: 3, child: contact),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: social,
                  ),
                ),
              ],
            ),
          const SizedBox(height: 28),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '© 2024 Carbon Anik. All rights reserved.',
              style: TextStyle(fontSize: 10.5, color: Color(0xFF737373)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactLine extends StatelessWidget {
  const _ContactLine(this.icon, this.text);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: const Color(0xFFB8B8B8)),
        const SizedBox(width: 14),
        Text(text, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon(this.icon);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(icon, size: 20, color: Colors.white);
  }
}

class _Eyebrow extends StatelessWidget {
  const _Eyebrow(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 10.5,
            letterSpacing: 3.1,
            color: Color(0xFFA0A0A0),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 18),
        Container(
          height: 1,
          width: 45,
          color: const Color(0xFF555555),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 10.5,
            letterSpacing: 3.2,
            color: Color(0xFFA3A3A3),
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF2A2A2A),
          ),
        ),
      ],
    );
  }
}

class _BackgroundLines extends StatelessWidget {
  const _BackgroundLines();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BackgroundPainter(),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final line = Paint()
      ..color = const Color(0xFF171717)
      ..strokeWidth = 1;

    for (int i = -2; i < 4; i++) {
      final startX = i * 90.0;
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX - 210, 210),
        line,
      );
    }

    for (int i = 0; i < 5; i++) {
      final x = size.width - i * 95;
      canvas.drawLine(
        Offset(x + 160, size.height - 250),
        Offset(x - 100, size.height + 10),
        line,
      );
    }

    final glow = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0x111D1D1D),
          Color(0x00000000),
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * .78, size.height * .17),
          radius: 400,
        ),
      );
    canvas.drawRect(Offset.zero & size, glow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
