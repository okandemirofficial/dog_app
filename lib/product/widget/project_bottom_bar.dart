import 'package:core/core.dart';
import 'package:core/widget/svg_picture.dart';
import 'package:dog_app/feature/settings/settings_bottom_sheet.dart';
import 'package:dog_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProjectBottomBar extends StatelessWidget {
  const ProjectBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BottomAppBarCustomPainter(
        color: context.color.tertiary,
        strokeColor: context.color.scrim,
      ),
      child: SizedBox(
        height: 98.h,
        width: 375.w,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _TabBarButton(
                title: 'Home', //Todo: localize,
                iconPath: Assets.icon.home,
                iconSize: Size(25.w, 30.h),
                isSelected: true,
                onTap: () {},
              ),
              VerticalDivider(
                indent: 12.h,
                endIndent: 38.h,
                color: context.color.scrim,
              ),
              _TabBarButton(
                title: 'Settings', //Todo: localize,
                iconPath: Assets.icon.settings,
                iconSize: Size(26.w, 26.h),
                isSelected: false,
                onTap: () => showSettings(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TabBarButton extends StatelessWidget {
  const _TabBarButton({
    required this.title,
    required this.iconPath,
    required this.iconSize,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final void Function()? onTap;
  final Size iconSize;
  final bool isSelected;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              height: iconSize.height,
              width: iconSize.width,
            ).setColor(
              isSelected ? context.color.secondary : context.color.onSurface,
            ),
            Text(
              title,
              style: context.textTheme.bodySmall!.copyWith(
                color: isSelected
                    ? context.color.secondary
                    : context.color.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarCustomPainter extends CustomPainter {
  BottomAppBarCustomPainter({
    required this.color,
    required this.strokeColor,
  });

  final Color color;
  final Color strokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = Path()
      ..moveTo(size.width * 0.03682320, size.height * 0.1369582)
      ..cubicTo(
        size.width * 0.04019253,
        size.height * 0.05798857,
        size.width * 0.05802160,
        0,
        size.width * 0.07893227,
        0,
      )
      ..lineTo(size.width * 0.9210667, 0)
      ..cubicTo(
        size.width * 0.9419787,
        0,
        size.width * 0.9598080,
        size.height * 0.05798867,
        size.width * 0.9631760,
        size.height * 0.1369582,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.03682320, size.height * 0.1369582)
      ..close();

    final paint0Fill = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    final paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..color = strokeColor
      ..strokeWidth = 3;

    canvas
      ..drawPath(path_0, paint1Stroke)
      ..drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
