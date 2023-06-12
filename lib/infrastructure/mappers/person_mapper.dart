

import 'package:cinemapedia/domain/entities/person.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/person_response.dart';

class PersonMapper {

  static Person personToEntity(PersonRespose person) => Person(
    id: person.id, 
    name: person.name, 
    placeOfBirth: person.placeOfBirth, 
    biography: person.biography!, 
    birthday: person.birthday!, 
    popularity: person.popularity, 
    alsoKnownAs: person.alsoKnownAs, 
    profilePath: person.profilePath != null
      ? 'https://image.tmdb.org/t/p/w500${person.profilePath}'
      : 'https://img.freepik.com/premium-vector/account-icon-user-icon-vector-graphics_292645-552.jpg?w=2000', 
    homepage: person.homepage ?? 'not homepage',
  ); 
}