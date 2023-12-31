class InformationWrapper {
  InformationWrapper({
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.id,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.image,
    this.imageType,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.winePairing,
    this.instructions,
    this.analyzedInstructions,
    this.originalId,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  InformationWrapper.fromJson(dynamic json) {
    vegetarian = json['vegetarian'];
    vegan = json['vegan'];
    glutenFree = json['glutenFree'];
    dairyFree = json['dairyFree'];
    veryHealthy = json['veryHealthy'];
    cheap = json['cheap'];
    veryPopular = json['veryPopular'];
    sustainable = json['sustainable'];
    lowFodmap = json['lowFodmap'];
    weightWatcherSmartPoints = json['weightWatcherSmartPoints'];
    gaps = json['gaps'];
    preparationMinutes = json['preparationMinutes'];
    cookingMinutes = json['cookingMinutes'];
    aggregateLikes = json['aggregateLikes'];
    healthScore = json['healthScore'];
    creditsText = json['creditsText'];
    license = json['license'];
    sourceName = json['sourceName'];
    pricePerServing = json['pricePerServing'];
    if (json['extendedIngredients'] != null) {
      extendedIngredients = [];
      json['extendedIngredients'].forEach((v) {
        extendedIngredients?.add(ExtendedIngredients.fromJson(v));
      });
    }
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    servings = json['servings'];
    sourceUrl = json['sourceUrl'];
    image = json['image'];
    imageType = json['imageType'];
    summary = json['summary'];
    // if (json['cuisines'] != null) {
    //   cuisines = [];
    //   json['cuisines'].forEach((v) {
    //     cuisines?.add(Dynamic.fromJson(v));
    //   });
    // }
    dishTypes =
        json['dishTypes'] != null ? json['dishTypes'].cast<String>() : [];
    diets = json['diets'] != null ? json['diets'].cast<String>() : [];
    // if (json['occasions'] != null) {
    //   occasions = [];
    //   json['occasions'].forEach((v) {
    //     occasions?.add(Dynamic.fromJson(v));
    //   });
    // }
    winePairing = json['winePairing'] != null
        ? WinePairing.fromJson(json['winePairing'])
        : null;
    instructions = json['instructions'];
    if (json['analyzedInstructions'] != null) {
      analyzedInstructions = [];
      json['analyzedInstructions'].forEach((v) {
        analyzedInstructions?.add(AnalyzedInstructions.fromJson(v));
      });
    }
    originalId = json['originalId'];
    spoonacularScore = json['spoonacularScore'];
    spoonacularSourceUrl = json['spoonacularSourceUrl'];
  }
  bool? vegetarian;
  bool? vegan;
  bool? glutenFree;
  bool? dairyFree;
  bool? veryHealthy;
  bool? cheap;
  bool? veryPopular;
  bool? sustainable;
  bool? lowFodmap;
  int? weightWatcherSmartPoints;
  String? gaps;
  int? preparationMinutes;
  int? cookingMinutes;
  int? aggregateLikes;
  int? healthScore;
  String? creditsText;
  String? license;
  String? sourceName;
  double? pricePerServing;
  List<ExtendedIngredients>? extendedIngredients;
  int? id;
  String? title;
  int? readyInMinutes;
  int? servings;
  String? sourceUrl;
  String? image;
  String? imageType;
  String? summary;
  List<dynamic>? cuisines;
  List<String>? dishTypes;
  List<String>? diets;
  List<dynamic>? occasions;
  WinePairing? winePairing;
  String? instructions;
  List<AnalyzedInstructions>? analyzedInstructions;
  dynamic originalId;
  double? spoonacularScore;
  String? spoonacularSourceUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vegetarian'] = vegetarian;
    map['vegan'] = vegan;
    map['glutenFree'] = glutenFree;
    map['dairyFree'] = dairyFree;
    map['veryHealthy'] = veryHealthy;
    map['cheap'] = cheap;
    map['veryPopular'] = veryPopular;
    map['sustainable'] = sustainable;
    map['lowFodmap'] = lowFodmap;
    map['weightWatcherSmartPoints'] = weightWatcherSmartPoints;
    map['gaps'] = gaps;
    map['preparationMinutes'] = preparationMinutes;
    map['cookingMinutes'] = cookingMinutes;
    map['aggregateLikes'] = aggregateLikes;
    map['healthScore'] = healthScore;
    map['creditsText'] = creditsText;
    map['license'] = license;
    map['sourceName'] = sourceName;
    map['pricePerServing'] = pricePerServing;
    if (extendedIngredients != null) {
      map['extendedIngredients'] =
          extendedIngredients?.map((v) => v.toJson()).toList();
    }
    map['id'] = id;
    map['title'] = title;
    map['readyInMinutes'] = readyInMinutes;
    map['servings'] = servings;
    map['sourceUrl'] = sourceUrl;
    map['image'] = image;
    map['imageType'] = imageType;
    map['summary'] = summary;
    if (cuisines != null) {
      map['cuisines'] = cuisines?.map((v) => v.toJson()).toList();
    }
    map['dishTypes'] = dishTypes;
    map['diets'] = diets;
    if (occasions != null) {
      map['occasions'] = occasions?.map((v) => v.toJson()).toList();
    }
    if (winePairing != null) {
      map['winePairing'] = winePairing?.toJson();
    }
    map['instructions'] = instructions;
    if (analyzedInstructions != null) {
      map['analyzedInstructions'] =
          analyzedInstructions?.map((v) => v.toJson()).toList();
    }
    map['originalId'] = originalId;
    map['spoonacularScore'] = spoonacularScore;
    map['spoonacularSourceUrl'] = spoonacularSourceUrl;
    return map;
  }
}

class AnalyzedInstructions {
  AnalyzedInstructions({
    this.name,
    this.steps,
  });

  AnalyzedInstructions.fromJson(dynamic json) {
    name = json['name'];
    if (json['steps'] != null) {
      steps = [];
      json['steps'].forEach((v) {
        steps?.add(Steps.fromJson(v));
      });
    }
  }
  String? name;
  List<Steps>? steps;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    if (steps != null) {
      map['steps'] = steps?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Steps {
  Steps({
    this.number,
    this.step,
    this.ingredients,
    this.equipment,
  });

  Steps.fromJson(dynamic json) {
    number = json['number'];
    step = json['step'];
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
    // if (json['equipment'] != null) {
    //   equipment = [];
    //   json['equipment'].forEach((v) {
    //     equipment?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  int? number;
  String? step;
  List<Ingredients>? ingredients;
  List<dynamic>? equipment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['step'] = step;
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    if (equipment != null) {
      map['equipment'] = equipment?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Ingredients {
  Ingredients({
    this.id,
    this.name,
    this.localizedName,
    this.image,
  });

  Ingredients.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    localizedName = json['localizedName'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['localizedName'] = localizedName;
    map['image'] = image;
    return map;
  }
}

class WinePairing {
  WinePairing({
    this.pairedWines,
    this.pairingText,
    this.productMatches,
  });

  WinePairing.fromJson(dynamic json) {
    // if (json['pairedWines'] != null) {
    //   pairedWines = [];
    //   json['pairedWines'].forEach((v) {
    //     pairedWines?.add(Dynamic.fromJson(v));
    //   });
    // }
    pairingText = json['pairingText'];
    // if (json['productMatches'] != null) {
    //   productMatches = [];
    //   json['productMatches'].forEach((v) {
    //     productMatches?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  List<dynamic>? pairedWines;
  String? pairingText;
  List<dynamic>? productMatches;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pairedWines != null) {
      map['pairedWines'] = pairedWines?.map((v) => v.toJson()).toList();
    }
    map['pairingText'] = pairingText;
    if (productMatches != null) {
      map['productMatches'] = productMatches?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ExtendedIngredients {
  ExtendedIngredients({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  ExtendedIngredients.fromJson(dynamic json) {
    id = json['id'];
    aisle = json['aisle'];
    image = json['image'];
    consistency = json['consistency'];
    name = json['name'];
    nameClean = json['nameClean'];
    original = json['original'];
    originalName = json['originalName'];
    amount = json['amount'];
    unit = json['unit'];
    meta = json['meta'] != null ? json['meta'].cast<String>() : [];
    measures =
        json['measures'] != null ? Measures.fromJson(json['measures']) : null;
  }
  int? id;
  String? aisle;
  String? image;
  String? consistency;
  String? name;
  String? nameClean;
  String? original;
  String? originalName;
  double? amount;
  String? unit;
  List<String>? meta;
  Measures? measures;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['aisle'] = aisle;
    map['image'] = image;
    map['consistency'] = consistency;
    map['name'] = name;
    map['nameClean'] = nameClean;
    map['original'] = original;
    map['originalName'] = originalName;
    map['amount'] = amount;
    map['unit'] = unit;
    map['meta'] = meta;
    if (measures != null) {
      map['measures'] = measures?.toJson();
    }
    return map;
  }
}

class Measures {
  Measures({
    this.us,
    this.metric,
  });

  Measures.fromJson(dynamic json) {
    us = json['us'] != null ? Us.fromJson(json['us']) : null;
    metric = json['metric'] != null ? Metric.fromJson(json['metric']) : null;
  }
  Us? us;
  Metric? metric;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (us != null) {
      map['us'] = us?.toJson();
    }
    if (metric != null) {
      map['metric'] = metric?.toJson();
    }
    return map;
  }
}

class Metric {
  Metric({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Metric.fromJson(dynamic json) {
    amount = json['amount'];
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }
  double? amount;
  String? unitShort;
  String? unitLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['unitShort'] = unitShort;
    map['unitLong'] = unitLong;
    return map;
  }
}

class Us {
  Us({
    this.amount,
    this.unitShort,
    this.unitLong,
  });

  Us.fromJson(dynamic json) {
    amount = json['amount'];
    unitShort = json['unitShort'];
    unitLong = json['unitLong'];
  }
  double? amount;
  String? unitShort;
  String? unitLong;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['unitShort'] = unitShort;
    map['unitLong'] = unitLong;
    return map;
  }
}
