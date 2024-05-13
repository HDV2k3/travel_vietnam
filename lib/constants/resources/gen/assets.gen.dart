/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/IMG_7985.png
  AssetGenImage get img7985 =>
      const AssetGenImage('assets/images/IMG_7985.png');

  /// File path: assets/images/MoMo_Logo.png
  AssetGenImage get moMoLogo =>
      const AssetGenImage('assets/images/MoMo_Logo.png');

  /// File path: assets/images/amazon.png
  AssetGenImage get amazon => const AssetGenImage('assets/images/amazon.png');

  /// File path: assets/images/backgroud.png
  AssetGenImage get backgroud =>
      const AssetGenImage('assets/images/backgroud.png');

  /// File path: assets/images/bg1.png
  AssetGenImage get bg1 => const AssetGenImage('assets/images/bg1.png');

  /// File path: assets/images/bgtour.jpeg
  AssetGenImage get bgtour => const AssetGenImage('assets/images/bgtour.jpeg');

  /// File path: assets/images/booknowbutton.png
  AssetGenImage get booknowbutton =>
      const AssetGenImage('assets/images/booknowbutton.png');

  /// File path: assets/images/creditcard.jpg
  AssetGenImage get creditcard =>
      const AssetGenImage('assets/images/creditcard.jpg');

  /// File path: assets/images/dn1.jpeg
  AssetGenImage get dn1 => const AssetGenImage('assets/images/dn1.jpeg');

  /// File path: assets/images/dn2.jpg
  AssetGenImage get dn2 => const AssetGenImage('assets/images/dn2.jpg');

  /// File path: assets/images/dn3.jpg
  AssetGenImage get dn3 => const AssetGenImage('assets/images/dn3.jpg');

  /// File path: assets/images/ggpay.png
  AssetGenImage get ggpay => const AssetGenImage('assets/images/ggpay.png');

  /// File path: assets/images/google_logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/images/google_logo.png');

  /// File path: assets/images/paypal.jpg
  AssetGenImage get paypal => const AssetGenImage('assets/images/paypal.jpg');

  /// File path: assets/images/paypalll.jpg
  AssetGenImage get paypalll =>
      const AssetGenImage('assets/images/paypalll.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        img7985,
        moMoLogo,
        amazon,
        backgroud,
        bg1,
        bgtour,
        booknowbutton,
        creditcard,
        dn1,
        dn2,
        dn3,
        ggpay,
        googleLogo,
        paypal,
        paypalll
      ];
}

class $AssetsLogosGen {
  const $AssetsLogosGen();

  /// File path: assets/logos/google_logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/logos/google_logo.png');

  /// List of all assets
  List<AssetGenImage> get values => [googleLogo];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const String locations = 'assets/locations.json';
  static const $AssetsLogosGen logos = $AssetsLogosGen();

  /// List of all assets
  static List<String> get values => [locations];
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
