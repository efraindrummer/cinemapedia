
import 'package:go_router/go_router.dart';  
import 'package:cinemapedia/presentation/screens/screens.dart';


final appRouter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {

        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex);
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
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ]
);