import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CImage extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final BoxFit? fit;

  const CImage(
    this.name, {
    super.key,
    this.width,
    this.height,
    this.alignment,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    if (name.contains('.svg')) {
      return SvgPicture.asset(
        name,
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        fit: fit ?? BoxFit.cover,
      );
    } else {
      return Image.asset(
        name,
        width: width,
        height: height,
        alignment: alignment ?? Alignment.center,
        fit: fit ?? BoxFit.cover,
      );
    }
  }
}
