import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/common/input_field.dart';
import 'package:portfolio/common/menu_content_page.dart';
import 'package:portfolio/common/widget/article_item.dart';
import 'package:portfolio/common/widget/project_item.dart';
import 'package:portfolio/ext.dart';
import 'package:portfolio/page/menu/work/project_scrollable_row.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

final searchTagList = [
  "Python",
  "Flutter",
  "Javascript",
  "Linux",
  "Docker",
  "Database",
];

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> with TickerProviderStateMixin {
  BlobHoverData blobHoverData = const BlobHoverData.initial();
  late AnimationController _titleAnimationController;
  late AnimationController _blinkAnimationController;
  late Animation<double> _titleAnimation;
  late Animation<double> _blinkAnimation;

  final subtitle = "Python tutorial for everyone. if your are a noob this is for you. \nif you are a pro go home.";
  List<String> selectedSearchTags = ["Python"];

  @override
  void initState() {
    super.initState();
    _titleAnimationController = AnimationController(duration: 1000.milliseconds, vsync: this);
    _blinkAnimationController = AnimationController(duration: 1000.milliseconds, vsync: this);

    _titleAnimation = Tween<double>(
      begin: 0,
      end: subtitle.length.toDouble(),
    ).animate(_titleAnimationController)
      ..addListener(() {
        setState(() {});
      });

    _blinkAnimation = Tween<double>(
      begin: 0,
      end: 2,
    ).animate(_blinkAnimationController)
      ..addListener(() {
        setState(() {});
      });

    _titleAnimationController.forward();

    _blinkAnimationController.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    _titleAnimationController.dispose();
    _blinkAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return PageContainer(
      menuItem: "Blog",
      blobHoverData: blobHoverData,
      children: [
        Positioned(
          child: Padding(
            padding: EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!context.isMobile) const SizedBox(height: 40),
                // ? Title & Subtitle
                Padding(
                  padding: EdgeInsets.only(
                    left: context.responsiveSize(desktop: 100, tablet: 100, mobile: 40),
                    right: context.responsiveSize(desktop: 100, tablet: 100, mobile: 40),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ? Title
                      MouseRegion(
                        onEnter: (event) {
                          if (!_titleAnimationController.isAnimating) {
                            _titleAnimationController.reset();
                            _titleAnimationController.forward();
                          }
                        },
                        child: Text(
                          "Read Articles",
                          style: titleOneTextStyle.copyWith(
                            fontSize: context.responsiveSize(desktop: 56),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // ? Subtitle
                      SizedBox(
                        height: context.responsiveSize(desktop: 55),
                        child: Text(
                          subtitle.substring(0, _titleAnimation.value.toInt()) +
                              (_titleAnimationController.isAnimating || _blinkAnimation.value < 1 ? "_" : ""),
                          style: subtitleTextStyle.copyWith(
                            height: 1.5,
                            fontSize: context.responsiveSize(desktop: subtitleTextStyle.fontSize!),
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: appColors.accentColor,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: height * .06),
                // ? Article list place
              ],
            ),
          ),
        ),
        Positioned.fill(
          child: Column(
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 50),
                child: ScrollableRow(
                  contentHeight: context.responsiveSize(desktop: 400, tablet: 400, mobile: 300),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        SizedBox(width: context.responsiveSize(desktop: 60, mobile: 20)),
                        const ArticleItem(),
                      ],
                    );
                  },
                ),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
        Positioned(
          bottom: height * 0.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: context.responsiveSize(desktop: 600, tablet: 600, mobile: 300),
                child: const InputField(
                  hint: "Search",
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: context.isMobile ? width : null,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: [
                      ...List.generate(
                        searchTagList.length,
                        (index) => Row(
                          children: [
                            Stack(
                              children: [
                                Positioned.fill(
                                  child: Container(
                                    padding: const EdgeInsets.all(6.0),
                                    color: appColors.accentColor.darken(30),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (selectedSearchTags.contains(searchTagList[index])) {
                                        selectedSearchTags.remove(searchTagList[index]);
                                      } else {
                                        selectedSearchTags.add(searchTagList[index]);
                                      }
                                    });
                                  },
                                  child: Container(
                                    transform: selectedSearchTags.contains(searchTagList[index])
                                        ? Matrix4.translationValues(-1, -1, 0)
                                        : Matrix4.translationValues(-3, -3, 0),
                                    padding: const EdgeInsets.all(6.0),
                                    color: selectedSearchTags.contains(searchTagList[index])
                                        ? appColors.accentColor.darken(80)
                                        : appColors.accentColor.darken(60),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.sell,
                                          color: appColors.accentColor.darken(30),
                                          size: 14,
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(searchTagList[index]),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 8.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
