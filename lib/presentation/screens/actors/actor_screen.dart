import 'package:cinemapedia/domain/entities/person.dart';
import 'package:cinemapedia/presentation/providers/persons/persons_by_movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActorScreen extends ConsumerStatefulWidget {
  static const name = 'actor-screen';

  final String actorId;
  const ActorScreen({super.key, required this.actorId});

  @override
  ActorScreenState createState() => ActorScreenState();
}

class ActorScreenState extends ConsumerState<ActorScreen> {

  @override
  void initState() {
    super.initState();

    ref.read(personsByMovieProvider.notifier).loadPerson(widget.actorId);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final Person? person = ref.watch(personsByMovieProvider)[widget.actorId];

    if(person == null){
      return const Scaffold(body: Center(child: CircularProgressIndicator(strokeWidth: 2)));
    }
    
    return Scaffold(
      appBar: AppBar(
        title: TextActor(person: person),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            InfoActor(person: person),
      
            const SizedBox(width: 10),
      
            DataInfo(person: person),
            
          ],
        ),
      ),
    );
  }
}

class DataInfo extends StatelessWidget {
  final Person person;
  const DataInfo({super.key, required this.person});

  @override
  Widget build(BuildContext context) {

    final textStyles = Theme.of(context).textTheme;

    return Column(
      children: [
        Text('Popularidad', style: textStyles.titleLarge),
        Text(person.popularity.toString(), style: const TextStyle(fontSize: 18),),
        const SizedBox(height: 30),

        Text('Biografia', style: textStyles.titleLarge),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(person.biography, style: textStyles.bodyLarge),
        ),

        const SizedBox(height: 30),

        Text('Fecha y Lugar de Nacimiento', style: textStyles.titleMedium),
        Text(person.placeOfBirth, style: textStyles.labelLarge),
        Text(person.birthday.toIso8601String().substring(0, 10), style: textStyles.labelLarge),

        TextButton(
          onPressed: (){}, 
          child: Text(person.homepage)
        ),

        Text('Otros nombres', style: textStyles.titleLarge),
        ...person.alsoKnownAs.map((alsoKnownAs) => Text(alsoKnownAs)),

        const SizedBox(height: 50)

      ],
    );
  }
}


class TextActor extends StatelessWidget {
  final Person person;
  const TextActor({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Text(person.name);
  }
}

class InfoActor extends StatelessWidget {

  final Person person;

  const InfoActor({super.key, required this.person});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          person.profilePath,
          fit: BoxFit.contain,
          width: size.width * 0.9,
        ),
      ),
    );
  }
}
