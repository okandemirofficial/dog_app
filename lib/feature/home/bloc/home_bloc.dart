import 'package:collection/collection.dart';
import 'package:dog_repository/dog_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

const cachedImageCount = 16;

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._dogRepository,
  ) : super(HomeState.initial()) {
    on<HomeInit>(_onInit);
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
          (e) {
            return _dogRepository.getImageUrlByBreed(e.name);
          },
        ),
      );

      final breedListWithUrls = breedList.mapIndexed(
        (i, e) => BreedModel(
          name: e.name,
          subBreedNames: e.subBreedNames,
          breedImageUrl: breedUrlList[i],
        ),
      );

      // ignore: use_build_context_synchronously
      await precacheImage(
        Image.network(breedListWithUrls.first.breedImageUrl!).image,
        event.context,
      );

      debugPrint(breedList.length.toString());
    } catch (e) {
      rethrow;
    }
  }
}
