import 'dart:async';

import 'package:flutter/material.dart';

import 'data.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF08090B);
    const surface = Color(0xFF0E1013);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anik - Flutter Developer',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFF4F4F5),
          surface: surface,
          onSurface: Color(0xFFF4F4F5),
        ),
        splashFactory: InkSparkle.splashFactory,
        textTheme: ThemeData.dark().textTheme.apply(fontFamily: 'Inter'),
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
        duration: const Duration(milliseconds: 720),
        curve: Curves.easeOutCubic,
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
          const Positioned.fill(child: _Background()),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1180),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mobile ? 18 : 38,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 8),
                        _Reveal(
                          delay: const Duration(milliseconds: 100),
                          offset: const Offset(0, -0.05),
                          child: _Navbar(
                            mobile: mobile,
                            onHome: () => _goTo(homeKey),
                            onAbout: () => _goTo(aboutKey),
                            onSkills: () => _goTo(skillsKey),
                            onProjects: () => _goTo(projectsKey),
                            onExperience: () => _goTo(experienceKey),
                            onContact: () => _goTo(contactKey),
                          ),
                        ),
                        SizedBox(height: mobile ? 54 : 42),
                        Container(
                          key: homeKey,
                          child: _HeroSection(
                            mobile: mobile,
                            onWork: () => _goTo(projectsKey),
                            onContact: () => _goTo(contactKey),
                          ),
                        ),
                        SizedBox(height: mobile ? 62 : 54),
                        Container(
                          key: aboutKey,
                          child: _Reveal(
                            delay: const Duration(milliseconds: 700),
                            child: _AboutSection(mobile: mobile),
                          ),
                        ),
                        const SizedBox(height: 54),
                        Container(
                          key: skillsKey,
                          child: _Reveal(
                            delay: const Duration(milliseconds: 700),
                            child: const _SkillsSection(),
                          ),
                        ),
                        const SizedBox(height: 58),
                        Container(
                          key: projectsKey,
                          child: _Reveal(
                            delay: const Duration(milliseconds: 700),
                            child: const _ProjectsSection(),
                          ),
                        ),
                        const SizedBox(height: 62),
                        Container(
                          key: experienceKey,
                          child: _Reveal(
                            delay: const Duration(milliseconds: 700),
                            child: const _ExperienceSection(),
                          ),
                        ),
                        const SizedBox(height: 62),
                        Container(
                          key: contactKey,
                          child: _Reveal(
                            delay: const Duration(milliseconds: 700),
                            child: _Footer(mobile: mobile),
                          ),
                        ),
                        const SizedBox(height: 30),
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

    return Container(
      height: 68,
      padding: EdgeInsets.symmetric(horizontal: mobile ? 16 : 20),
      decoration: BoxDecoration(
        color: const Color(0xCC0C0E11),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1D2025)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x24000000),
            blurRadius: 30,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          const _Brand(),
          const Spacer(),
          if (!mobile) ...[
            for (final item in navItems)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: _NavButton(
                  text: item.key,
                  onTap: item.value,
                  active: item.key == 'Home',
                ),
              ),
            const SizedBox(width: 14),
            _ActionButton(
              label: 'Download CV',
              icon: Icons.download_rounded,
              onTap: () {},
              filled: false,
              compact: true,
            ),
          ] else
            PopupMenuButton<VoidCallback>(
              tooltip: 'Menu',
              icon: const Icon(Icons.menu_rounded, size: 22),
              color: const Color(0xFF111318),
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
                side: const BorderSide(color: Color(0xFF24272C)),
              ),
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
        Container(
          width: 31,
          height: 31,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF34373D)),
            color: const Color(0xFF121418),
          ),
          child: Transform.rotate(
            angle: .78,
            child: const Icon(
              Icons.close_rounded,
              color: Color(0xFFB7BBC2),
              size: 17,
            ),
          ),
        ),
        const SizedBox(width: 11),
        Text(
          kBrandName,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 17,
            letterSpacing: -.3,
            fontWeight: FontWeight.w700,
            color: Color(0xFFF2F3F5),
          ),
        ),
      ],
    );
  }
}

