import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/router/app_router.dart';
import 'package:portfolio/features/common/extensions/ext.dart';
import 'package:portfolio/features/common/ui/widgets/menu/menu_item.dart';
import 'package:portfolio/features/common/ui/widgets/page_shared_content/theme_selector.dart';

class TopMenuBar extends StatelessWidget {
  final String? selectedItem;

  const TopMenuBar({
    this.selectedItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const menuItems = [
      "About",
      "Work",
      "Blog",
      "Contact",
    ];
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(
            right: 35.0,
            top: context.adaptiveResponsiveHeight(desktop: 50),
            bottom: context.adaptiveResponsiveHeight(desktop: 50),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
              menuItems.length + 1,
              (ind) {
                if (ind == 0) {
                  return const Row(
                    children: [
                      ThemeSelector(),
                      SizedBox(width: 36),
                    ],
                  );
                }
                final index = ind - 1;
                return MenuItem(
                  serial: index + 1,
                  name: menuItems[index],
                  width: menuItems[index].length * 15 + 5 * 15,
                  selected: selectedItem == menuItems[index],
                  onTap: (item) {
                    switch (item) {
                      case "About":
                        if (selectedItem != menuItems[index]) {
                          AutoRouter.of(context).push(const AboutPageRoute());
                        }
                        break;
                      case "Blog":
                        if (selectedItem != menuItems[index]) {
                          AutoRouter.of(context).push(const BlogPageRoute());
                        }
                        break;
                      case "Work":
                        if (selectedItem != menuItems[index]) {
                          AutoRouter.of(context).push(const WorkPageRoute());
                        }
                        break;
                      case "Contact":
                        if (selectedItem != menuItems[index]) {
                          AutoRouter.of(context).push(const ContactPageRoute());
                        }
                        break;
                      default:
                    }
                  },
                );
              },
            ),
          ),
        ),
        // const Positioned(
        //   top: 50,
        //   right: 630,
        //   child: ThemeSelector(),
        // ),
      ],
    );
  }
}
