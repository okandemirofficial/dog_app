import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0XFF0085FF),
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF0055D3), //Used in icons
  onSecondary: Color(0xFFFFFFFF),
  tertiary: Color(0xFFE5E5EA), //Used in app bar
  onTertiary: Color(0xFF000000),
  scrim: Color(0xFFD1D1D6), //Used in divider
  error: Colors.red,
  onError: Color(0xFFFFFFFF),
  background: Color(0xFFFFFFFF),
  onBackground: Color(0xFF000000),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
);

final _lightTextTheme = TextTheme(
  titleLarge: TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  ),
  bodyLarge: TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  ),
  bodyMedium: TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  ),
  bodySmall: TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
  ),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: _lightColorScheme,
  fontFamily: 'GalanoGrotesque',
  textTheme: _lightTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      fixedSize: MaterialStatePropertyAll(
        Size(312.w, 56.h),
      ),
      foregroundColor: MaterialStatePropertyAll(_lightColorScheme.onPrimary),
      backgroundColor: MaterialStatePropertyAll(_lightColorScheme.primary),
      side: const MaterialStatePropertyAll(BorderSide.none),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      textStyle: MaterialStatePropertyAll(
        _lightTextTheme.bodyMedium,
      ),
    ),
  ),
);
