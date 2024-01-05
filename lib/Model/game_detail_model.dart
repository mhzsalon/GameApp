class GameModel {
  int id;
  String slug;
  String name;
  String nameOriginal;
  String description;
  int metacritic;
  DateTime released;
  DateTime updated;
  String backgroundImage;
  String backgroundImageAdditional;
  String rating;
  List<PlatformElement> platforms;
  List<Developer> developers;
  List<Developer> genres;
  List<Developer> publishers;

  GameModel({
    required this.id,
    required this.slug,
    required this.name,
    required this.nameOriginal,
    required this.description,
    required this.metacritic,
    required this.released,
    required this.updated,
    required this.backgroundImage,
    required this.backgroundImageAdditional,
    required this.rating,
    required this.platforms,
    required this.developers,
    required this.genres,
    required this.publishers,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        released: DateTime.parse(json["released"]),
        updated: DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        rating: json["rating"].toString(),
        platforms: List<PlatformElement>.from(
            json["platforms"].map((x) => PlatformElement.fromJson(x))),
        developers: List<Developer>.from(
            json["developers"].map((x) => Developer.fromJson(x))),
        genres: List<Developer>.from(
            json["genres"].map((x) => Developer.fromJson(x))),
        publishers: List<Developer>.from(
            json["publishers"].map((x) => Developer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "released":
            "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "updated": updated.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "rating": rating,
        "platforms": List<dynamic>.from(platforms.map((x) => x.toJson())),
        "developers": List<dynamic>.from(developers.map((x) => x.toJson())),
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "publishers": List<dynamic>.from(publishers.map((x) => x.toJson())),
      };
}

class Developer {
  int id;
  String name;
  String slug;
  int gamesCount;
  String imageBackground;

  Developer({
    required this.id,
    required this.name,
    required this.slug,
    required this.gamesCount,
    required this.imageBackground,
  });

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class PlatformElement {
  PlatformPlatform platform;
  DateTime releasedAt;
  Requirements requirements;

  PlatformElement({
    required this.platform,
    required this.releasedAt,
    required this.requirements,
  });

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: PlatformPlatform.fromJson(json["platform"]),
        releasedAt: DateTime.parse(json["released_at"]),
        requirements: Requirements.fromJson(json["requirements"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform.toJson(),
        "released_at":
            "${releasedAt.year.toString().padLeft(4, '0')}-${releasedAt.month.toString().padLeft(2, '0')}-${releasedAt.day.toString().padLeft(2, '0')}",
        "requirements": requirements.toJson(),
      };
}

class PlatformPlatform {
  int id;
  String name;
  String slug;
  dynamic image;
  dynamic yearEnd;
  int? yearStart;
  int gamesCount;
  String imageBackground;

  PlatformPlatform({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.yearEnd,
    required this.yearStart,
    required this.gamesCount,
    required this.imageBackground,
  });

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"],
        gamesCount: json["games_count"],
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Requirements {
  String? minimum;
  String? recommended;

  Requirements({
    this.minimum,
    this.recommended,
  });

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
        recommended: json["recommended"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
        "recommended": recommended,
      };
}
