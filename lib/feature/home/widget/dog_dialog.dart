part of '../home_view.dart';

class _DogDialog extends StatelessWidget {
  const _DogDialog({required this.model, required this.bloc});

  final BreedModel model;
  final HomeBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Builder(
        builder: (context) {
          return Dialog(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                color: Colors.white,
                height: 630.h,
                width: 343.w,
                child: Column(
                  children: [
                    _DialogInfoSection(model: model),
                    _DialogGeneratebuttonSection(
                      breedname: model.name,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _DialogGeneratebuttonSection extends StatelessWidget {
  const _DialogGeneratebuttonSection({
    required this.breedname,
  });

  final String breedname;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.latestGeneratedImageUrl != current.latestGeneratedImageUrl,
        builder: (context, state) {
          return ElevatedButton(
            onPressed: () async {
              await showDialog<void>(
                context: context,
                builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        state.latestGeneratedImageUrl ?? '',
                        height: 256.h,
                        width: 256.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Container(
                        height: 32.w,
                        width: 32.w,
                        decoration: BoxDecoration(
                          color: context.color.background,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        child: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              );
              if (context.mounted) {
                context
                    .read<HomeBloc>()
                    .add(OnGetRandomImage(context, breedname));
              }
            },
            child: const Text('Generate'),
          );
        },
      ),
    );
  }
}

class _DialogInfoSection extends StatelessWidget {
  const _DialogInfoSection({
    required this.model,
    super.key,
  });

  final BreedModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 539.h,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              model.breedImageUrl ?? '',
              height: 343.h,
              width: 343.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const ColoredBox(color: Colors.black12),
            ),
            SizedBox(height: 12.h),
            const _DialogTitle('Breed'),
            SizedBox(height: 8.h),
            const _DialogDivider(),
            SizedBox(height: 8.h),
            Text(
              model.name,
              style: context.textTheme.bodyMedium,
            ),
            SizedBox(height: 12.h),
            const _DialogTitle('Sub Breed'),
            SizedBox(height: 8.h),
            const _DialogDivider(),
            SizedBox(height: 8.h),
            for (final name in model.subBreedNames)
              Column(
                children: [
                  Text(name),
                  SizedBox(height: 4.h),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _DialogTitle extends StatelessWidget {
  const _DialogTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleLarge!.copyWith(
        color: context.color.secondary,
      ),
    );
  }
}

class _DialogDivider extends StatelessWidget {
  const _DialogDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.color.scrim,
      height: 0,
    );
  }
}
