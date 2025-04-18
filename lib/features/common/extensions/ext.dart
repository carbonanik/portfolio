import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// Darken the color by a specified [percent].
  Color darken(double percent) {
    assert(
        percent >= 0 && percent <= 100, 'Percent should be between 0 and 100');

    // Calculate the darken factor
    double factor = 1.0 - percent / 100.0;

    // Calculate the new color components
    int red = (r * factor).round();
    int green = (g * factor).round();
    int blue = (b * factor).round();

    // Ensure the color components are in the valid range (0-255)
    red = red.clamp(0, 255);
    green = green.clamp(0, 255);
    blue = blue.clamp(0, 255);

    // Return the new color
    return Color.fromARGB(alpha, red, green, blue);
  }

  Color lighten(double percent) {
    assert(
        percent >= 0 && percent <= 100, 'Percent should be between 0 and 100');

    // Calculate the lighten factor
    double factor = percent / 100.0;

    // Calculate the new color components
    int red = (r + (255 - r) * factor).round();
    int green = (g + (255 - g) * factor).round();
    int blue = (b + (255 - b) * factor).round();

    // Ensure the color components are in the valid range (0-255)
    red = red.clamp(0, 255);
    green = green.clamp(0, 255);
    blue = blue.clamp(0, 255);

    // Return the new color
    return Color.fromARGB(alpha, red, green, blue);
  }
}

extension ListExtension<T> on List<T> {
  void wrap(T value) {
    for (int i = 0; i < length; i++) {
      insert(i, value);
    }
  }
}

const idealDesktopWidth = 1920.0;
const idealDesktopHeight = 1080.0;

const idealTabletWidth = 1024.0;
const idealTabletHeight = 768.0;

const idealMobileWidth = 375.0;
const idealMobileHeight = 812.0;

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;

  double get width => MediaQuery.of(this).size.width;

  // bool get isDesktop => width > 1200;

  bool get isTablet => width > 600 && width < 1200;

  bool get isMobile => width < 600;

  double adaptiveHeight(double value, double idealHeight) {
    return height / (idealHeight / value);
  }

  double adaptiveWidth(double value, double idealWidth) {
    return width / (idealWidth / value);
  }

  double adaptiveResponsiveHeight({
    required double desktop,
    double? tablet,
    double? mobile,
  }) {
    final adaptiveDesktop = adaptiveHeight(desktop, idealDesktopHeight);
    final adaptiveTablet =
        adaptiveHeight(tablet ?? desktop / 1.6, idealTabletHeight);
    final adaptiveMobile =
        adaptiveHeight(mobile ?? desktop / 2, idealMobileHeight);
    if (isMobile) return adaptiveMobile;
    if (isTablet) return adaptiveTablet;
    return adaptiveDesktop;
  }

  double adaptiveResponsiveWidth({
    required double desktop,
    double? tablet,
    double? mobile,
  }) {
    final adaptiveDesktop = adaptiveWidth(desktop, idealDesktopWidth);
    final adaptiveTablet =
        adaptiveWidth(tablet ?? desktop / 1.6, idealTabletWidth);
    final adaptiveMobile =
        adaptiveWidth(mobile ?? desktop / 2, idealMobileWidth);
    if (isMobile) return adaptiveMobile;
    if (isTablet) return adaptiveTablet;
    return adaptiveDesktop;
  }

  double responsiveSize({
    required double desktop,
    double? tablet,
    double? mobile,
  }) {
    if (isMobile) return mobile ?? desktop / 2;
    if (isTablet) return tablet ?? desktop / 1.6;
    if (isTablet) return desktop;
    return desktop;
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobileLayout,
    this.tabletLayout,
    required this.desktopLayout,
    super.key,
  });

  final Widget mobileLayout;
  final Widget? tabletLayout;
  final Widget desktopLayout;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileLayout;
        } else if (constraints.maxWidth < 1200) {
          return tabletLayout ?? desktopLayout;
        } else {
          return desktopLayout;
        }
      },
    );
  }
}
