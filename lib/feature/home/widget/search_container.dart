part of '../home_view.dart';

class _SearchContainer extends StatelessWidget {
  const _SearchContainer(this.maxHeight);

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.isKeyboardVisible != current.isKeyboardVisible,
      builder: (context, state) {
        return state.isKeyboardVisible
            ? _ExpandedTextField(maxHeight)
            : const _CollapsedTextField();
      },
    );
  }
}

class _ExpandedTextField extends StatelessWidget {
  const _ExpandedTextField(this.maxHeight);

  final double maxHeight;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      maxHeight: maxHeight,
      panel: Column(
        children: [
          SizedBox(
            height: 8.h,
          ),
          const SwipeableIconWidget(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return TextField(
                autofocus: true,
                minLines: 1,
                maxLines: 20,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Search'.tr(),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (val) => context
                    .read<HomeBloc>()
                    .add(OnSearchTextChanged(text: val)),
                onSubmitted: (_) => context.read<HomeBloc>().add(
                      const OnKeyboardStatusChanged(
                        newStatus: false,
                      ),
                    ),
                cursorColor: context.color.secondary,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CollapsedTextField extends StatelessWidget {
  const _CollapsedTextField();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<HomeBloc>().add(
              const OnKeyboardStatusChanged(
                newStatus: true,
              ),
            );
      },
      child: Container(
        height: 64.h,
        decoration: BoxDecoration(
          color: context.color.surface,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: context.color.scrim,
            width: 2,
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Center(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    (state.searchText?.isEmpty ?? true)
                        ? 'Search'.tr()
                        : state.searchText!,
                    textAlign: TextAlign.start,
                    style: context.textTheme.titleMedium!.copyWith(
                      color: (state.searchText?.isEmpty ?? true)
                          ? context.theme.hintColor
                          : context.color.onBackground,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// child: TextField(
            //   readOnly: true,
            //   onTap: () {
            //     context.read<HomeBloc>().add(
            //           const OnKeyboardStatusChanged(
            //             newStatus: true,
            //           ),
            //         );
            //   },
            //   decoration: InputDecoration(
            //     fillColor: Colors.white,
            //     hintText: (state.searchText?.isEmpty ?? true)
            //         ? 'Search'.tr()
            //         : state.searchText,
            //     contentPadding: EdgeInsets.symmetric(
            //       horizontal: 16.w,
            //     ),
            //     border: InputBorder.none,
            //   ),
            //   cursorColor: context.color.secondary,
            // ),