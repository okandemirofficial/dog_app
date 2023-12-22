part of '../home_view.dart';

class _SearchContainer extends StatelessWidget {
  const _SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.isKeyboardVisible != current.isKeyboardVisible,
      builder: (context, state) {
        return Container(
          height: 64.h,
          decoration: BoxDecoration(
            color: context.color.surface,
            borderRadius: BorderRadius.circular(8.r),
            border: state.isKeyboardVisible
                ? Border(
                    top: BorderSide(
                      color: context.color.scrim,
                      width: 2,
                    ),
                  )
                : Border.all(
                    color: context.color.scrim,
                    width: 2,
                  ),
          ),
          child: TextField(
            onTap: () => context.read<HomeBloc>().add(
                  const OnKeyboardStatusChanged(
                    newStatus: true,
                  ),
                ),
            onSubmitted: (_) {
              context.read<HomeBloc>().add(
                    const OnKeyboardStatusChanged(
                      newStatus: false,
                    ),
                  );
            },
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: 'Search',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              border: InputBorder.none,
            ),
            cursorColor: context.color.secondary,
          ),
        );
      },
    );
  }
}
