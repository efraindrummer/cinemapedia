// To parse this JSON data, do
//
//     final personRespose = personResposeFromJson(jsonString);

import 'dart:convert';

PersonRespose personResposeFromJson(String str) => PersonRespose.fromJson(json.decode(str));

String personResposeToJson(PersonRespose data) => json.encode(data.toJson());

class PersonRespose {
    final bool adult;
    final List<String> alsoKnownAs;
    final String? biography;
    final DateTime? birthday;
    final dynamic deathday;
    final int gender;
    final dynamic homepage;
    final int id;
    final String imdbId;
    final String knownForDepartment;
    final String name;
    final String placeOfBirth;
    final double popularity;
    final String? profilePath;

    PersonRespose({
        required this.adult,
        required this.alsoKnownAs,
        required this.biography,
        this.birthday,
        this.deathday,
        required this.gender,
        this.homepage,
        required this.id,
        required this.imdbId,
        required this.knownForDepartment,
        required this.name,
        required this.placeOfBirth,
        required this.popularity,
        required this.profilePath,
    });

    factory PersonRespose.fromJson(Map<String, dynamic> json) => PersonRespose(
        adult: json["adult"],
        alsoKnownAs: List<String>.from(json["also_known_as"].map((x) => x)),
        biography: json["biography"],
        birthday: json["birthday"] ?? "",
        deathday: json["deathday"],
        gender: json["gender"],
        homepage: json["homepage"],
        id: json["id"],
        // ignore: prefer_if_null_operators
        imdbId: json["imdb_id"] == null ? 'no hay' : json["imdb_id"],
        knownForDepartment: json["known_for_department"],
        name: json["name"],
        placeOfBirth: json["place_of_birth"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "also_known_as": List<dynamic>.from(alsoKnownAs.map((x) => x)),
        "biography": biography,
        "birthday": "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
        "deathday": deathday,
        "gender": gender,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "known_for_department": knownForDepartment,
        "name": name,
        "place_of_birth": placeOfBirth,
        "popularity": popularity,
        "profile_path": profilePath,
    };
}
