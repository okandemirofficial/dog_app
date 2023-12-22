import 'package:dog_app/product/router/router.dart';
import 'package:dog_app/product/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  App({
    super.key,
  });

  late final routerManager = RouterManager();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp.router(
        routerConfig: routerManager.router,
        theme: lightTheme,
      ),
    );
  }
}
