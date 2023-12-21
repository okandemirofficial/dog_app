// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_bloc.dart';

enum HomeStatus { initial, loading, success, failure }

@immutable
class HomeState extends Equatable {
  final HomeStatus status;
  final List<BreedModel>? breedList;
  final String? searchKeyword;
  const HomeState({
    required this.status,
    this.breedList,
    this.searchKeyword,
  });

  factory HomeState.initial() => const HomeState(
        status: HomeStatus.initial,
      );

  HomeState copyWith({
    HomeStatus? status,
    List<BreedModel>? breedList,
    String? searchKeyword,
  }) {
    return HomeState(
      status: status ?? this.status,
      breedList: breedList ?? this.breedList,
      searchKeyword: searchKeyword ?? this.searchKeyword,
    );
  }

  @override
  List<Object?> get props => [status, breedList, searchKeyword];
}
