/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImageGen {
  const $AssetsImageGen();

  /// File path: assets/image/apple.png
  AssetGenImage get apple => const AssetGenImage('assets/image/apple.png');

  /// File path: assets/image/bannar_black.jpg
  AssetGenImage get bannarBlack =>
      const AssetGenImage('assets/image/bannar_black.jpg');

  /// File path: assets/image/banner.png
  AssetGenImage get banner => const AssetGenImage('assets/image/banner.png');

  /// File path: assets/image/banner.png.xmp
  String get bannerPng => 'assets/image/banner.png.xmp';

  /// File path: assets/image/carbon_logo.png
  AssetGenImage get carbonLogo =>
      const AssetGenImage('assets/image/carbon_logo.png');

  /// File path: assets/image/cat-low-res.png
  AssetGenImage get catLowRes =>
      const AssetGenImage('assets/image/cat-low-res.png');

  /// File path: assets/image/cat-low-res.png.xmp
  String get catLowResPng => 'assets/image/cat-low-res.png.xmp';

  /// File path: assets/image/flutter_icon_white.png
  AssetGenImage get flutterIconWhite =>
      const AssetGenImage('assets/image/flutter_icon_white.png');

  /// File path: assets/image/mock_app_ui.png
  AssetGenImage get mockAppUi =>
      const AssetGenImage('assets/image/mock_app_ui.png');

  /// File path: assets/image/mock_app_ui.png.xmp
  String get mockAppUiPng => 'assets/image/mock_app_ui.png.xmp';

  /// File path: assets/image/mock_app_ui_2.png
  AssetGenImage get mockAppUi2 =>
      const AssetGenImage('assets/image/mock_app_ui_2.png');

  /// File path: assets/image/mock_app_ui_2.png.xmp
  String get mockAppUi2Png => 'assets/image/mock_app_ui_2.png.xmp';

  /// List of all assets
  List<dynamic> get values => [
        apple,
        bannarBlack,
        banner,
        bannerPng,
        carbonLogo,
        catLowRes,
        catLowResPng,
        flutterIconWhite,
        mockAppUi,
        mockAppUiPng,
        mockAppUi2,
        mockAppUi2Png
      ];
}

class Assets {
  Assets._();

  static const $AssetsImageGen image = $AssetsImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
