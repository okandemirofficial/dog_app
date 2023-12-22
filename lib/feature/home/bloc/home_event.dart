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

final class OnKeyboardStatusChanged extends HomeEvent {
  const OnKeyboardStatusChanged({required this.newStatus});

  final bool newStatus;

  @override
  List<Object?> get props => [newStatus];
}

final class OnSearchTextChanged extends HomeEvent {
  const OnSearchTextChanged({required this.text});

  final String text;

  @override
  List<Object?> get props => [text];
}

final class OnApplyFilter extends HomeEvent {
  const OnApplyFilter();

  @override
  List<Object?> get props => [];
}
