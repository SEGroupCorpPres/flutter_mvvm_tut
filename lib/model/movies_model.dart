/// {
  /// movies : [
  ///   {
      /// "id":"1",
      /// "title":"Game Night",
      /// "year":"2018",
      /// "genres":["Action","Comedy","Crime"],
      /// "ratings":[2,10,1,10,6,2,5,2,9,7,5,3,7,7,1,4,5,9,2,8,10,8,1,10,7,10,8,6,7,6],
      /// "poster":"MV5BMjQxMDE5NDg0NV5BMl5BanBnXkFtZTgwNTA5MDE2NDM@._V1_SY500_CR0,0,337,500_AL_.jpg",
      /// "contentRating":"11",
      /// "duration":"PT100M",
      /// "releaseDate":"2018-02-28",
      /// "averageRating":0,
      /// "originalTitle":"",
      /// "storyline":"A group of friends who meet regularly for game nights find themselves trying to solve a murder mystery.",
      /// "actors":["Rachel McAdams","Jesse Plemons","Jason Bateman"],
      /// "imdbRating":"",
      /// "posterUrl":"https://images-na.ssl-images-amazon.com/images/M/MV5BMjQxMDE5NDg0NV5BMl5BanBnXkFtZTgwNTA5MDE2NDM@._V1_SY500_CR0,0,337,500_AL_.jpg",
  ///   },
  ///   null,
  /// ],
/// }

class MovieListModel {
  MovieListModel({
    this.movies,
  });

  MovieListModel.fromJson(dynamic json) {
    if (json['movies'] != null) {
      movies = [];
      json['movies'].forEach((v) {
        movies?.add(Movies.fromJson(v));
      });
    }
  }

  List<Movies>? movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movies != null) {
      map['movies'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : "1"
/// title : "Game Night"
/// year : "2018"
/// genres : ["Action","Comedy","Crime"]
/// ratings : [2,10,1,10,6,2,5,2,9,7,5,3,7,7,1,4,5,9,2,8,10,8,1,10,7,10,8,6,7,6]
/// poster : "MV5BMjQxMDE5NDg0NV5BMl5BanBnXkFtZTgwNTA5MDE2NDM@._V1_SY500_CR0,0,337,500_AL_.jpg"
/// contentRating : "11"
/// duration : "PT100M"
/// releaseDate : "2018-02-28"
/// averageRating : 0
/// originalTitle : ""
/// storyline : "A group of friends who meet regularly for game nights find themselves trying to solve a murder mystery."
/// actors : ["Rachel McAdams","Jesse Plemons","Jason Bateman"]
/// imdbRating : ""
/// posterUrl : "https://images-na.ssl-images-amazon.com/images/M/MV5BMjQxMDE5NDg0NV5BMl5BanBnXkFtZTgwNTA5MDE2NDM@._V1_SY500_CR0,0,337,500_AL_.jpg"

class Movies {
  Movies({
    this.id,
    this.title,
    this.year,
    this.genres,
    this.ratings,
    this.poster,
    this.contentRating,
    this.duration,
    this.releaseDate,
    this.averageRating,
    this.originalTitle,
    this.storyline,
    this.actors,
    this.imdbRating,
    this.posterUrl,
  });

  Movies.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    ratings = json['ratings'] != null ? json['ratings'].cast<int>() : [];
    poster = json['poster'];
    contentRating = json['contentRating'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    averageRating = json['averageRating'];
    originalTitle = json['originalTitle'];
    storyline = json['storyline'];
    actors = json['actors'] != null ? json['actors'].cast<String>() : [];
    imdbRating = json['imdbRating'];
    posterUrl = json['posterurl'];
  }

  String? id;
  String? title;
  String? year;
  List<String>? genres;
  List<int>? ratings;
  String? poster;
  dynamic contentRating;
  String? duration;
  String? releaseDate;
  dynamic averageRating;
  String? originalTitle;
  String? storyline;
  List<String>? actors;
  dynamic imdbRating;
  String? posterUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['year'] = year;
    map['genres'] = genres;
    map['ratings'] = ratings;
    map['poster'] = poster;
    map['contentRating'] = contentRating;
    map['duration'] = duration;
    map['releaseDate'] = releaseDate;
    map['averageRating'] = averageRating;
    map['originalTitle'] = originalTitle;
    map['storyline'] = storyline;
    map['actors'] = actors;
    map['imdbRating'] = imdbRating;
    map['posterurl'] = posterUrl;
    return map;
  }
}