class _NavButton extends StatefulWidget {
  const _NavButton({
    required this.text,
    required this.onTap,
    this.active = false,
  });

  final String text;
  final VoidCallback onTap;
  final bool active;

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final highlighted = widget.active || hovered;

    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(10),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: hovered ? const Color(0xFF15181C) : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 12.5,
              fontWeight: highlighted ? FontWeight.w600 : FontWeight.w500,
              color: highlighted
                  ? const Color(0xFFF2F3F5)
                  : const Color(0xFF9CA1AA),
            ),
          ),
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
        _Reveal(
          delay: const Duration(milliseconds: 150),
          child: const _Eyebrow(kHeroEyebrow),
        ),
        const SizedBox(height: 20),
        _Reveal(
          delay: const Duration(milliseconds: 250),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 660),
            child: Text(
              kHeroHeadline,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: mobile ? 43 : 58,
                height: 1.04,
                letterSpacing: mobile ? -2 : -3.1,
                fontWeight: FontWeight.w800,
                color: const Color(0xFFF4F4F5),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _Reveal(
          delay: const Duration(milliseconds: 350),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(
              kHeroSubtitle,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: mobile ? 14 : 15,
                height: 1.7,
                letterSpacing: -.1,
                color: const Color(0xFF9EA3AB),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        _Reveal(
          delay: const Duration(milliseconds: 450),
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _ActionButton(
                label: 'View My Work',
                icon: Icons.arrow_outward_rounded,
                onTap: onWork,
                filled: true,
              ),
              _ActionButton(
                label: 'Contact Me',
                icon: Icons.mail_outline_rounded,
                onTap: onContact,
                filled: false,
              ),
            ],
          ),
        ),
      ],
    );

    final phone = SizedBox(
      height: mobile ? 410 : 470,
      child: Align(
        alignment: Alignment.centerRight,
        child: _Reveal(
          delay: const Duration(milliseconds: 550),
          offset: const Offset(0.05, 0),
          child: _FloatingAsset(
            child: Image.asset(
              'assets/images/phone_mockup_removebg.webp',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );

    return mobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [copy, const SizedBox(height: 28), phone],
          )
        : SizedBox(
            height: 480,
            child: Row(
              children: [
                Expanded(flex: 56, child: copy),
                Expanded(flex: 44, child: phone),
              ],
            ),
          );
  }
}

class _ActionButton extends StatefulWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onTap,
    required this.filled,
    this.compact = false,
  });

  final String label;
  final IconData icon;
  final VoidCallback onTap;
  final bool filled;
  final bool compact;

  @override
  State<_ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<_ActionButton> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.filled
        ? (hovered ? const Color(0xFFFFFFFF) : const Color(0xFFF1F2F4))
        : (hovered ? const Color(0xFF15181C) : const Color(0xB20E1013));

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 190),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, hovered ? -2 : 0, 0),
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? 16 : 20,
            vertical: widget.compact ? 13 : 16,
          ),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(widget.compact ? 11 : 13),
            border: Border.all(
              color: widget.filled
                  ? const Color(0xFFF2F2F3)
                  : (hovered
                      ? const Color(0xFF3A3E45)
                      : const Color(0xFF2A2D32)),
            ),
            boxShadow: widget.filled && hovered
                ? const [
                    BoxShadow(
                      color: Color(0x22000000),
                      blurRadius: 18,
                      offset: Offset(0, 8),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: widget.compact ? 12 : 13,
                  fontWeight: FontWeight.w600,
                  color: widget.filled
                      ? const Color(0xFF0A0B0D)
                      : const Color(0xFFE7E9EC),
                ),
              ),
              SizedBox(width: widget.compact ? 8 : 10),
              AnimatedRotation(
                turns: hovered ? .015 : 0,
                duration: const Duration(milliseconds: 180),
                child: Icon(
                  widget.icon,
                  size: widget.compact ? 15 : 17,
                  color: widget.filled
                      ? const Color(0xFF0A0B0D)
                      : const Color(0xFFD6D9DE),
                ),
              ),
            ],
          ),
        ),
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
      borderRadius: BorderRadius.circular(18),
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(
          'assets/images/profile.webp',
          fit: BoxFit.cover,
        ),
      ),
    );

    final content = Padding(
      padding: EdgeInsets.all(mobile ? 18 : 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _Eyebrow(kAboutEyebrow),
          const SizedBox(height: 16),
          Text(
            kAboutHeadline,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: mobile ? 29 : 36,
              height: 1.08,
              letterSpacing: -1.5,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFF1F2F4),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            kAboutBio,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13.2,
              height: 1.7,
              color: Color(0xFFA6ABB3),
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 26,
            runSpacing: 18,
            children: [
              for (final s in kAboutStats)
                _Stat(icon: s.icon, value: s.value, label: s.label),
            ],
          ),
          const SizedBox(height: 28),
          _ActionButton(
            label: 'More About Me',
            icon: Icons.arrow_outward_rounded,
            onTap: () {},
            filled: false,
          ),
        ],
      ),
    );

    return _SoftPanel(
      padding: EdgeInsets.all(mobile ? 12 : 14),
      child: mobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [image, content],
            )
          : Row(
              children: [
                SizedBox(width: 338, child: image),
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
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFF15181C),
              border: Border.all(color: const Color(0xFF2A2D33)),
            ),
            child: Icon(icon, size: 15, color: const Color(0xFFB8BDC5)),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFEDEEF0),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 10.5,
                    color: Color(0xFF858B94),
                  ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('MY SKILLS'),
        const SizedBox(height: 20),
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
                for (final skill in kSkills)
                  SizedBox(
                    width: itemWidth,
                    child: _SkillCard(
                      name: skill.name,
                      logoAsset: skill.logoAsset,
                      color: skill.color,
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
    required this.logoAsset,
    required this.color,
  });

  final String name;
  final String logoAsset;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return _HoverCard(
      radius: 14,
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              logoAsset,
              width: 38,
              height: 38,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFFD6D9DE),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: _SectionTitle('FEATURED PROJECTS')),
            _QuietLink('View All Projects  ↗'),
          ],
        ),
        const SizedBox(height: 20),
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
                for (final p in kProjects)
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

  final ProjectData data;

  @override
  Widget build(BuildContext context) {
    return _HoverCard(
      radius: 16,
      child: SizedBox(
        height: 184,
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: const Color(0xFF15181C),
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: const Color(0xFF23262B)),
                    ),
                    child: Icon(data.icon, color: const Color(0xFFD9DCE1)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                            color: Color(0xFFEDEEF0),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data.subtitle,
                          style: const TextStyle(
                            color: Color(0xFF858B94),
                            fontSize: 10.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 13),
              Text(
                data.description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Color(0xFFA5AAB2),
                  fontSize: 11.4,
                  height: 1.52,
                ),
              ),
              const Spacer(),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: [
                  for (final tag in data.tags) _Tag(tag),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF14171A),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFF23262B)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 9.5, color: Color(0xFF9BA1AA)),
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: _SectionTitle('EXPERIENCE')),
            _QuietLink('View Full Resume  ↗'),
          ],
        ),
        const SizedBox(height: 22),
        LayoutBuilder(
          builder: (context, constraints) {
            final narrow = constraints.maxWidth < 700;
            return Column(
              children: [
                for (int i = 0; i < kExperience.length; i++) ...[
                  _ExperienceRow(data: kExperience[i], narrow: narrow),
                  if (i != kExperience.length - 1) const SizedBox(height: 14),
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

  final ExperienceData data;
  final bool narrow;

  @override
  Widget build(BuildContext context) {
    if (narrow) {
      return _HoverCard(
        radius: 14,
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.period,
                style: const TextStyle(
                  color: Color(0xFF858B94),
                  fontSize: 10.8,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                data.role,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFE8EAED),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                data.company,
                style: const TextStyle(
                  color: Color(0xFF90959E),
                  fontSize: 10.5,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                data.description,
                style: const TextStyle(
                  color: Color(0xFFA6ABB3),
                  fontSize: 11.5,
                  height: 1.55,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return _HoverCard(
      radius: 14,
      lift: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                data.period,
                style: const TextStyle(
                  color: Color(0xFF838892),
                  fontSize: 11.5,
                ),
              ),
            ),
            SizedBox(
              width: 44,
              child: Column(
                children: [
                  Container(
                    width: 9,
                    height: 9,
                    decoration: const BoxDecoration(
                      color: Color(0xFFADB2BA),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x336A7079),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 43,
                    margin: const EdgeInsets.only(top: 5),
                    color: const Color(0xFF292C31),
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
                    data.role,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFE8EAED),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    data.company,
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: Color(0xFF8A9099),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 3,
              child: Text(
                data.description,
                style: const TextStyle(
                  fontSize: 11.5,
                  height: 1.58,
                  color: Color(0xFFA5AAB2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.mobile});

  final bool mobile;

  @override
  Widget build(BuildContext context) {
    const intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Eyebrow(kContactEyebrow),
        SizedBox(height: 16),
        Text(
          kContactTagline,
          style: TextStyle(
            fontSize: 11.5,
            height: 1.55,
            color: Color(0xFF8F949D),
          ),
        ),
      ],
    );

    final contact = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < kContactLines.length; i++) ...[
          _ContactLine(kContactLines[i].icon, kContactLines[i].text),
          if (i != kContactLines.length - 1) const SizedBox(height: 12),
        ],
      ],
    );

    final social = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < kSocialIcons.length; i++) ...[
          _SocialIcon(kSocialIcons[i].icon),
          if (i != kSocialIcons.length - 1) const SizedBox(width: 10),
        ],
      ],
    );

    return _SoftPanel(
      padding: EdgeInsets.all(mobile ? 20 : 28),
      child: Column(
        children: [
          if (mobile) ...[
            const Align(alignment: Alignment.centerLeft, child: intro),
            const SizedBox(height: 26),
            Align(alignment: Alignment.centerLeft, child: contact),
            const SizedBox(height: 26),
            Align(alignment: Alignment.centerLeft, child: social),
          ] else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 5, child: intro),
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
          const SizedBox(height: 30),
          const Divider(height: 1, color: Color(0xFF22252A)),
          const SizedBox(height: 20),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              kCopyrightText,
              style: TextStyle(fontSize: 10.5, color: Color(0xFF70757E)),
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
        Icon(icon, size: 15, color: const Color(0xFFAEB3BB)),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11.7,
            color: Color(0xFFD8DADE),
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatefulWidget {
  const _SocialIcon(this.icon);

  final IconData icon;

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        width: 38,
        height: 38,
        transform: Matrix4.translationValues(0, hovered ? -2 : 0, 0),
        decoration: BoxDecoration(
          color: hovered ? const Color(0xFF181B20) : const Color(0xFF121418),
          borderRadius: BorderRadius.circular(11),
          border: Border.all(
            color: hovered ? const Color(0xFF393D44) : const Color(0xFF25282D),
          ),
        ),
        child: Icon(
          widget.icon,
          size: 18,
          color: hovered ? const Color(0xFFF0F1F2) : const Color(0xFFB4B8C0),
        ),
      ),
    );
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
        Container(
          width: 6,
          height: 6,
          decoration: const BoxDecoration(
            color: Color(0xFF969CA5),
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 10,
            letterSpacing: 2.45,
            color: Color(0xFF969CA5),
            fontWeight: FontWeight.w600,
          ),
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
            fontSize: 10,
            letterSpacing: 2.7,
            color: Color(0xFF9298A1),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFF24272C),
          ),
        ),
      ],
    );
  }
}

class _QuietLink extends StatefulWidget {
  const _QuietLink(this.text);

  final String text;

  @override
  State<_QuietLink> createState() => _QuietLinkState();
}

class _QuietLinkState extends State<_QuietLink> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 160),
        style: TextStyle(
          fontSize: 10.8,
          fontWeight: FontWeight.w500,
          color: hovered ? const Color(0xFFE2E4E7) : const Color(0xFF8F949D),
        ),
        child: Text(widget.text),
      ),
    );
  }
}

