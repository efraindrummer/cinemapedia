
import 'package:cinemapedia/domain/datasources/persons_datasource.dart';
import 'package:cinemapedia/domain/entities/person.dart';
import 'package:cinemapedia/domain/repositories/persons_repository.dart';

class PersonRepositoryImpl extends PersonsRepository {

  final PersonsDatasource datasource;
  PersonRepositoryImpl(this.datasource);

  @override
  Future<Person> getPersonById(String id) {
    return datasource.getPersonById(id);
  }

}