// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final List<BreedModel>? breedList;
  final List<BreedModel>? filteredBreedList;
  final String? searchText;
  final bool isKeyboardVisible;

  const HomeState({
    required this.status,
    required this.isKeyboardVisible,
    this.filteredBreedList,
    this.breedList,
    this.searchText,
  });

  factory HomeState.initial() => const HomeState(
        status: HomeStatus.initial,
        isKeyboardVisible: false,
      );

  HomeState copyWith({
    HomeStatus? status,
    List<BreedModel>? breedList,
    String? searchText,
    bool? isKeyboardVisible,
    List<BreedModel>? filteredBreedList,
  }) {
    return HomeState(
      status: status ?? this.status,
      breedList: breedList ?? this.breedList,
      searchText: searchText ?? this.searchText,
      isKeyboardVisible: isKeyboardVisible ?? this.isKeyboardVisible,
      filteredBreedList: filteredBreedList ?? this.filteredBreedList,
    );
  }

  @override
  List<Object?> get props =>
      [status, breedList, searchText, isKeyboardVisible, filteredBreedList];
}
