class CategoriesResponse {
  CategoriesResponse({
      this.categories,});

  CategoriesResponse.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
  }
  List<Categories>? categories;
CategoriesResponse copyWith({  List<Categories>? categories,
}) => CategoriesResponse(  categories: categories ?? this.categories,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Categories {
  Categories({
      this.idCategory, 
      this.strCategory, 
      this.strCategoryThumb, 
      this.strCategoryDescription,});

  Categories.fromJson(dynamic json) {
    idCategory = json['idCategory'];
    strCategory = json['strCategory'];
    strCategoryThumb = json['strCategoryThumb'];
    strCategoryDescription = json['strCategoryDescription'];
  }
  String? idCategory;
  String? strCategory;
  String? strCategoryThumb;
  String? strCategoryDescription;
Categories copyWith({  String? idCategory,
  String? strCategory,
  String? strCategoryThumb,
  String? strCategoryDescription,
}) => Categories(  idCategory: idCategory ?? this.idCategory,
  strCategory: strCategory ?? this.strCategory,
  strCategoryThumb: strCategoryThumb ?? this.strCategoryThumb,
  strCategoryDescription: strCategoryDescription ?? this.strCategoryDescription,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idCategory'] = idCategory;
    map['strCategory'] = strCategory;
    map['strCategoryThumb'] = strCategoryThumb;
    map['strCategoryDescription'] = strCategoryDescription;
    return map;
  }

}