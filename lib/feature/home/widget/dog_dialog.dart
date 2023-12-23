part of '../home_view.dart';

class _DogDialog extends StatelessWidget {
  const _DogDialog({
    required this.model,
  });

  final BreedModel model;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          color: Colors.white,
          height: 630.h,
          width: 343.w,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.network(
                      model.breedImageUrl ?? '',
                      errorBuilder: (context, error, stackTrace) =>
                          const ColoredBox(color: Colors.black12),
                    ),
                    SizedBox(height: 12.h),
                    const _DialogTitle('Breed'),
                    SizedBox(height: 8.h),
                    const _DialogDivider(),
                    SizedBox(height: 8.h),
                    Text(model.name, style: context.textTheme.bodyMedium),
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
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Generate'),
                ),
              ),
            ],
          ),
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
