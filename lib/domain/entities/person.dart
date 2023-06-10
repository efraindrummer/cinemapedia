class Person {
  final int id;
  final String name;
  final String placeOfBirth;
  final String biography;
  final DateTime birthday;
  final double popularity;
  final List<String> alsoKnownAs;
  final String profilePath;
  final String homepage;

  Person({
    required this.id, 
    required this.name, 
    required this.placeOfBirth, 
    required this.biography, 
    required this.birthday, 
    required this.popularity, 
    required this.alsoKnownAs, 
    required this.profilePath, 
    required this.homepage
  });
}