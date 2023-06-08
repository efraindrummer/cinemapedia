import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final movieRepository = ref.watch(movieRepositoryProvider);
  
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});


typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie
  }): super({});

  Future<void> loadMovie(String movideId) async {
    if(state[movideId] != null) return;
    //print('realizando peticion http');
    final movie = await getMovie(movideId);

    state = {...state, movideId: movie};
  }
}