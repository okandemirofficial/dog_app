import 'dart:io';

import 'package:core/core.dart';
import 'package:dog_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Future<void> showSettings(BuildContext context) => showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: false,
      constraints: const BoxConstraints.expand(),
      context: context,
      shape: Border.all(),
      builder: (context) => const _SettingsWidget(),
    );

class _SettingsWidget extends StatelessWidget {
  const _SettingsWidget();

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.color.background,
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Container(
              width: 32.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: context.color.scrim,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(
              height: 48.h,
            ),
            _ContentLine(
              svgPath: Assets.icon.help,
              title: 'Help',
            ),
            const _ContentDivider(),
            _ContentLine(
              svgPath: Assets.icon.star,
              title: 'Rate Us',
            ),
            const _ContentDivider(),
            _ContentLine(
              svgPath: Assets.icon.share,
              title: 'Share with Friends',
            ),
            const _ContentDivider(),
            _ContentLine(
              svgPath: Assets.icon.termsOfUse,
              title: 'Terms of Use',
            ),
            const _ContentDivider(),
            _ContentLine(
              svgPath: Assets.icon.privacyPolicy,
              title: 'Privacy Policy',
            ),
            const _ContentDivider(),
            _ContentLine(
              svgPath: Assets.icon.osVersion,
              title: 'OS Version',
              subtitle:
                  '${Platform.operatingSystem.toUpperCase()} ${Platform.operatingSystemVersion}',
            ),
          ],
        ),
      ),
    );
  }
}

class _ContentLine extends StatelessWidget {
  const _ContentLine({
    required this.svgPath,
    required this.title,
    this.subtitle,
  });

  final String svgPath;
  final String title;

  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        children: [
          SizedBox(
            height: 32.h,
            width: 32.w,
            child: SvgPicture.asset(svgPath),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            title,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (subtitle != null)
            Text(
              subtitle!,
              style: context.textTheme.bodySmall!.copyWith(
                color: context.color.scrim,
              ),
            )
          else
            SvgPicture.asset(
              Assets.icon.arrowUpRight,
              height: 9.5,
              width: 9.5,
            ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
    );
  }
}

class _ContentDivider extends StatelessWidget {
  const _ContentDivider();

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.color.scrim,
      height: 0,
    );
  }
}
