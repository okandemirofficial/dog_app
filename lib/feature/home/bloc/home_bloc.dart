import 'package:collection/collection.dart';
import 'package:dog_repository/dog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

const cachedImageCount = 16;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._dogRepository,
  ) : super(HomeState.initial()) {
    on<HomeInit>(_onInit);
    on<OnKeyboardStatusChanged>(_onSearchBarStatusChanged);
  }

  final DogRepository _dogRepository;

  Future<void> _onInit(
    HomeInit event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final breedList = await _dogRepository.getBreedList();

      final breedUrlList = await Future.wait<String>(
        breedList.map(
          (e) async {
            final url = await _dogRepository.getImageUrlByBreed(e.name);

            // ignore: use_build_context_synchronously
            await precacheImage(
              Image.network(url).image,
              event.context,
            );

            return url;
          },
        ),
      );

      final breedListWithUrls = breedList
          .mapIndexed(
            (i, e) => BreedModel(
              name: e.name,
              subBreedNames: e.subBreedNames,
              breedImageUrl: breedUrlList[i],
            ),
          )
          .toList();

      emit(
        state.copyWith(
          breedList: breedListWithUrls,
          status: HomeStatus.success,
        ),
      );
    } catch (e) {
      state.copyWith(
        status: HomeStatus.failure,
      );

      rethrow;
    } finally {
      FlutterNativeSplash.remove();
    }
  }

  Future<void> _onSearchBarStatusChanged(
    OnKeyboardStatusChanged event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isKeyboardVisible: event.newStatus));
  }
}
