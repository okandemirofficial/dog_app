import 'dart:ui';

import 'package:core/core.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/product/widget/poject_app_bar.dart';
import 'package:dog_app/product/widget/project_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:models/models.dart';

part './widget/image_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) {
        final bloc = locator<HomeBloc>();
        debugPrint(bloc.toString());
        bloc.add(HomeInit(context: context));
        return bloc;
      },
      child: const SafeArea(
        child: Scaffold(
          extendBody: true,
          appBar: ProjectAppBar(),
          body: HomeContent(),
          bottomNavigationBar: ProjectBottomBar(),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
          ),
          itemCount: state.breedList?.length ?? 0,
          itemBuilder: (context, i) => _ImageContainer(
            state.breedList![i],
          ),
        ),
      ),
    );
  }
}
