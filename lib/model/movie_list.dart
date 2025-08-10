import 'dart:convert';

MovieModel movieModelFromJson(String str) =>
    MovieModel.fromJson(json.decode(str));

String movieModelToJson(MovieModel data) => json.encode(data.toJson());

class MovieModel {
  final String? backdropPath;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final DateTime? releaseDate;
  final String? title;
  final double? voteAverage;

  MovieModel({
    this.backdropPath,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    backdropPath: json["backdrop_path"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    releaseDate: json["release_date"] == null
        ? null
        : DateTime.parse(json["release_date"]),
    title: json["title"],
    voteAverage: json["vote_average"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date":
        "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    "vote_average": voteAverage,
  };
}

final List movieList = [
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop1.jpg",
    overview:
        "Will Radford is a top analyst for Homeland Security who tracks potential threats through a mass surveillance program, until one day an attack by an unknown entity leads him to question whether the government is hiding something from him... and from the rest of the world.",
    popularity: 1951.6717,
    posterPath: "assets/images/poster/ic_poster1.jpg",
    releaseDate: DateTime(2025, 7, 29),
    title: "War of the Worlds",
    voteAverage: 4.467,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop2.jpg",
    overview:
        "Five years after the events of Jurassic World Dominion, covert operations expert Zora Bennett is contracted to lead a skilled team on a top-secret mission to secure genetic material from the world's three most massive dinosaurs. When Zora's operation intersects with a civilian family whose boating expedition was capsized, they all find themselves stranded on an island where they come face-to-face with a sinister, shocking discovery that's been hidden from the world for decades.",
    popularity: 1236.3748,
    posterPath: "assets/images/poster/ic_poster2.jpg",
    releaseDate: DateTime(2025, 7, 1),
    title: "Jurassic World Rebirth",
    voteAverage: 6.406,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop3.jpg",
    overview:
        "A blogger who is also a werewolf meets a dashing playboy with a dark secret of his own. Starring Logan Andrews and Christian Howard.",
    popularity: 421.3215,
    posterPath: "assets/images/poster/ic_poster3.jpg",
    releaseDate: DateTime(2025, 7, 29),
    title: "Night Carnage",
    voteAverage: 5.444,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop4.jpg",
    overview:
        "A routine cash pickup takes a wild turn when mismatched armored truck drivers Russell and Travis are ambushed by ruthless criminals led by savvy mastermind Zoe.",
    popularity: 477.8545,
    posterPath: "assets/images/poster/ic_poster4.jpg",
    releaseDate: DateTime(2025, 7, 27),
    title: "The Pickup",
    voteAverage: 6.75,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop5.jpg",
    overview:
        "Taishi Wen Zhong led the army of Shang Dynasty including Deng Chanyu and four generals of the Mo Family to Xiqi. With the help of Kunlun immortals such as Jiang Ziya, Ji Fa led the army and civilians of Xiqi to defend their homeland.",
    popularity: 471.5759,
    posterPath: "assets/images/poster/ic_poster5.jpg",
    releaseDate: DateTime(2025, 1, 29),
    title: "Creation of the Gods II: Demon Force",
    voteAverage: 6.221,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop6.jpg",
    overview:
        "On the rugged isle of Berk, where Vikings and dragons have been bitter enemies for generations, Hiccup stands apart, defying centuries of tradition when he befriends Toothless, a feared Night Fury dragon. Their unlikely bond reveals the true nature of dragons, challenging the very foundations of Viking society.",
    popularity: 396.9524,
    posterPath: "assets/images/poster/ic_poster6.jpg",
    releaseDate: DateTime(2025, 6, 6),
    title: "How to Train Your Dragon",
    voteAverage: 8.0,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop7.jpg",
    overview:
        "As the Demon Slayer Corps members and Hashira engaged in a group strength training program, the Hashira Training, in preparation for the forthcoming battle against the demons, Muzan Kibutsuji appears at the Ubuyashiki Mansion. With the head of the Demon Corps in danger, Tanjiro and the Hashira rush to the headquarters but are plunged into a deep descent to a mysterious space by the hands of Muzan Kibutsuji. The destination of where Tanjiro and Demon Slayer Corps have fallen is the demons' stronghold – the Infinity Castle. And so, the battleground is set as the final battle between the Demon Slayer Corps and the demons ignites.",
    popularity: 342.7101,
    posterPath: "assets/images/poster/ic_poster7.jpg",
    releaseDate: DateTime(2025, 7, 18),
    title: "Demon Slayer: Kimetsu no Yaiba — Infinity Castle",
    voteAverage: 7.1,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop8.jpg",
    overview:
        "Twenty-eight years since the rage virus escaped a biological weapons laboratory, now, still in a ruthlessly enforced quarantine, some have found ways to exist amidst the infected. One such group lives on a small island connected to the mainland by a single, heavily-defended causeway. When one member departs on a mission into the dark heart of the mainland, he discovers secrets, wonders, and horrors that have mutated not only the infected but other survivors as well.",
    popularity: 266.1237,
    posterPath: "assets/images/poster/ic_poster8.jpg",
    releaseDate: DateTime(2025, 6, 18),
    title: "28 Years Later",
    voteAverage: 6.887,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop9.jpg",
    overview:
        "After a catastrophic event leaves their bodies destroyed, Ne Zha and Ao Bing are granted a fragile second chance at life. As tensions rise between the dragon clans and celestial forces, the two must undergo a series of perilous trials that will test their bond, challenge their identities, and decide the fate of both mortals and immortals.",
    popularity: 284.5355,
    posterPath: "assets/images/poster/ic_poster9.jpg",
    releaseDate: DateTime(2025, 1, 29),
    title: "Ne Zha 2",
    voteAverage: 8.028,
  ),
  MovieModel(
    backdropPath: "assets/images/backdrop/ic_backdrop10.jpg",
    overview:
        "The wildly funny and touching story of a lonely Hawaiian girl and the fugitive alien who helps to mend her broken family.",
    popularity: 239.6152,
    posterPath: "assets/images/poster/ic_poster10.jpg",
    releaseDate: DateTime(2025, 5, 17),
    title: "Lilo & Stitch",
    voteAverage: 7.328,
  ),
];
