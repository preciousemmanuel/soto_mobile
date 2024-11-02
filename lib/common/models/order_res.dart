import 'dart:convert';

List<OrderRes> orderResFromJson(String str) =>
    List<OrderRes>.from(json.decode(str).map((x) => OrderRes.fromJson(x)));

String orderResToJson(List<OrderRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderRes {
  final String? id;
  final ProductId? productId;
  final int? quantity;
  final int? unitPrice;
  final String? vendor;
  final Buyer? buyer;
  final bool? isDiscounted;
  final String? status;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderRes({
    this.id,
    this.productId,
    this.quantity,
    this.unitPrice,
    this.vendor,
    this.buyer,
    this.isDiscounted,
    this.status,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderRes.fromJson(Map<String, dynamic> json) => OrderRes(
        id: json["_id"],
        productId: json["product_id"] == null
            ? null
            : ProductId.fromJson(json["product_id"]),
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        vendor: json["vendor"],
        buyer: json["buyer"] == null ? null : Buyer.fromJson(json["buyer"]),
        isDiscounted: json["is_discounted"],
        status: json["status"],
        v: json["__v"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_id": productId?.toJson(),
        "quantity": quantity,
        "unit_price": unitPrice,
        "vendor": vendor,
        "buyer": buyer?.toJson(),
        "is_discounted": isDiscounted,
        "status": status,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Buyer {
  final String? id;
  final String? firstName;
  final String? lastName;

  Buyer({
    this.id,
    this.firstName,
    this.lastName,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        id: json["_id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "FirstName": firstName,
        "LastName": lastName,
      };
}

class ProductId {
  final String? id;
  final String? productName;
  final List<String>? images;
  final int? productQuantity;

  ProductId({
    this.id,
    this.productName,
    this.images,
    this.productQuantity,
  });

  factory ProductId.fromJson(Map<String, dynamic> json) => ProductId(
        id: json["_id"],
        productName: json["product_name"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        productQuantity: json["product_quantity"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "product_name": productName,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "product_quantity": productQuantity,
      };
}
