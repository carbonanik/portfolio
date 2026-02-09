import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/features/common/provider/blob_data_provider.dart';
import 'package:portfolio/features/common/ui/widgets/arc_text.dart';
import 'package:portfolio/features/common/ui/widgets/step_text.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/gen/fonts.gen.dart';
import 'package:portfolio/core/theme/typography.dart';
import 'package:sa4_migration_kit/sa4_migration_kit.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/features/common/ui/widgets/corner_cut_style_button.dart';

enum AnimProps {
  // Over Title
  topTitleReduceRightMargin,
  topTitleIncreaseLeftMargin,
  // Title
  titleReduceRightMargin,
  titleIncreaseLeftMargin,
  // Subtitle
  subtitleReduceRightMargin,
  subtitleIncreaseLeftMargin,
  // Description
  descriptionReduceRightMargin,
  descriptionIncreaseLeftMargin,
  // Button
  buttonReduceRightMargin,
  buttonIncreaseLeftMargin,
}

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> with TickerProviderStateMixin {
  late AnimationController _timeLineController;
  late Animation<TimelineValue<AnimProps>> animation;
  late Timer _startTimer;

  @override
  void initState() {
    super.initState();

    _timeLineController =
        AnimationController(duration: 1600.milliseconds, vsync: this);
    animation = TimelineTween<AnimProps>()
        // Over Title
        .addScene(
            begin: 0.milliseconds, end: 100.milliseconds, curve: Curves.ease)
        .animate(AnimProps.topTitleReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.topTitleIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))

        // Title
        .addSubsequentScene(
            delay: -175.milliseconds,
            duration: 100.milliseconds,
            curve: Curves.ease)
        .animate(AnimProps.titleReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.titleIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))

        // subtitle
        .addSubsequentScene(
            delay: -175.milliseconds,
            duration: 100.milliseconds,
            curve: Curves.ease)
        .animate(AnimProps.subtitleReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.subtitleIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))

        // description
        .addSubsequentScene(
            delay: -175.milliseconds,
            duration: 100.milliseconds,
            curve: Curves.ease)
        .animate(AnimProps.descriptionReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.descriptionIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))

        // button
        .addSubsequentScene(
            delay: 0.milliseconds,
            duration: 100.milliseconds,
            curve: Curves.ease)
        .animate(AnimProps.buttonReduceRightMargin,
            tween: Tween(begin: 1000.0, end: 0.0))
        .addSubsequentScene(delay: 25.milliseconds, duration: 100.milliseconds)
        .animate(AnimProps.buttonIncreaseLeftMargin,
            tween: Tween(begin: 0.0, end: 1000.0))
        //
        .parent
        .animatedBy(_timeLineController);

    _startTimer = Timer(700.milliseconds, () {
      _timeLineController.forward();
    });
  }

  @override
  void dispose() {
    _startTimer.cancel();
    _timeLineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedBuilder(
            animation: _timeLineController, builder: _buildAnimation),
      ],
    );
  }

  Widget _buildAnimation(BuildContext context, Widget? child) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ? hi
        _animatedAppear(
          child: Consumer(builder: (context, ref, child) {
            return MouseRegion(
              onEnter: (hovering) {
                ref.read(blobDataProvider.notifier).update(
                      color: Theme.of(context).colorScheme.tertiary,
                      size: context.responsiveSize(desktop: 200),
                    );
              },
              onExit: (event) {
                ref.read(blobDataProvider.notifier).reset();
              },
              child: SizedBox(
                width: context.responsiveSize(desktop: 400),
                child: Text(
                  "Hi,",
                  style: titleTwoTextStyle(context).copyWith(
                    fontSize: context.responsiveSize(
                        desktop: titleTwoTextStyle(context).fontSize!),
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          reduceRightMargin:
              animation.value.get(AnimProps.topTitleReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.topTitleIncreaseLeftMargin),
          context: context,
        ),
        // ? Title
        _animatedAppear(
          child: Consumer(builder: (context, ref, child) {
            return MouseRegion(
              onEnter: (hovering) {
                ref.read(blobDataProvider.notifier).update(
                      color: Theme.of(context).colorScheme.primary,
                      size: context.responsiveSize(desktop: 400),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ArcText(
                            radius: context.responsiveSize(desktop: 120),
                            text: "Hey! I Am Anik.   Click the Click me!",
                            textStyle: titleOneTextStyle(context).copyWith(
                              color: Theme.of(context).colorScheme.secondary,
                              fontSize: context.responsiveSize(desktop: 44),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: SvgPicture.asset(
                              Assets.image.flutter,
                              colorFilter: ColorFilter.mode(
                                Theme.of(context).colorScheme.secondary,
                                BlendMode.srcIn,
                              ),
                              width: context.responsiveSize(desktop: 180),
                            ),
                          )
                        ],
                      ),
                    );
              },
              onExit: (event) {
                ref.read(blobDataProvider.notifier).reset();
              },
              child: StepText(
                text: "I am Anik.",
                style: titleOneTextStyle(context).copyWith(
                  fontSize: context.responsiveSize(
                      desktop: titleOneTextStyle(context).fontSize!),
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Theme.of(context)
                          .colorScheme
                          .tertiary
                          .withOpacity(.5),
                    ),
                  ],
                  fontFamily: FontFamily.iBMPlexMono,
                  wordSpacing: -20,
                ),
              ),
            );
          }),
          reduceRightMargin:
              animation.value.get(AnimProps.titleReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.titleIncreaseLeftMargin),
          boxColor: Theme.of(context).colorScheme.tertiary,
          context: context,
        ),
        // ? Subtitle
        _animatedAppear(
          child: SizedBox(
            width: size.width / 3 + 200,
            child: Text(
              "a coder, breaker, fixer.",
              style: subtitleTextStyle(context).copyWith(
                fontSize: context.responsiveSize(
                    desktop: subtitleTextStyle(context).fontSize!),
                shadows: [
                  Shadow(
                    blurRadius: 10,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
          reduceRightMargin:
              animation.value.get(AnimProps.subtitleReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.subtitleIncreaseLeftMargin),
          context: context,
        ),
        const SizedBox(height: 50),
        // ? Description
        _animatedAppear(
          child: SizedBox(
            width: size.width / 3 + 150,
            child: Text(
              "I’m a software engineer specializing in building (and occasionally designing) "
              "exceptional digital experiences. Currently, I’m focused on building accessible, "
              "human-centered products.",
              style: paragraphTextStyle(context).copyWith(
                fontSize: context.responsiveSize(
                    desktop: paragraphTextStyle(context).fontSize!),
              ),
            ),
          ),
          reduceRightMargin:
              animation.value.get(AnimProps.descriptionReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.descriptionIncreaseLeftMargin),
          boxColor: Theme.of(context).colorScheme.inversePrimary,
          context: context,
        ),
        const SizedBox(height: 50),
        // ? Button
        _animatedAppear(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: CornerCutButton(
              onTap: () => showDialog(context: context, builder: buildDialog),
              text: "Click me!",
            ),
          ),
          reduceRightMargin:
              animation.value.get(AnimProps.buttonReduceRightMargin),
          increaseLeftMargin:
              animation.value.get(AnimProps.buttonIncreaseLeftMargin),
          boxColor: Theme.of(context).colorScheme.inversePrimary,
          context: context,
        ),
      ],
    );
  }
}

Widget _animatedAppear({
  required Widget child,
  required reduceRightMargin,
  required increaseLeftMargin,
  Color? boxColor,
  required BuildContext context,
}) {
  return Stack(
    children: [
      Opacity(
        opacity: reduceRightMargin != 0 ? 0.0 : 1.0,
        child: child,
      ),
      Positioned.fill(
        child: Container(
          margin: EdgeInsets.only(
            right: reduceRightMargin,
            left: increaseLeftMargin,
          ),
          color: boxColor ?? Theme.of(context).colorScheme.primary,
        ),
      ),
    ],
  );
}

Widget buildDialog(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Resume",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.close,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      surfaceTintColor: Colors.grey,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.inversePrimary,
          width: 2,
        ),
      ),
      content: Container(
        padding: EdgeInsets.symmetric(
            horizontal:
                context.responsiveSize(desktop: 100, tablet: 50, mobile: 20)),
        height: height - 200,
        width: context.responsiveSize(desktop: 1000, tablet: 600, mobile: 200),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "SHEIKH ANIK",
                        style: titleOneTextStyle(context).copyWith(
                          fontSize: context.responsiveSize(
                              desktop: 40, tablet: 36, mobile: 30),
                          fontFamily: FontFamily.iBMPlexMono,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Flutter Developer",
                        style: paragraphTextStyle(context).copyWith(
                            fontSize: context.responsiveSize(desktop: 24),
                            fontFamily: FontFamily.iBMPlexMono,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SvgPicture.asset(Assets.image.flutter,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.inversePrimary,
                              BlendMode.srcIn),
                          width: context.responsiveSize(
                              desktop: 50, tablet: 40, mobile: 30),
                          height: context.responsiveSize(
                              desktop: 50, tablet: 40, mobile: 30),
                          semanticsLabel: 'logo'),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Enthusiastic App developer with 3+ years of experience cooking up clean code for fast-paced businesses. "
                        "Excited to jazz up products and whip up awesome user experiences.",
                        style: paragraphTextStyle(context).copyWith(
                          fontSize:
                              context.responsiveSize(desktop: fontSize_22),
                          fontFamily: FontFamily.cabin,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "PROFESSIONAL SKILLS",
                        style: titleOneTextStyle(context).copyWith(
                            fontSize: context.responsiveSize(desktop: 32),
                            fontFamily: FontFamily.iBMPlexMono),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        """I've built 20+ Flutter (Dart) apps and seamlessly integrated native development. Proficient in Provider, RiverPod, SQFLite, Hive, Freezed, and more for Flutter dependencies. Embrace modern app development with clean architecture.
      
      Backend-wise, I leverage Python for development, automation, and backups, while SQL (Postgres) is my playground for crafting schemas and powerful queries. Docker is my go-to for smooth deployment, complemented by a robust CI/CD pipeline.
      
      In the automation realm, I wield Jenkins, Ansible, and ShellScript for tasks like CI/CD and backups. Command-line proficiency in Linux is second nature to me.
                        """,
                        style: paragraphTextStyle(context).copyWith(
                          fontSize:
                              context.responsiveSize(desktop: fontSize_22),
                          fontFamily: FontFamily.cabin,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.image.firebase,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.inversePrimary,
                                  BlendMode.srcIn),
                              width: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              height: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              semanticsLabel: 'firebase',
                            ),
                            const Gap(20),
                            SvgPicture.asset(
                              Assets.image.python,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.inversePrimary,
                                  BlendMode.srcIn),
                              width: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              height: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              semanticsLabel: 'python',
                            ),
                            const Gap(20),
                            SvgPicture.asset(
                              Assets.image.postgres,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.inversePrimary,
                                  BlendMode.srcIn),
                              width: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              height: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              semanticsLabel: 'postgres',
                            ),
                            const Gap(20),
                            SvgPicture.asset(
                              Assets.image.docker,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.inversePrimary,
                                  BlendMode.srcIn),
                              width: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              height: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              semanticsLabel: 'docker',
                            ),
                            const Gap(20),
                            SvgPicture.asset(
                              Assets.image.linux,
                              colorFilter: ColorFilter.mode(
                                  Theme.of(context).colorScheme.inversePrimary,
                                  BlendMode.srcIn),
                              width: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              height: context.responsiveSize(
                                  desktop: 50, tablet: 40, mobile: 30),
                              semanticsLabel: 'linux',
                            ),
                          ]),
                      const SizedBox(
                        height: 40,
                      ),
                      // Text(
                      //   "EDUCATION",
                      //   style: titleOneTextStyle(context).copyWith(
                      //     fontSize: context.responsiveSize(desktop: 24),
                      //     fontFamily: FontFamily.iBMPlexMono,
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   "Diploma in electronics",
                      //   style: paragraphTextStyle(context).copyWith(
                      //       fontSize:
                      //           context.responsiveSize(desktop: fontSize_18),
                      //       fontFamily: FontFamily.iBMPlexMono),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Text(
                      //   "BSc in Computer Science",
                      //   style: paragraphTextStyle(context).copyWith(
                      //       fontSize:
                      //           context.responsiveSize(desktop: fontSize_18),
                      //       fontFamily: FontFamily.iBMPlexMono),
                      // ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: CornerCutButton(
                text: "Download",
                onTap: () async {
                  await launchUrl(
                    Uri.parse(
                        "https://docs.google.com/document/d/1JAdnnn9_ftkRjSac_MsAsUhtbGmW7iX3yraUi5xn8GU/export?format=pdf"),
                  );
                },
              ),
            )
          ],
        ),
      ));
}