class _SoftPanel extends StatelessWidget {
  const _SoftPanel({
    required this.child,
    this.padding = EdgeInsets.zero,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xD90D0F12),
        border: Border.all(color: const Color(0xFF202328)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 30,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: child,
    );
  }
}

class _HoverCard extends StatefulWidget {
  const _HoverCard({
    required this.child,
    this.radius = 14,
    this.lift = 4,
  });

  final Widget child;
  final double radius;
  final double lift;

  @override
  State<_HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<_HoverCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, hovered ? -widget.lift : 0, 0),
        decoration: BoxDecoration(
          color: hovered ? const Color(0xFF111419) : const Color(0xD90D0F12),
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(
            color: hovered ? const Color(0xFF30343B) : const Color(0xFF202328),
          ),
          boxShadow: hovered
              ? const [
                  BoxShadow(
                    color: Color(0x1F000000),
                    blurRadius: 24,
                    offset: Offset(0, 10),
                  ),
                ]
              : null,
        ),
        child: widget.child,
      ),
    );
  }
}

class _Reveal extends StatefulWidget {
  const _Reveal({
    required this.child,
    this.delay = Duration.zero,
    this.offset = const Offset(0, .04),
  });

  final Widget child;
  final Duration delay;
  final Offset offset;

  @override
  State<_Reveal> createState() => _RevealState();
}

