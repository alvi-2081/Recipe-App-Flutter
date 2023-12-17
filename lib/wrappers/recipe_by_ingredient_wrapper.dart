class RecipeByIngredientWrapper {
  RecipeByIngredientWrapper({
    this.id,
    this.title,
    this.image,
    this.imageType,
    this.usedIngredientCount,
    this.missedIngredientCount,
    this.missedIngredients,
    this.usedIngredients,
    this.unusedIngredients,
    this.likes,
  });

  RecipeByIngredientWrapper.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    usedIngredientCount = json['usedIngredientCount'];
    missedIngredientCount = json['missedIngredientCount'];
    if (json['missedIngredients'] != null) {
      missedIngredients = [];
      json['missedIngredients'].forEach((v) {
        missedIngredients?.add(MissedIngredients.fromJson(v));
      });
    }
    if (json['usedIngredients'] != null) {
      usedIngredients = [];
      json['usedIngredients'].forEach((v) {
        usedIngredients?.add(UsedIngredients.fromJson(v));
      });
    }
    if (json['unusedIngredients'] != null) {
      unusedIngredients = [];
      // json['unusedIngredients'].forEach((v) {
      //   unusedIngredients?.add(Dynamic.fromJson(v));
      // });
    }
    likes = json['likes'];
  }
  int? id;
  String? title;
  String? image;
  String? imageType;
  int? usedIngredientCount;
  int? missedIngredientCount;
  List<MissedIngredients>? missedIngredients;
  List<UsedIngredients>? usedIngredients;
  List<dynamic>? unusedIngredients;
  int? likes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['image'] = image;
    map['imageType'] = imageType;
    map['usedIngredientCount'] = usedIngredientCount;
    map['missedIngredientCount'] = missedIngredientCount;
    if (missedIngredients != null) {
      map['missedIngredients'] =
          missedIngredients?.map((v) => v.toJson()).toList();
    }
    if (usedIngredients != null) {
      map['usedIngredients'] = usedIngredients?.map((v) => v.toJson()).toList();
    }
    if (unusedIngredients != null) {
      map['unusedIngredients'] =
          unusedIngredients?.map((v) => v.toJson()).toList();
    }
    map['likes'] = likes;
    return map;
  }
}

class UsedIngredients {
  UsedIngredients({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.image,
  });

  UsedIngredients.fromJson(dynamic json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    // if (json['meta'] != null) {
    //   meta = [];
    //   json['meta'].forEach((v) {
    //     meta?.add(Dynamic.fromJson(v));
    //   });
    // }
    image = json['image'];
  }
  int? id;
  double? amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<dynamic>? meta;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['amount'] = amount;
    map['unit'] = unit;
    map['unitLong'] = unitLong;
    map['unitShort'] = unitShort;
    map['aisle'] = aisle;
    map['name'] = name;
    map['original'] = original;
    map['originalName'] = originalName;
    if (meta != null) {
      map['meta'] = meta?.map((v) => v.toJson()).toList();
    }
    map['image'] = image;
    return map;
  }
}

class MissedIngredients {
  MissedIngredients({
    this.id,
    this.amount,
    this.unit,
    this.unitLong,
    this.unitShort,
    this.aisle,
    this.name,
    this.original,
    this.originalName,
    this.meta,
    this.image,
  });

  MissedIngredients.fromJson(dynamic json) {
    id = json['id'];
    amount = json['amount'];
    unit = json['unit'];
    unitLong = json['unitLong'];
    unitShort = json['unitShort'];
    aisle = json['aisle'];
    name = json['name'];
    original = json['original'];
    originalName = json['originalName'];
    meta = json['meta'] != null ? json['meta'].cast<String>() : [];
    image = json['image'];
  }
  int? id;
  double? amount;
  String? unit;
  String? unitLong;
  String? unitShort;
  String? aisle;
  String? name;
  String? original;
  String? originalName;
  List<String>? meta;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['amount'] = amount;
    map['unit'] = unit;
    map['unitLong'] = unitLong;
    map['unitShort'] = unitShort;
    map['aisle'] = aisle;
    map['name'] = name;
    map['original'] = original;
    map['originalName'] = originalName;
    map['meta'] = meta;
    map['image'] = image;
    return map;
  }
}
