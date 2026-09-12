import 'package:flutter/material.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';
import 'package:portfolio/features/projects/ui/widgets/project_item.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/projects/models/category_project.dart';
import 'package:portfolio/features/projects/models/project.dart';
import 'package:portfolio/core/theme/typography.dart';

const des = "This is the real project i have made, you can believe me.";
final categories = [
  ProjectCategory(
    name: 'Flutter Projects',
    projects: [
      Project(
        name: 'Grocery Shop',
        description:
            'Complete e-commerce app 🛒 with robust performannce 🚀 & beautiful ui✨. And with a python backend 💻.',
        tags: ["Flutter", "Python", "Firebase", "REST API"],
        platform: "Android & iOS",
        role: "Full-stack Flutter Developer",
        problemStatement:
            "Users struggled to shop for groceries online because existing apps were slow, had complicated checkout processes, and didn't provide real-time inventory updates.",
        goals: [
          "Reduce checkout time by 50%",
          "Implement real-time stock tracking",
          "Create a visually appealing and intuitive UI",
        ],
        constraints: [
          "Tight 3-month development cycle",
          "Integration with a legacy inventory API",
          "Targeting low-end Android devices",
        ],
        thinkingProcess: [
          "I chose Clean Architecture with BLoC to ensure scalability and testability.",
          "I implemented a reactive UI that updates instantly when data changes.",
          "I focused on minimizing the number of taps required to complete a purchase.",
        ],
        designDecisions: [
          "Used a vibrant yet clean color palette to evoke freshness.",
          "Implemented a 'Quick Add' feature for frequent items.",
          "Used skeleton loaders to improve perceived performance during data fetching.",
        ],
        technicalImplementation: [
          "Used BLoC for predictable state management.",
          "Implemented Dio for efficient API requests and interceptors.",
          "Used Hive for local caching of product data and user preferences.",
        ],
        challenges: [
          ChallengeSolution(
            challenge: "Slow API response for search results.",
            solution:
                "Implemented debouncing on the search input and client-side filtering for already loaded categories.",
          ),
          ChallengeSolution(
            challenge: "Complex cart logic with various discounts.",
            solution:
                "Developed a dedicated calculation engine within the business logic layer to handle complex pricing rules consistently.",
          ),
        ],
        results: [
          "Successfully launched on Play Store and App Store.",
          "Users reported high satisfaction with the ease of use.",
          "App remains smooth and responsive even with thousands of products.",
        ],
        futureImprovements: [
          "Implement voice-activated search.",
          "Add personalized product recommendations based on shopping habits.",
        ],
        screenshots: [
          "https://raw.githubusercontent.com/carbonanik/grocery_app/master/screenshots/home.png",
          "https://raw.githubusercontent.com/carbonanik/grocery_app/master/screenshots/product_detail.png",
          "https://raw.githubusercontent.com/carbonanik/grocery_app/master/screenshots/cart.png",
        ],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/grocery_app/#readme',
          ),
        ],
      ),
      Project(
        name: 'Logic Builder',
        description:
            'Friendly 👋 and lightweight 🎈 tool 🔬 to Design digital logic circuits 🧮',
        tags: ["Flutter"],
        imagePath:
            "https://raw.githubusercontent.com/carbonanik/logic_builder/master/screenshot/logic-builder-logo.png",
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/logic_builder/#readme',
          ),
          ProjectLink(
            name: "Live",
            link: 'https://logic-builder-carbondev.web.app/',
          ),
        ],
      ),
      Project(
        name: 'Portfolio',
        description: "My personal website 🌐 (This site)",
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/portfolio/#readme',
          ),
          ProjectLink(
            name: "Live",
            link: 'https://carbonanik.web.app/',
          ),
        ],
      ),
      Project(
        name: 'Pin Bord',
        description: 'A simple sticky note app 📝',
        tags: ["Flutter", "Firebase"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/pin_bord/#readme',
          ),
          ProjectLink(
            name: "Live",
            link: 'https://pin-bord.web.app/',
          ),
        ],
      ),
    ],
  ),
  ProjectCategory(
    name: 'Kotlin Projects',
    projects: [
      Project(
          name: 'Tally Note',
          description: 'Tally Note is a modern account saving apps. 📝',
          tags: [
            "Kotlin",
            "Firebase"
          ],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/TallyNote/#readme',
            )
          ]),
      Project(name: 'Messapp', description: 'A messenger app 📱', tags: [
        "Kotlin",
        "Python"
      ], links: [
        ProjectLink(
          name: "Github",
          link: 'https://github.com/carbonanik/MessApp/#readme',
        )
      ])
    ],
  ),
  ProjectCategory(
    name: 'Flutter Demos',
    projects: [
      Project(
        name: 'Travel App',
        description: 'A simple travel app 🚗',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          ),
        ],
      ),
      Project(
        name: 'Coffee Shop (Parallax Effect)',
        description: 'A simple coffee shop app 🍵',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          ),
        ],
      ),
      Project(
        name: 'E-Commerce App',
        description: 'A simple e-commerce app 🛒',
        tags: ["Flutter"],
        links: [
          ProjectLink(
            name: "Github",
            link: 'https://github.com/carbonanik/',
          ),
        ],
      ),
      Project(
          name: 'Grocery App (Animation)',
          description: 'A simple grocery app 🛒',
          tags: [
            "Flutter"
          ],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/',
            )
          ]),
      Project(name: 'Ml Kit', description: 'A simple ml kit app 🤖', tags: [
        "Flutter"
      ], links: [
        ProjectLink(
          name: "Github",
          link: 'https://github.com/carbonanik/',
        )
      ]),
      Project(
          name: 'Nested Todos',
          description: 'A simple nested todos app 📝',
          tags: [
            "Flutter"
          ],
          links: [
            ProjectLink(
              name: "Github",
              link: 'https://github.com/carbonanik/',
            )
          ])
    ],
  ),
];

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  int selectedIndex = 0;

  ProjectCategory get selectedCategory => categories[selectedIndex];

  void selectCategory(int index) {
    if (selectedIndex == index) return;
    setState(() => selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = Theme.of(context)
        .colorScheme
        .primary
        .withOpacity(.2); //const Color(0xFF382A04);
    final lineColor = Theme.of(context)
        .colorScheme
        .primary
        .withOpacity(.4); //const Color(0xFF382A04);///backgroundTextColor;

    return PageContainer(
      showClock: true,
      menuItem: 'Work',
      children: [
        Positioned.fill(
          left: context.adaptiveResponsiveWidth(desktop: 100, mobile: 10),
          right: context.adaptiveResponsiveWidth(desktop: 70, mobile: 10),
          top: context.responsiveSize(desktop: 100, tablet: 100, mobile: 80),
          bottom: context.responsiveSize(desktop: 90, tablet: 90, mobile: 84),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _WorkHeader(
                projectCount: categories.fold<int>(
                  0,
                  (count, category) => count + category.projects.length,
                ),
              ),
              SizedBox(height: context.responsiveSize(desktop: 34, mobile: 20)),
              Expanded(
                child: context.isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _CategoryStrip(
                            selectedIndex: selectedIndex,
                            onSelected: selectCategory,
                          ),
                          SizedBox(
                            height: context.responsiveSize(
                              desktop: 0,
                              mobile: 18,
                            ),
                          ),
                          Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 220),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeInCubic,
                              child: _ProjectGrid(
                                key: ValueKey(selectedIndex),
                                category: selectedCategory,
                                borderColor: borderColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: context.responsiveSize(
                              desktop: 300,
                              tablet: 250,
                            ),
                            child: _CategoryRail(
                              lineColor: lineColor,
                              selectedIndex: selectedIndex,
                              onSelected: selectCategory,
                            ),
                          ),
                          SizedBox(
                            width: context.responsiveSize(
                              desktop: 28,
                              tablet: 20,
                            ),
                          ),
                          Expanded(
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 220),
                              switchInCurve: Curves.easeOutCubic,
                              switchOutCurve: Curves.easeInCubic,
                              child: _ProjectGrid(
                                key: ValueKey(selectedIndex),
                                category: selectedCategory,
                                borderColor: borderColor,
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _WorkHeader extends StatelessWidget {
  const _WorkHeader({required this.projectCount});

  final int projectCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.folder_special_rounded,
          color: Theme.of(context).colorScheme.tertiary,
          size: context.adaptiveResponsiveWidth(
            desktop: 70,
            tablet: 54,
            mobile: 44,
          ),
        ),
        SizedBox(width: context.responsiveSize(desktop: 20, mobile: 12)),
        Text(
          "Projects",
          style: titleTwoTextStyle(context).copyWith(
            fontSize: context.adaptiveResponsiveWidth(
              desktop: 32,
              tablet: 30,
              mobile: 26,
            ),
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        SizedBox(width: context.responsiveSize(desktop: 18, mobile: 10)),
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(.25),
            ),
            color: Theme.of(context).colorScheme.primary.withOpacity(.08),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Text(
              "$projectCount files",
              style: subtitleTextStyle(context).copyWith(
                fontSize: context.responsiveSize(
                  desktop: 14,
                  tablet: 13,
                  mobile: 12,
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryRail extends StatelessWidget {
  const _CategoryRail({
    required this.lineColor,
    required this.selectedIndex,
    required this.onSelected,
  });

  final Color lineColor;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(width: 2, color: lineColor),
        const SizedBox(width: 18),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: categories.length,
            separatorBuilder: (context, index) => const SizedBox(height: 14),
            itemBuilder: (context, index) {
              final category = categories[index];
              return _FolderButton(
                category: category,
                selected: selectedIndex == index,
                onTap: () => onSelected(index),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CategoryStrip extends StatelessWidget {
  const _CategoryStrip({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _FolderButton(
            category: category,
            selected: selectedIndex == index,
            compact: true,
            onTap: () => onSelected(index),
          );
        },
      ),
    );
  }
}

class _FolderButton extends StatelessWidget {
  const _FolderButton({
    required this.category,
    required this.selected,
    required this.onTap,
    this.compact = false,
  });

  final ProjectCategory category;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      button: true,
      selected: selected,
      label: category.name,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOutCubic,
          width: compact ? null : double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 12 : 14,
            vertical: compact ? 10 : 14,
          ),
          decoration: BoxDecoration(
            color: selected
                ? colorScheme.primary.withOpacity(.12)
                : colorScheme.background.withOpacity(.22),
            border: Border.all(
              color: selected
                  ? colorScheme.tertiary.withOpacity(.85)
                  : colorScheme.primary.withOpacity(.18),
            ),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
            children: [
              Icon(
                selected ? Icons.folder_open_rounded : Icons.folder_rounded,
                color: selected ? colorScheme.tertiary : colorScheme.primary,
                size: context.responsiveSize(
                  desktop: 28,
                  tablet: 26,
                  mobile: 22,
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  category.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: titleTwoTextStyle(context).copyWith(
                    fontSize: context.responsiveSize(
                      desktop: 18,
                      tablet: 16,
                      mobile: 14,
                    ),
                    fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
                    color:
                        selected ? colorScheme.tertiary : colorScheme.primary,
                  ),
                ),
              ),
              if (!compact) ...[
                const SizedBox(width: 8),
                Text(
                  category.projects.length.toString().padLeft(2, "0"),
                  style: subtitleTextStyle(context).copyWith(
                    fontSize: 12,
                    color: colorScheme.inversePrimary.withOpacity(.7),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid({
    super.key,
    required this.category,
    required this.borderColor,
  });

  final ProjectCategory category;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = context.responsiveSize(
          desktop: 24,
          tablet: 20,
          mobile: 16,
        );
        final columns = context.isMobile
            ? 1
            : constraints.maxWidth > 980
                ? 2
                : 1;
        final cardWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        final cardHeight = context.responsiveSize(
          desktop: 360,
          tablet: 330,
          mobile: 278,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SelectedFolderTitle(category: category),
            SizedBox(height: context.responsiveSize(desktop: 22, mobile: 14)),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.only(
                  right: context.isMobile ? 0 : 16,
                  bottom: 24,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  mainAxisExtent: cardHeight,
                ),
                itemCount: category.projects.length,
                itemBuilder: (context, index) {
                  return RepaintBoundary(
                    child: ProjectItemView(
                      project: category.projects[index],
                      borderColor: borderColor,
                      width: cardWidth,
                      height: cardHeight,
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SelectedFolderTitle extends StatelessWidget {
  const _SelectedFolderTitle({required this.category});

  final ProjectCategory category;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        Icon(
          Icons.folder_open_rounded,
          color: colorScheme.tertiary,
          size: context.responsiveSize(desktop: 34, tablet: 30, mobile: 26),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            category.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: titleTwoTextStyle(context).copyWith(
              color: colorScheme.tertiary,
              fontWeight: FontWeight.bold,
              fontSize: context.responsiveSize(
                desktop: 24,
                tablet: 22,
                mobile: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "${category.projects.length} projects",
          style: subtitleTextStyle(context).copyWith(
            fontSize: context.responsiveSize(
              desktop: 14,
              tablet: 13,
              mobile: 12,
            ),
            color: colorScheme.inversePrimary.withOpacity(.65),
          ),
        ),
      ],
    );
  }
}
