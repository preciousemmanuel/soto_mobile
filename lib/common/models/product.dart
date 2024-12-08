import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:soto_ecommerce/common/models/auth_user.dart';

List<Product> productFromJson(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductData {
  final Product? product;
  final List<Review>? reviews;
  final int? totalReviews;

  ProductData({
    this.product,
    this.reviews,
    this.totalReviews,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) => ProductData(
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        reviews: json["reviews"] == null
            ? []
            : List<Review>.from(
                json["reviews"]!.map((x) => Review.fromJson(x))),
        totalReviews: json["total_reviews"],
      );

  Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "reviews": reviews == null
            ? []
            : List<dynamic>.from(reviews!.map((x) => x.toJson())),
        "total_reviews": totalReviews,
      };
}

class Product extends Equatable {
  final String? id;
  final String? productName;
  final String? description;
  final Category? category; //
  final List<dynamic>? images;
  final String? vendor;
  final int? unitPrice;
  final int? productQuantity;
  final bool? isDiscounted;
  final bool? inStock;
  final bool? isVerified;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const Product({
    this.id,
    this.productName,
    this.description,
    this.category,
    this.images,
    this.vendor,
    this.unitPrice,
    this.productQuantity,
    this.isDiscounted,
    this.inStock,
    this.isVerified,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productName: json["product_name"],
        description: json["description"],
        category: json["category"] == null
            ? null
            : Category.fromJson(json["category"]),
        images: json["images"] == null || json["images"]?.isEmpty
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        vendor: json["vendor"],
        unitPrice: json["unit_price"],
        productQuantity: json["product_quantity"],
        isDiscounted: json["is_discounted"],
        inStock: json["in_stock"],
        isVerified: json["is_verified"],
        isDeleted: json["is_deleted"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_name": productName,
        "description": description,
        // "category": category?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "vendor": vendor,
        "unit_price": unitPrice,
        "product_quantity": productQuantity,
        "is_discounted": isDiscounted,
        "in_stock": inStock,
        "is_verified": isVerified,
        "is_deleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  @override
  List<Object?> get props => [
        id,
        productName,
        description,
        category,
        images,
        vendor,
        unitPrice,
        productQuantity,
        isDiscounted,
        inStock,
        isVerified,
        isDeleted,
        createdAt,
        updatedAt,
        v,
      ];
}

class Category {
  final String? id;
  final String? name;

  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}

class Review {
  final String? id;
  final String? comment;
  final String? product;
  final AuthUser? user;
  final int? rating;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Review({
    this.id,
    this.comment,
    this.product,
    this.user,
    this.rating,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        id: json["_id"],
        comment: json["comment"],
        product: json["product"],
        user: json["user"] == null ? null : AuthUser.fromJson(json["user"]),
        rating: json["rating"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "comment": comment,
        "product": product,
        "user": user?.toJson(),
        "rating": rating,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

List<WaitlistRes> waitlistResFromJson(String str) => List<WaitlistRes>.from(
    json.decode(str).map((x) => WaitlistRes.fromJson(x)));

String waitlistResToJson(List<WaitlistRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WaitlistRes {
  final String? id;
  final Product? product;
  final String? user;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  WaitlistRes({
    this.id,
    this.product,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WaitlistRes.fromJson(Map<String, dynamic> json) => WaitlistRes(
        id: json["_id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        user: json["user"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product": product?.toJson(),
        "user": user,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
