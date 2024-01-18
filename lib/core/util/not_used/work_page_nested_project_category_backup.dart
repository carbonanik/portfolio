//
//
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:portfolio/common/page_container.dart';
// import 'package:portfolio/common/paths/color_splash_painter.dart';
// import 'package:portfolio/common/paths/corner_cut_border_clipper.dart';
// import 'package:portfolio/common/paths/dotted_circle_painter.dart';
// import 'package:portfolio/common/widget/corner_cut_style_button.dart';
// import 'package:portfolio/gen/assets.gen.dart';
// import 'package:portfolio/theme/colors.dart';
// import 'package:portfolio/theme/typography.dart';
// import 'package:supercharged/supercharged.dart';
//
// class ProjectCategory {
//   final String name;
//   final List<Project> projects;
//   final List<ProjectCategory> subCategories;
//
//   ProjectCategory({
//     required this.name,
//     required this.projects,
//     required this.subCategories,
//   });
// }
//
// class Project {
//   final String name;
//   final String description;
//   final String imagePath;
//   final String link;
//
//   Project({
//     required this.name,
//     required this.description,
//     required this.imagePath,
//     required this.link,
//   });
// }
//
// final categories = [
//   ProjectCategory(
//     name: 'Complete Project',
//     subCategories: [
//       ProjectCategory(
//         name: 'Apps',
//         subCategories: [],
//         projects: [
//           Project(
//             name: 'E-Commerce',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//           Project(
//             name: 'Portfolio',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//           Project(
//             name: 'Logic Sim',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//         ],
//       ),
//       ProjectCategory(
//         name: 'Websites',
//         subCategories: [],
//         projects: [
//           Project(
//             name: 'E-Commerce',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//           Project(
//             name: 'Portfolio',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//           Project(
//             name: 'Logic Sim',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//         ],
//       ),
//       ProjectCategory(
//         name: 'Tools',
//         subCategories: [],
//         projects: [
//           Project(
//             name: 'E-Commerce',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//           Project(
//             name: 'Portfolio',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//           Project(
//             name: 'Logic Sim',
//             description: 'Description',
//             imagePath: Assets.image.banner.path,
//             link: 'https://www.google.com',
//           ),
//         ],
//       ),
//     ],
//     projects: [],
//   ),
//   ProjectCategory(
//     name: 'Demos',
//     subCategories: [],
//     projects: [
//       Project(
//         name: 'Weather App',
//         description: 'Description',
//         imagePath: Assets.image.banner.path,
//         link: 'https://www.google.com',
//       ),
//     ],
//   ),
//   ProjectCategory(
//     name: 'Working On',
//     subCategories: [],
//     projects: [
//       Project(
//         name: 'Project 1',
//         description: 'Description',
//         imagePath: Assets.image.banner.path,
//         link: 'https://www.google.com',
//       ),
//       Project(
//         name: 'Project 2',
//         description: 'Description',
//         imagePath: Assets.image.banner.path,
//         link: 'https://www.google.com',
//       ),
//     ],
//   ),
// ];
//
// class WorkPage2 extends StatefulWidget {
//   const WorkPage2({Key? key}) : super(key: key);
//
//   @override
//   State<WorkPage2> createState() => _WorkPageState();
// }
//
// class _WorkPageState extends State<WorkPage2> with TickerProviderStateMixin {
//   late AnimationController _nextButtonController;
//
//   bool isLoading = false;
//   final borderColor = Theme.of(context).colorScheme.primary.withOpacity(.2);
//   final lineColor = Theme.of(context).colorScheme.primary.withOpacity(.4);
//   final lineWidth = 2.0;
//   BlobHoverData blobHoverData = const BlobHoverData.initial();
//   Map<String, int> selectedIndexes = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _nextButtonController = AnimationController(duration: 10.seconds, vsync: this);
//     _nextButtonController.repeat();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return MenuContentPage(
//       blobHoverData: blobHoverData,
//       showClock: false,
//       menuItem: 'Work',
//       isLoading: isLoading,
//       children: [
//         Positioned(
//           left: 0,
//           top: 100,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 100),
//                   child: Row(
//                     children: [
//                       Icon(
//                         Icons.folder,
//                         color: Theme.of(context).colorScheme.tertiary,
//                         size: 70,
//                       ),
//                       const SizedBox(width: 20),
//                       // ? The project title
//                       Text(
//                         "Projects",
//                         style: titleTwoTextStyle(context) .copyWith(
//                           fontSize: 32,
//                           fontWeight: FontWeight.bold,
//                           color: Theme.of(context).colorScheme.tertiary,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 buildCategoryList(height, width, categories, "projects"),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget buildCategoryList(double height, double width, List<ProjectCategory> categories, String parentId) {
//     if (selectedIndexes[parentId] == null) {
//       selectedIndexes[parentId] = -1;
//     }
//     return IntrinsicHeight(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(width: 134),
//           // ? The side line of categories
//           Container(
//             width: lineWidth,
//             color: lineColor,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: List.generate(
//               categories.length,
//               // ? The category item
//               (index) => buildProjectCategoryItem(
//                 selectedIndex: selectedIndexes[parentId] ?? -1,
//                 onTap: (index) {
//                   selectedIndexes[parentId] = (index == selectedIndexes[parentId] ? -1 : index);
//                   setState(() {});
//                 },
//                 index: index,
//                 category: categories[index],
//                 width: width - 200,
//                 height: 100,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildProjectCategoryItem({
//     required int index,
//     required int selectedIndex,
//     required Function(int index) onTap,
//     required ProjectCategory category,
//     required double width,
//     required double height,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         SizedBox(
//           height: height,
//           child: Row(
//             children: [
//               // ? Connector line from The side line
//               Container(
//                 width: 100,
//                 height: lineWidth,
//                 color: lineColor,
//               ),
//
//               /// ? Project category view
//               GestureDetector(
//                 onTap: () {
//                   onTap(index);
//                 },
//                 child: Row(
//                   children: [
//                     Icon(
//                       index == selectedIndex ? Icons.folder_copy : Icons.folder,
//                       color: Theme.of(context).colorScheme.tertiary,
//                       size: 55,
//                     ),
//                     const SizedBox(width: 20),
//                     Text(
//                       category.name,
//                       style: titleTwoTextStyle(context) .copyWith(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         color: Theme.of(context).colorScheme.tertiary,
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           width: width,
//           child: index == selectedIndex // ? If the category is selected
//               ? category.subCategories.isEmpty
//                   // ? Project Row inside category
//                   ? Column(
//                       children: [
//                         const SizedBox(height: 40),
//                         SingleChildScrollView(
//                           scrollDirection: Axis.horizontal,
//                           child: Row(
//                             children: [
//                               const SizedBox(width: 40),
//                               buildAnimatedNextButton(1),
//                               // ? list of project items
//                               ...List.generate(
//                                 category.projects.length,
//                                 (index) => Row(
//                                   children: [
//                                     const SizedBox(width: 60),
//                                     ProjectItem(project: category.projects[index], borderColor: borderColor),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(width: 60),
//                               buildAnimatedNextButton(3),
//                             ],
//                           ),
//                         ),
//                       ],
//                     )
//                   // ? Nested Category List inside category
//                   : buildCategoryList(
//                       category.subCategories.length * 100,
//                       width,
//                       category.subCategories,
//                       category.name,
//                     )
//               : const SizedBox(),
//         ),
//       ],
//     );
//   }
//
//   Widget buildAnimatedNextButton(int turns) {
//     return SizedBox(
//       height: 60,
//       width: 60,
//       child: Stack(
//         children: [
//           AnimatedBuilder(
//             animation: _nextButtonController,
//             builder: (context, child) {
//               return Transform.rotate(
//                 angle: _nextButtonController.value * 2.0 * pi,
//                 child: CustomPaint(
//                   painter: DottedCirclePainter(color: lineColor),
//                   child: Container(),
//                 ),
//               );
//             },
//           ),
//           MouseRegion(
//             onEnter: (_) {
//               _nextButtonController.duration = 2.seconds;
//               _nextButtonController.repeat();
//             },
//             onExit: (_) {
//               _nextButtonController.duration = 10.seconds;
//               _nextButtonController.repeat();
//             },
//             child: RawMaterialButton(
//               onPressed: () {},
//               elevation: 2.0,
//               fillColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
//               padding: const EdgeInsets.all(15.0),
//               shape: const CircleBorder(),
//               child: RotatedBox(
//                 quarterTurns: turns,
//                 child: Icon(
//                   Icons.keyboard_double_arrow_down_rounded,
//                   size: 30.0,
//                   color: lineColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// class ProjectItem extends StatefulWidget {
//   const ProjectItem({
//     this.blobHoverEffect,
//     this.leftItem = true,
//     this.borderColor,
//     Key? key,
//     required this.project,
//   }) : super(key: key);
//
//   final bool leftItem;
//   final void Function(BlobHoverData data)? blobHoverEffect;
//   final Color? borderColor;
//   final Project project;
//
//   @override
//   State<ProjectItem> createState() => _ProjectItemState();
// }
//
// class _ProjectItemState extends State<ProjectItem> with TickerProviderStateMixin {
//   bool imageHovered = false;
//   bool hovered = false;
//
//   // String title = widget.project.name;
//   final defaultBorderColor = Theme.of(context).colorScheme.primary.withOpacity(.2);
//
//   late AnimationController _titleAnimationController;
//   late AnimationController _borderAnimationController;
//   late Animation<double> _titleAnimation;
//   late Animation<double> _borderAnimation;
//
//   @override
//   void dispose() {
//     super.dispose();
//     _titleAnimationController.dispose();
//     _borderAnimationController.dispose();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _titleAnimationController = AnimationController(duration: 210.milliseconds, vsync: this);
//
//     _borderAnimationController = AnimationController(duration: 1000.milliseconds, vsync: this);
//
//     _titleAnimation = Tween<double>(
//       begin: 0,
//       end: widget.project.name.length.toDouble(),
//     ).animate(_titleAnimationController)
//       ..addListener(() {
//         setState(() {});
//       });
//
//     _borderAnimation = Tween<double>(
//       begin: 0,
//       end: 1,
//     ).animate(_borderAnimationController)
//       ..addListener(() {
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       onEnter: (event) {
//         if (!_borderAnimationController.isAnimating) {
//           _borderAnimationController.reset();
//           _borderAnimationController.forward();
//         }
//       },
//       child: Stack(
//         children: [
//           Material(
//             color: Colors.transparent,
//             // shape: BeveledRectangleBorder(
//             //   side: BorderSide(color: widget.borderColor ?? defaultBorderColor, width: 20),
//             //   borderRadius: BorderRadius.only(
//             //     topLeft: widget.leftItem ? const Radius.circular(80.0) : Radius.zero,
//             //     topRight: !widget.leftItem ? const Radius.circular(80.0) : Radius.zero,
//             //     // bottomRight: Radius.circular(18.0)
//             //   ),
//             // ),
//             child: Padding(
//               padding: const EdgeInsets.all(40),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   // widget.leftItem ? projectDetail(leftItem: widget.leftItem) : projectImage(leftItem: widget.leftItem),
//                   // const SizedBox(width: 40),
//                   // widget.leftItem ? projectImage(leftItem: widget.leftItem) : projectDetail(leftItem: widget.leftItem),
//                   projectDetail(leftItem: widget.leftItem),
//                 ],
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: ClipPath(
//               clipper: CornerCutBorderClipper(leftCut: widget.leftItem, width: 3),
//               child: Container(color: widget.borderColor ?? defaultBorderColor),
//             ),
//           ),
//           Positioned.fill(
//             child: ClipPath(
//               clipper: CornerCutBorderClipper(leftCut: widget.leftItem, width: 3),
//               child: CustomPaint(
//                 foregroundPainter: ColorSplashPainter(value: _borderAnimation.value),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget projectImage({required bool leftItem}) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => imageHovered = true),
//       onExit: (_) => setState(() => imageHovered = false),
//       child: Container(
//         height: 325,
//         width: 200,
//         margin: const EdgeInsets.all(20),
//         decoration: BoxDecoration(
//           border: Border.all(color: widget.borderColor ?? defaultBorderColor, width: 2),
//         ),
//         child: Stack(
//           clipBehavior: Clip.none,
//           children: [
//             Positioned.fill(
//               child: ClipRect(
//                 child: AnimatedScale(
//                   scale: imageHovered ? 1.8 : 1.4,
//                   curve: Curves.ease,
//                   duration: 1000.milliseconds,
//                   child: Image.asset(
//                     Assets.image.mockAppUi.path,
//                   ),
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               child: AnimatedContainer(
//                 duration: 1000.milliseconds,
//                 curve: Curves.ease,
//                 color:
//                 imageHovered ? Theme.of(context).colorScheme.background.withOpacity(0) : Theme.of(context).colorScheme.background.withOpacity(.2),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget projectDetail({required bool leftItem}) {
//     return Container(
//       width: 360,
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: leftItem ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           MouseRegion(
//             // onEnter: (_) {
//             //   widget.blobHoverEffect?.call(
//             //     const BlobHoverData(
//             //       color: foregroundColor,
//             //       size: 200,
//             //     ),
//             //   );
//             // },
//             // onExit: (_) {
//             //   widget.blobHoverEffect?.call(
//             //     const BlobHoverData.initial(),
//             //   );
//             // },
//             child: Icon(
//               Icons.folder,
//               color: Theme.of(context).colorScheme.inversePrimary,
//               size: 80,
//             ),
//           ),
//           const SizedBox(height: 30),
//           MouseRegion(
//             onEnter: (_) {
//               setState(() {
//                 _titleAnimationController.forward();
//                 // if (!_circleAnimationController.isAnimating ) {
//                 //   _circleAnimationController.reset();
//                 //   _circleAnimationController.forward();
//                 // }
//               });
//             },
//             onExit: (_) {
//               setState(() {
//                 _titleAnimationController.reverse();
//                 // _circleAnimationController.reverse();
//               });
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Transform(
//                   transform: Matrix4.translationValues(0, -10, 0),
//                   child: Text(
//                     widget.project.name.substring(0, _titleAnimation.value.toInt()),
//                     style: titleOneTextStyle(context) .copyWith(fontSize: 46, fontFamily: ibmPlexMono),
//                   ),
//                 ),
//                 Text(
//                   widget.project.name.substring(_titleAnimation.value.toInt()),
//                   style: titleOneTextStyle(context) .copyWith(fontSize: 46, fontFamily: ibmPlexMono),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Text(
//             "This is the real project i have made,\n you can believe me.",
//             style: paragraphTextStyle(context) .copyWith(fontSize: fontSize_18),
//             textAlign: leftItem ? TextAlign.right : TextAlign.left,
//           ),
//           const SizedBox(height: 40),
//           CornerCutButton(
//             text: "Explore",
//             onTap: () {},
//             fontSize: 18,
//           )
//         ],
//       ),
//     );
//   }
// }
