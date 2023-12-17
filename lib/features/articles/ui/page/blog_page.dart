import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/articles/state/provider/filtered_article_provider.dart';
import 'package:portfolio/features/articles/state/provider/search_text_provider.dart';
import 'package:portfolio/features/articles/state/provider/selected_tag_provider.dart';
import 'package:portfolio/features/articles/state/provider/tag_provider.dart';
import 'package:portfolio/features/articles/ui/widgets/article_item_v2.dart';
import 'package:portfolio/features/common/ui/widgets/input_field.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/menu_content_page.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/common/ui/widgets/scrollable_row.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/typography.dart';
import 'package:supercharged/supercharged.dart';

@RoutePage()
class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

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

  // List<String> selectedSearchTags = ["Python"];

  bool subtitleCursor = true;

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
        if (_blinkAnimation.value > 1) {
          setState(() {
            subtitleCursor = false;
          });
        } else {
          setState(() {
            subtitleCursor = true;
          });
        }
      });

    _titleAnimationController.forward();

    _blinkAnimationController.repeat();
  }

  @override
  void dispose() {
    _titleAnimationController.dispose();
    _blinkAnimationController.dispose();
    super.dispose();
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
            padding: const EdgeInsets.only(top: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: width,
                ),
                if (!context.isMobile) const SizedBox(height: 40),
                // ? Title & Subtitle
                Padding(
                  padding: EdgeInsets.only(
                    left: context.adaptiveResponsiveWidth(desktop: 100, tablet: 100, mobile: 40),
                    right: context.adaptiveResponsiveWidth(desktop: 100, tablet: 100, mobile: 40),
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
                            fontSize: context.adaptiveResponsiveWidth(desktop: 56),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // ? Subtitle
                      Text(
                        subtitle.substring(0, _titleAnimation.value.toInt()) +
                            (_titleAnimationController.isAnimating || subtitleCursor ? "_" : ""),
                        style: subtitleTextStyle.copyWith(
                          height: 1.5,
                          fontSize: context.adaptiveResponsiveWidth(desktop: subtitleTextStyle.fontSize!),
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
              Consumer(builder: (context, ref, child) {
                final articles = ref.watch(searchedArticleProvider);
                return Container(
                  padding:
                      EdgeInsets.only(left: 20, right: context.responsiveSize(desktop: 50, tablet: 50, mobile: 20)),
                  // ? Horizontal list of article
                  child: ScrollableRow(
                    contentHeight: context.isMobile
                        ? context.adaptiveResponsiveWidth(desktop: 0, mobile: 240)
                        : context.adaptiveResponsiveHeight(desktop: 400, tablet: 300),
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          SizedBox(width: context.adaptiveResponsiveHeight(desktop: 60, mobile: 20)),
                          ArticleItemV2(
                            article: articles[index],
                            blobHoverEffect: (data) {
                              setState(() {
                                blobHoverData = data;
                              });
                            },
                          ),
                          //
                        ],
                      );
                    },
                  ),
                );
              }),
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
                width: context.adaptiveResponsiveWidth(desktop: 600, tablet: 600, mobile: 300),
                child: Consumer(builder: (context, ref, child) {
                  return InputField(
                    hint: "Search",
                    onChanged: (value) {
                      ref.read(searchTextProvider.notifier).state = value;
                    },
                  );
                }),
              ),
              const SizedBox(height: 10),
              Container(
                width: context.isMobile ? width : null,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Consumer(builder: (context, ref, child) {
                    final tags = ref.read(tagProvider);
                    return Row(
                      children: [
                        ...List.generate(
                          tags.length,
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
                                  Consumer(builder: (context, ref, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (ref.read(selectedTagProvider).contains(tags[index])) {
                                          final selectedSearchTags = ref.read(selectedTagProvider)..remove(tags[index]);
                                          ref.read(selectedTagProvider.notifier).state = [...selectedSearchTags];
                                        } else {
                                          ref.read(selectedTagProvider.notifier).state = [
                                            ...ref.read(selectedTagProvider),
                                            tags[index]
                                          ];
                                        }
                                      },
                                      child: Container(
                                        transform: ref.read(selectedTagProvider).contains(tags[index])
                                            ? Matrix4.translationValues(-1, -1, 0)
                                            : Matrix4.translationValues(-3, -3, 0),
                                        padding: const EdgeInsets.all(6.0),
                                        color: ref.read(selectedTagProvider).contains(tags[index])
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
                                            Text(tags[index]),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ],
                              ),
                              const SizedBox(width: 8.0),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
