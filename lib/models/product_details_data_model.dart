import 'dart:core';

import 'dart:ffi';

class ProductDetailsDataModel {
  int? id;
  String? name;
  int? price;
  Double? beforeSalePrice;
  String? description;
  String? fullDescription;
  int? order;
  ProductDetailsCategoryDataModel? category;
  ProductDetailsImagesDataModel? images;
  List<ProductDetailsExtraDataModel>? extras = [];
  List<ProductDetailsExtraItemsDataModel>? extraItems = [];
  List<String>? tags = [];
  String? availability;


  ProductDetailsDataModel({
    this.id,
    this.name,
    this.price,
    this.beforeSalePrice,
    this.description,
    this.fullDescription,
    this.order,
    this.category,
    this.images,
    this.extras,
    this.extraItems,
    this.tags,
    this.availability,
  });

  ProductDetailsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    beforeSalePrice = json['before_sale_price'];
    description = json['description'];
    fullDescription = json['full_description'];
    order = json['order'];
    category = json['category'] != null ? ProductDetailsCategoryDataModel.fromJson(json['category']) : null;
    images = json['images'] != null ? ProductDetailsImagesDataModel.fromJson(json['images']) : null;

    if (json['extras'] != null) {
      extras = [];
      json['extras'].forEach((v) {
        extras?.add(ProductDetailsExtraDataModel.fromJson(v));
      });
    }

    if (json['extra_items'] != null) {
      extraItems = [];
      json['extra_items'].forEach((v) {
        extraItems?.add(ProductDetailsExtraItemsDataModel.fromJson(v));
      });
    }
    availability = json['availability'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['before_sale_price'] = beforeSalePrice;
    data['description'] = description;
    data['full_description'] = fullDescription;
    data['order'] = order;
    if (category != null) {
      data['category'] = category;
    }
    if (images != null) {
      data['images'] = images;
    }

    if (extras != null) {
      data['extra_items'] = extras?.map((v) => v.toJson()).toList();
    }
    if (extraItems != null) {
      data['extra_items'] = extraItems?.map((v) => v.toJson()).toList();
    }

    return data;
  }

  String getName(){
    return name ?? '';
  }
  int? getPrice(){
    return price;
  }
  String getDescription(){
    return description ?? '';
  }
  List<ProductDetailsExtraDataModel>? getItemList(){
    return extras ?? [];
  }
  List<ProductDetailsExtraItemsDataModel>? getExtraItemList(){
    return extraItems ?? [];
  }
}

//Product Category Data Model
class ProductDetailsCategoryDataModel {
  int id = 0;
  String name = '';

  ProductDetailsCategoryDataModel({
    required this.id,
    required this.name,
  });

  ProductDetailsCategoryDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }

  String getName(){
    return name;
  }
}

//Product Details Images
class ProductDetailsImagesDataModel {
  String fullSize = '';
  String thumbnail = '';

  ProductDetailsImagesDataModel({
    required this.fullSize,
    required this.thumbnail,
  });

  ProductDetailsImagesDataModel.fromJson(Map<String, dynamic> json) {
    fullSize = json['full_size'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full_size'] = fullSize;
    data['thumbnail'] = thumbnail;
    return data;
  }

  String getFullSizeImage() {
    return fullSize;
  }
  String getThumbImage(){
    return thumbnail;
  }
}


//Product Details Images
class ProductDetailsExtraDataModel {
  int id = 0;
  String name = '';
  String min = '';
  String max = '';

  ProductDetailsExtraDataModel({
    required this.id,
    required this.name,
    required this.min,
    required this.max,
  });

  ProductDetailsExtraDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    min = json['min'];
    max = json['max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['min'] = min;
    data['max'] = max;
    return data;
  }

  String getName() {
    return name;
  }
  String getMaxItem(){
    return max;
  }
  String getMinItem(){
    return min;
  }
}


class ProductDetailsExtraItemsDataModel {
  int id = 0;
  String name = '';
  int extraId = 0;
  String price = '';

  ProductDetailsExtraItemsDataModel({
    required this.id,
    required this.name,
    required this.extraId,
    required this.price,
  });

  ProductDetailsExtraItemsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    extraId = json['extra_id'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['extra_id'] = extraId;
    data['price'] = price;
    return data;
  }

  String getName() {
    return name;
  }
  String getPrice(){
    return price;
  }
  int getExtraID(){
    return extraId;
  }

}