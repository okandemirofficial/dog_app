import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///A color extension to set color on svgPicture
extension ColorExtension on SvgPicture {
  ///Use this to set color
  ///ColorFilter.mode(color, BlendMode.srcIn)
  SvgPicture setColor(Color color) {
    return SvgPicture(
      bytesLoader,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
