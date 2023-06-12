
import 'package:cinemapedia/presentation/views/views.dart';
import 'package:go_router/go_router.dart';  
import 'package:cinemapedia/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [

    ShellRoute(
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomeView();
          },
          routes: [
            GoRoute(
              path: 'movie/:id',
              name: MovieScreen.name,
              builder: (context, state) {
                final movieId = state.pathParameters['id'] ?? 'no-id';
                return MovieScreen(movieId: movieId);
              },
            ),
            GoRoute(
              path: 'person/:id',
              name: ActorScreen.name,
              builder: (context, state) {
                final actorId = state.pathParameters['id'] ?? 'no-id';
                return ActorScreen(actorId: actorId);
              },
            ),
          ]
        ),

        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return const FavoritesViews();
          },
        ),

      ]
    )


    //Rutas padres /Hijo
    /*GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(childView: HomeView(),),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-id';
            return MovieScreen(movieId: movieId);
          },
        ),
        GoRoute(
          path: 'person/:id',
          name: ActorScreen.name,
          builder: (context, state) {
            final actorId = state.pathParameters['id'] ?? 'no-id';
            return ActorScreen(actorId: actorId);
          },
        ),
      ]
    ),*/
  ]
);