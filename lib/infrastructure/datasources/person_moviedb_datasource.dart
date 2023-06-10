

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/persons_datasource.dart';
import 'package:cinemapedia/domain/entities/person.dart';
import 'package:cinemapedia/infrastructure/mappers/person_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/person_response.dart';
import 'package:dio/dio.dart';

class PersonDbDataSource extends PersonsDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': Enviromnment.theMovieDBKey,
      'language': 'es-MX',
    }
  ));
  
  @override
  Future<Person> getPersonById(String id) async {
    
    final response = await dio.get('/person/$id');

    final personResponse = PersonRespose.fromJson(response.data);
    final person = PersonMapper.personToEntity(personResponse);

    return person;
  }
  
}