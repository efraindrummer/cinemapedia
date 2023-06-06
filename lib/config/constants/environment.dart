import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviromnment {

    static String theMovieDBKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'no hay api key';
}