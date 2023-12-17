class NutritionWrapper {
  NutritionWrapper({
    this.calories,
    this.carbs,
    this.fat,
    this.protein,
    this.bad,
    this.good,
    this.nutrients,
    this.properties,
    this.flavonoids,
    this.ingredients,
    this.caloricBreakdown,
    this.weightPerServing,
    this.expires,
    this.isStale,
  });

  NutritionWrapper.fromJson(dynamic json) {
    calories = json['calories'];
    carbs = json['carbs'];
    fat = json['fat'];
    protein = json['protein'];
    if (json['bad'] != null) {
      bad = [];
      json['bad'].forEach((v) {
        bad?.add(Bad.fromJson(v));
      });
    }
    if (json['good'] != null) {
      good = [];
      json['good'].forEach((v) {
        good?.add(Good.fromJson(v));
      });
    }
    if (json['nutrients'] != null) {
      nutrients = [];
      json['nutrients'].forEach((v) {
        nutrients?.add(Nutrients.fromJson(v));
      });
    }
    if (json['properties'] != null) {
      properties = [];
      json['properties'].forEach((v) {
        properties?.add(Properties.fromJson(v));
      });
    }
    if (json['flavonoids'] != null) {
      flavonoids = [];
      json['flavonoids'].forEach((v) {
        flavonoids?.add(Flavonoids.fromJson(v));
      });
    }
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
    caloricBreakdown = json['caloricBreakdown'] != null
        ? CaloricBreakdown.fromJson(json['caloricBreakdown'])
        : null;
    weightPerServing = json['weightPerServing'] != null
        ? WeightPerServing.fromJson(json['weightPerServing'])
        : null;
    expires = json['expires'];
    isStale = json['isStale'];
  }
  String? calories;
  String? carbs;
  String? fat;
  String? protein;
  List<Bad>? bad;
  List<Good>? good;
  List<Nutrients>? nutrients;
  List<Properties>? properties;
  List<Flavonoids>? flavonoids;
  List<Ingredients>? ingredients;
  CaloricBreakdown? caloricBreakdown;
  WeightPerServing? weightPerServing;
  num? expires;
  bool? isStale;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['calories'] = calories;
    map['carbs'] = carbs;
    map['fat'] = fat;
    map['protein'] = protein;
    if (bad != null) {
      map['bad'] = bad?.map((v) => v.toJson()).toList();
    }
    if (good != null) {
      map['good'] = good?.map((v) => v.toJson()).toList();
    }
    if (nutrients != null) {
      map['nutrients'] = nutrients?.map((v) => v.toJson()).toList();
    }
    if (properties != null) {
      map['properties'] = properties?.map((v) => v.toJson()).toList();
    }
    if (flavonoids != null) {
      map['flavonoids'] = flavonoids?.map((v) => v.toJson()).toList();
    }
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    if (caloricBreakdown != null) {
      map['caloricBreakdown'] = caloricBreakdown?.toJson();
    }
    if (weightPerServing != null) {
      map['weightPerServing'] = weightPerServing?.toJson();
    }
    map['expires'] = expires;
    map['isStale'] = isStale;
    return map;
  }
}

class WeightPerServing {
  WeightPerServing({
    this.amount,
    this.unit,
  });

  WeightPerServing.fromJson(dynamic json) {
    amount = json['amount'];
    unit = json['unit'];
  }
  num? amount;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['unit'] = unit;
    return map;
  }
}

class CaloricBreakdown {
  CaloricBreakdown({
    this.percentFat,
    this.percentCarbs,
    this.percentProtein,
  });

  CaloricBreakdown.fromJson(dynamic json) {
    percentFat = json['percentFat'];
    percentCarbs = json['percentCarbs'];
    percentProtein = json['percentProtein'];
  }
  num? percentFat;
  num? percentCarbs;
  num? percentProtein;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['percentFat'] = percentFat;
    map['percentCarbs'] = percentCarbs;
    map['percentProtein'] = percentProtein;
    return map;
  }
}

class Ingredients {
  Ingredients({
    this.name,
    this.amount,
    this.unit,
    this.id,
    this.nutrients,
  });

  Ingredients.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    id = json['id'];
    if (json['nutrients'] != null) {
      nutrients = [];
      json['nutrients'].forEach((v) {
        nutrients?.add(Nutrients.fromJson(v));
      });
    }
  }
  String? name;
  num? amount;
  String? unit;
  num? id;
  List<Nutrients>? nutrients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    map['id'] = id;
    if (nutrients != null) {
      map['nutrients'] = nutrients?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Nutrients {
  Nutrients({
    this.name,
    this.amount,
    this.unit,
    this.percentOfDailyNeeds,
  });

  Nutrients.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }
  String? name;
  num? amount;
  String? unit;
  num? percentOfDailyNeeds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    map['percentOfDailyNeeds'] = percentOfDailyNeeds;
    return map;
  }
}

class Flavonoids {
  Flavonoids({
    this.name,
    this.amount,
    this.unit,
  });

  Flavonoids.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }
  String? name;
  num? amount;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    return map;
  }
}

class Properties {
  Properties({
    this.name,
    this.amount,
    this.unit,
  });

  Properties.fromJson(dynamic json) {
    name = json['name'];
    amount = json['amount'];
    unit = json['unit'];
  }
  String? name;
  num? amount;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['amount'] = amount;
    map['unit'] = unit;
    return map;
  }
}

class Good {
  Good({
    this.amount,
    this.indented,
    this.title,
    this.percentOfDailyNeeds,
  });

  Good.fromJson(dynamic json) {
    amount = json['amount'];
    indented = json['indented'];
    title = json['title'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }
  String? amount;
  bool? indented;
  String? title;
  num? percentOfDailyNeeds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['indented'] = indented;
    map['title'] = title;
    map['percentOfDailyNeeds'] = percentOfDailyNeeds;
    return map;
  }
}

class Bad {
  Bad({
    this.amount,
    this.indented,
    this.title,
    this.percentOfDailyNeeds,
  });

  Bad.fromJson(dynamic json) {
    amount = json['amount'];
    indented = json['indented'];
    title = json['title'];
    percentOfDailyNeeds = json['percentOfDailyNeeds'];
  }
  String? amount;
  bool? indented;
  String? title;
  num? percentOfDailyNeeds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['indented'] = indented;
    map['title'] = title;
    map['percentOfDailyNeeds'] = percentOfDailyNeeds;
    return map;
  }
}
