class IngredientWrapper {
  IngredientWrapper({
    this.ingredients,
  });

  IngredientWrapper.fromJson(dynamic json) {
    if (json['ingredients'] != null) {
      ingredients = [];
      json['ingredients'].forEach((v) {
        ingredients?.add(Ingredients.fromJson(v));
      });
    }
  }
  List<Ingredients>? ingredients;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ingredients != null) {
      map['ingredients'] = ingredients?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Ingredients {
  Ingredients({
    this.name,
    this.image,
    this.amount,
  });

  Ingredients.fromJson(dynamic json) {
    name = json['name'];
    image = json['image'];
    amount = json['amount'] != null ? Amount.fromJson(json['amount']) : null;
  }
  String? name;
  String? image;
  Amount? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['image'] = image;
    if (amount != null) {
      map['amount'] = amount?.toJson();
    }
    return map;
  }
}

class Amount {
  Amount({
    this.metric,
    this.us,
  });

  Amount.fromJson(dynamic json) {
    metric = json['metric'] != null ? Metric.fromJson(json['metric']) : null;
    us = json['us'] != null ? Us.fromJson(json['us']) : null;
  }
  Metric? metric;
  Us? us;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (metric != null) {
      map['metric'] = metric?.toJson();
    }
    if (us != null) {
      map['us'] = us?.toJson();
    }
    return map;
  }
}

class Us {
  Us({
    this.value,
    this.unit,
  });

  Us.fromJson(dynamic json) {
    value = json['value'];
    unit = json['unit'];
  }
  double? value;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['unit'] = unit;
    return map;
  }
}

class Metric {
  Metric({
    this.value,
    this.unit,
  });

  Metric.fromJson(dynamic json) {
    value = json['value'];
    unit = json['unit'];
  }
  double? value;
  String? unit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['value'] = value;
    map['unit'] = unit;
    return map;
  }
}
