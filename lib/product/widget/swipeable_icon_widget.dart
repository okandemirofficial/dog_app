import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwipeableIconWidget extends StatelessWidget {
  const SwipeableIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 4.h,
      decoration: BoxDecoration(
        color: context.color.scrim,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
