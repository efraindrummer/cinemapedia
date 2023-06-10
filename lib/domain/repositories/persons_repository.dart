import 'package:cinemapedia/domain/entities/person.dart';

abstract class PersonsRepository {

  Future<Person> getPersonById(String id);

}