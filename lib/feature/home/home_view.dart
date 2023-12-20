import 'package:dog_app/feature/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({required this.homeBloc, super.key});

  final HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeBloc,
      child: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
