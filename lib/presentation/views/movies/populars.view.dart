import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class PopularsView extends ConsumerStatefulWidget {
  const PopularsView({super.key});

  @override
  PopularsViewState createState() => PopularsViewState();
}

class PopularsViewState extends ConsumerState<PopularsView> {

  @override
  void initState() {
    super.initState();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final popularMovies = ref.watch(popularMoviesProvider);

    return Scaffold(
      body: MovieMasonry(
        movies: popularMovies,
        loadNextPage: (){
          ref.read(popularMoviesProvider.notifier).loadNextPage();
        },
      ),
    );
  }
}