


import 'package:cinemapedia/infrastructure/datasources/person_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/person_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personsRepositoryProvider = Provider((ref) {
  return PersonRepositoryImpl(PersonDbDataSource());
});