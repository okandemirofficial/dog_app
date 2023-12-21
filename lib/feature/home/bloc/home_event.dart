part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

final class HomeInit extends HomeEvent {
  const HomeInit({required this.context});

  final BuildContext context;

  @override
  List<Object?> get props => [context];
}
