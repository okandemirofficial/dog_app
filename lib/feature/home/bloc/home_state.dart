// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final List<BreedModel>? breedList;
  final String? searchKeyword;
  final bool isKeyboardVisible;

  const HomeState({
    required this.status,
    required this.isKeyboardVisible,
    this.breedList,
    this.searchKeyword,
  });

  factory HomeState.initial() => const HomeState(
        status: HomeStatus.initial,
        isKeyboardVisible: false,
      );

  HomeState copyWith({
    HomeStatus? status,
    List<BreedModel>? breedList,
    String? searchKeyword,
    bool? isKeyboardVisible,
  }) {
    return HomeState(
      status: status ?? this.status,
      breedList: breedList ?? this.breedList,
      searchKeyword: searchKeyword ?? this.searchKeyword,
      isKeyboardVisible: isKeyboardVisible ?? this.isKeyboardVisible,
    );
  }

  @override
  List<Object?> get props =>
      [status, breedList, searchKeyword, isKeyboardVisible];
}
