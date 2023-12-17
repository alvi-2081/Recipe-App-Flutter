class SearchRecipeByName {
  SearchRecipeByName({
    this.results,
    this.baseUri,
    this.offset,
    this.number,
    this.totalResults,
    this.processingTimeMs,
    this.expires,
    this.isStale,
  });

  SearchRecipeByName.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    baseUri = json['baseUri'];
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
    processingTimeMs = json['processingTimeMs'];
    expires = json['expires'];
    isStale = json['isStale'];
  }
  List<Results>? results;
  String? baseUri;
  int? offset;
  int? number;
  int? totalResults;
  int? processingTimeMs;
  int? expires;
  bool? isStale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['baseUri'] = baseUri;
    map['offset'] = offset;
    map['number'] = number;
    map['totalResults'] = totalResults;
    map['processingTimeMs'] = processingTimeMs;
    map['expires'] = expires;
    map['isStale'] = isStale;
    return map;
  }
}

class Results {
  Results({
    this.readyInMinutes,
    this.sourceUrl,
    this.image,
    this.servings,
    this.id,
    this.title,
  });

  Results.fromJson(dynamic json) {
    readyInMinutes = json['readyInMinutes'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    servings = json['servings'];
    id = json['id'];
    title = json['title'];
  }
  int? readyInMinutes;
  String? sourceUrl;
  String? image;
  int? servings;
  int? id;
  String? title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['readyInMinutes'] = readyInMinutes;
    map['sourceUrl'] = sourceUrl;
    map['image'] = image;
    map['servings'] = servings;
    map['id'] = id;
    map['title'] = title;
    return map;
  }
}
