import 'dart:ui';

import 'package:core/core.dart';
import 'package:dependency_injection/dependency_injection.dart';
import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:dog_app/product/widget/poject_app_bar.dart';
import 'package:dog_app/product/widget/project_bottom_bar.dart';
import 'package:dog_app/product/widget/swipeable_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:models/models.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

part './widget/dog_dialog.dart';
part './widget/image_container.dart';
part './widget/search_container.dart';

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
      child: Builder(
        builder: (context) {
          return Builder(
            builder: (context) {
              return SafeArea(
                child: GestureDetector(
                  onTap: () {
                    context.read<HomeBloc>().add(
                          const OnKeyboardStatusChanged(newStatus: false),
                        );
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: const Scaffold(
                    appBar: ProjectAppBar(),
                    body: HomeContent(),
                    bottomNavigationBar: ProjectBottomBar(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                previous.filteredBreedList != current.filteredBreedList,
            builder: (context, state) {
              if (state.filteredBreedList?.isEmpty ?? true) {
                return const _EmptyStateWidget();
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: state.filteredBreedList?.length ?? 0,
                itemBuilder: (context, i) => _ImageContainer(
                  state.filteredBreedList![i],
                ),
              );
            },
          ),
        ),
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.isKeyboardVisible != current.isKeyboardVisible,
          builder: (context, state) {
            return Positioned(
              bottom: state.isKeyboardVisible ? 0 : 16.h,
              right: state.isKeyboardVisible ? 0 : 16.w,
              left: state.isKeyboardVisible ? 0 : 16.w,
              child: const _SearchContainer(),
            );
          },
        ),
      ],
    );
  }
}

class _EmptyStateWidget extends StatelessWidget {
  const _EmptyStateWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'No results found',
            style: context.textTheme.bodyLarge,
          ),
          Text(
            'Try searching with another word',
            style: context.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
