import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///A context extensions for handling various build context shorthands
extension ContextExtensions on BuildContext {
  ///Gives text theme
  TextTheme get textTheme => Theme.of(this).textTheme;

  ///Gives current color scheme
  ColorScheme get color => Theme.of(this).colorScheme;

  ///Gives current theme
  ThemeData get theme => Theme.of(this);

  ///Gives default top padding
  double get topPadding => MediaQuery.of(this).padding.top;

  ///Gives 40.h bottom padding
  double get bottomPadding => 40.h;
}
