import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/page_container.dart';
import 'package:portfolio/features/projects/models/project.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return PageContainer(
      menuItem: 'Project Detail',
      children: [
        Positioned.fill(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal:
                  context.adaptiveResponsiveWidth(desktop: 100, mobile: 20),
              vertical:
                  context.responsiveSize(desktop: 100, tablet: 100, mobile: 80),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ? Back Button
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(Icons.arrow_back),
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                const Gap(20),

                // ? Header Section
                Text(
                  project.name,
                  style: titleOneTextStyle(context).copyWith(
                    fontSize: context.adaptiveResponsiveWidth(
                        desktop: 64, mobile: 32),
                  ),
                ),
                const Gap(10),
                Text(
                  project.description,
                  style: paragraphTextStyle(context),
                ),
                const Gap(40),

                // ? Overview Section
                _SectionTitle(title: 'Overview'),
                _InfoRow(label: 'Platform', value: project.platform ?? 'N/A'),
                _InfoRow(label: 'Role', value: project.role ?? 'N/A'),
                _InfoRow(label: 'Tech Stack', value: project.tags.join(', ')),
                const Gap(40),

                // ? Problem Statement
                if (project.problemStatement != null) ...[
                  _SectionTitle(title: 'Problem Statement'),
                  Text(
                    project.problemStatement!,
                    style: paragraphTextStyle(context),
                  ),
                  const Gap(40),
                ],

                // ? Goals & Constraints
                if (project.goals != null || project.constraints != null) ...[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (project.goals != null)
                        Expanded(
                          child: _BulletSection(
                            title: 'Goals',
                            items: project.goals!,
                          ),
                        ),
                      if (project.constraints != null)
                        Expanded(
                          child: _BulletSection(
                            title: 'Constraints',
                            items: project.constraints!,
                          ),
                        ),
                    ],
                  ),
                  const Gap(40),
                ],

                // ? Thinking Process
                if (project.thinkingProcess != null) ...[
                  _BulletSection(
                    title: 'Thinking Process',
                    items: project.thinkingProcess!,
                  ),
                  const Gap(40),
                ],

                // ? Design Decisions
                if (project.designDecisions != null) ...[
                  _BulletSection(
                    title: 'Design Decisions',
                    items: project.designDecisions!,
                  ),
                  const Gap(40),
                ],

                // ? Screenshots
                if (project.screenshots != null) ...[
                  _SectionTitle(title: 'Screenshots'),
                  const Gap(20),
                  SizedBox(
                    height: 400,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: project.screenshots!.length,
                      separatorBuilder: (context, index) => const Gap(20),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            project.screenshots![index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  const Gap(40),
                ],

                // ? Technical Implementation
                if (project.technicalImplementation != null) ...[
                  _BulletSection(
                    title: 'Technical Implementation',
                    items: project.technicalImplementation!,
                  ),
                  const Gap(40),
                ],

                // ? Challenges & Solutions
                if (project.challenges != null) ...[
                  _SectionTitle(title: 'Challenges & Solutions'),
                  const Gap(20),
                  ...project.challenges!
                      .map((c) => _ChallengeCard(challenge: c)),
                  const Gap(40),
                ],

                // ? Results
                if (project.results != null) ...[
                  _BulletSection(
                    title: 'Results',
                    items: project.results!,
                  ),
                  const Gap(40),
                ],

                // ? Future Improvements
                if (project.futureImprovements != null) ...[
                  _BulletSection(
                    title: 'Future Improvements',
                    items: project.futureImprovements!,
                  ),
                  const Gap(40),
                ],

                // ? Links
                if (project.links.isNotEmpty) ...[
                  _SectionTitle(title: 'Links'),
                  Row(
                    children: project.links
                        .map((link) => Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  await launchUrl(Uri.parse(link.link));
                                },
                                icon: Icon(
                                    link.name.toLowerCase().contains('github')
                                        ? Icons.code
                                        : Icons.launch),
                                label: Text(link.name),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onTertiary,
                                ),
                              ),
                            ))
                        .toList(),
                  ),
                  const Gap(40),
                ],

                const Gap(100), // Bottom padding
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: subtitleTextStyle(context).copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        const Gap(8),
        Container(
          width: 40,
          height: 2,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        const Gap(16),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              "$label:",
              style: subtitleTextStyle(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: paragraphTextStyle(context).copyWith(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletSection extends StatelessWidget {
  const _BulletSection({required this.title, required this.items});
  final String title;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitle(title: title),
        ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("• ", style: paragraphTextStyle(context)),
                  Expanded(
                    child: Text(
                      item,
                      style: paragraphTextStyle(context).copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  const _ChallengeCard({required this.challenge});
  final ChallengeSolution challenge;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Challenge:",
            style: subtitleTextStyle(context).copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const Gap(8),
          Text(
            challenge.challenge,
            style: paragraphTextStyle(context).copyWith(fontSize: 18),
          ),
          const Gap(16),
          Text(
            "Solution:",
            style: subtitleTextStyle(context).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.green, // Or another prominent color
            ),
          ),
          const Gap(8),
          Text(
            challenge.solution,
            style: paragraphTextStyle(context).copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
