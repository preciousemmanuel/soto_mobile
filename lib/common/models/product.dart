import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:soto_ecommerce/common/models/auth_user.dart';
import 'package:soto_ecommerce/common/models/product_category.dart';

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
  final int? totalQuantitySold;
  final String? id;
  final String? productName;
  final String? description;
  final ProductCategory? category;
  final List<dynamic>? images;
  final String? vendor;
  final String? status;
  final int? unitPrice;
  final int? rawPrice;
  final int? discountPrice;
  final int? productQuantity;
  final int? height;
  final int? width;
  final double? weight;
  final bool? isDiscounted;
  final bool? inStock;
  final bool? isVerified;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final int? rating;

  const Product({
    this.totalQuantitySold,
    this.id,
    this.productName,
    this.description,
    this.category,
    this.images,
    this.vendor,
    this.status,
    this.unitPrice,
    this.rawPrice,
    this.discountPrice,
    this.productQuantity,
    this.height,
    this.width,
    this.weight,
    this.isDiscounted,
    this.inStock,
    this.isVerified,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        totalQuantitySold: json["total_quantity_sold"],
        id: json["_id"],
        productName: json["product_name"],
        description: json["description"],
        category: json["category"] == null
            ? null
            : ProductCategory.fromJson(json["category"]),
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        vendor: json["vendor"],
        status: json["status"],
        unitPrice: json["unit_price"],
        rawPrice: json["raw_price"],
        discountPrice: json["discount_price"],
        productQuantity: json["product_quantity"],
        height: json["height"],
        width: json["width"],
        weight: json["weight"]?.toDouble(),
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
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "total_quantity_sold": totalQuantitySold,
        "_id": id,
        "product_name": productName,
        "description": description,
        "category": category?.toJson(),
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "vendor": vendor,
        "status": status,
        "unit_price": unitPrice,
        "raw_price": rawPrice,
        "discount_price": discountPrice,
        "product_quantity": productQuantity,
        "height": height,
        "width": width,
        "weight": weight,
        "is_discounted": isDiscounted,
        "in_stock": inStock,
        "is_verified": isVerified,
        "is_deleted": isDeleted,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "rating": rating,
      };

  @override
  List<Object?> get props => [
        id,
        productName,
        description,
        category,
        images,
        vendor,
        status,
        unitPrice,
        productQuantity,
        height,
        width,
        weight,
        isDiscounted,
        inStock,
        isVerified,
        isDeleted,
        createdAt,
        updatedAt,
        v,
        rating
      ];
}

// class Category {
//   final String? id;
//   final String? name;

//   Category({
//     this.id,
//     this.name,
//   });

//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["_id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//       };
// }

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

// class ProductShippingPayload {
//   ProductShippingPayload({required this.productId, required this.quantity});

//   final String productId;
//   final String quantity;

//   @override
//   String toString() =>
//       'ProductShippingPayload(productId: $productId, quantity: $quantity)';

//   Map<String, dynamic> toMap() {
//     return {
//       'productId': productId,
//       'quantity': quantity,
//     };
//   }
// }
