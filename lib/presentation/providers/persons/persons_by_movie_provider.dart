import 'package:cinemapedia/domain/entities/person.dart';
import 'package:cinemapedia/presentation/providers/persons/persons_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final personsByMovieProvider = StateNotifierProvider<PersonMapNotifier, Map<String, Person>>((ref) {

  final personsRepository = ref.watch(personsRepositoryProvider);
  
  return PersonMapNotifier(getPersonById: personsRepository.getPersonById);
});


typedef GetPersonCallback = Future<Person>Function(String id);

class PersonMapNotifier extends StateNotifier<Map<String, Person>> {

  final GetPersonCallback getPersonById;

  PersonMapNotifier({
    required this.getPersonById
  }): super({});

  Future<void> loadPerson(String personId) async {
    if(state[personId] != null) return;
    //print('realizando peticion http');
    final person = await getPersonById(personId);

    state = {...state, personId: person};
  }
}