import 'dart:ui';

import 'package:core/core.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/product/widget/project_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:models/models.dart';

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
      child: const Scaffold(
        appBar: ProjectAppBar(),
        body: HomeContent(),
        bottomNavigationBar: ProjectBottomBar(),
      ),
    );
  }
}

class ProjectBottomBar extends StatelessWidget {
  const ProjectBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(375.w, 98.h),
      painter: BottomAppBarCustomPainter(
        color: context.color.tertiary,
      ),
    );
  }
}

class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Dog App'));
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.w,
            mainAxisSpacing: 16.h,
          ),
          itemCount: state.breedList?.length ?? 0,
          itemBuilder: (context, i) => _ImageContainer(state.breedList![i]),
        ),
      ),
    );
  }
}

class _ImageContainer extends StatelessWidget {
  const _ImageContainer(
    this.model,
  );

  final BreedModel model;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.sp),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              model.breedImageUrl ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const SizedBox.shrink(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.sp),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                child: ColoredBox(
                  color: Colors.black.withOpacity(0.24),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.h),
                    child: Text(
                      model.name,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