class _RevealState extends State<_Reveal> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutCubic,
    );

    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: widget.offset,
          end: Offset.zero,
        ).animate(animation),
        child: ScaleTransition(
          scale: Tween<double>(
            begin: .98,
            end: 1,
          ).animate(animation),
          child: widget.child,
        ),
      ),
    );
  }
}

class _FloatingAsset extends StatefulWidget {
  const _FloatingAsset({required this.child});

  final Widget child;

  @override
  State<_FloatingAsset> createState() => _FloatingAssetState();
}

class _FloatingAssetState extends State<_FloatingAsset>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    )..repeat(reverse: true);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: widget.child,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -5 * animation.value),
          child: Transform.scale(
            scale: 1 + (.006 * animation.value),
            child: child,
          ),
        );
      },
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BackgroundPainter(),
      child: const SizedBox.expand(),
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final subtleLine = Paint()
      ..color = const Color(0xFF14171A)
      ..strokeWidth = 1;

    for (int i = -2; i < 4; i++) {
      final startX = i * 120.0;
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX - 240, 240),
        subtleLine,
      );
    }

    for (int i = 0; i < 4; i++) {
      final x = size.width - i * 125;
      canvas.drawLine(
        Offset(x + 170, size.height - 280),
        Offset(x - 120, size.height + 10),
        subtleLine,
      );
    }

    final topGlow = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0x142E3440),
          Color(0x0008090B),
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * .80, size.height * .14),
          radius: 430,
        ),
      );
    canvas.drawRect(Offset.zero & size, topGlow);

    final leftGlow = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0x0D20252B),
          Color(0x0008090B),
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * .12, size.height * .53),
          radius: 360,
        ),
      );
    canvas.drawRect(Offset.zero & size, leftGlow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
