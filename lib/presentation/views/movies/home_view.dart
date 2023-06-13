import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies  = ref.watch(moviesSlideShowProvider);
    final popularMovies    = ref.watch(popularMoviesProvider);
    final upComingMovies   = ref.watch(upComingMoviesProvider);
    final topRatedMovies   = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            titlePadding: EdgeInsets.all(0),
            title: CustomAppBar(),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return  Column(
              children: [
          
                MoviesSlideShow(movies: slideShowMovies),
          
                MovieHorizontalListView(
                  movies: nowPlayingMovies, 
                  title: 'En cines', 
                  subTitle: 'Lunes 20', 
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  }
                ),
          
                MovieHorizontalListView(
                  movies: upComingMovies, 
                  title: 'Proximamente', 
                  subTitle: 'En este mes', 
                  loadNextPage: () {
                    ref.read(upComingMoviesProvider.notifier).loadNextPage();
                  }
                ),
          
                MovieHorizontalListView(
                  movies: popularMovies, 
                  title: 'Populares', 
                  //subTitle: '', 
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  }
                ),
          
                MovieHorizontalListView(
                  movies: topRatedMovies, 
                  title: 'Mejor calificadas', 
                  subTitle: 'Desde siempre', 
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  }
                ),

                const SizedBox(height: 10)
              ],
            );
          },
          childCount: 1
        )
      ),

      ]
    );
  }
}