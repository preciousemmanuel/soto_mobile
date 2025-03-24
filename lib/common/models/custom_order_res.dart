import 'dart:convert';

List<CustomOrderRes> customOrderModelFromJson(String str) =>
    List<CustomOrderRes>.from(
        json.decode(str).map((x) => CustomOrderRes.fromJson(x)));

String customOrderModelToJson(List<CustomOrderRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomOrderRes {
  final String? productName;
  final String? productBrand;
  final String? size;
  final String? color;
  final String? type;
  final int? quantity;
  final int? maxPrice;
  final int? minPrice;
  final String? phoneNumber;
  final String? email;
  final String? note;
  final String? user;
  final String? trackingId;
  final String? status;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  CustomOrderRes({
    this.productName,
    this.productBrand,
    this.size,
    this.color,
    this.type,
    this.quantity,
    this.maxPrice,
    this.minPrice,
    this.phoneNumber,
    this.email,
    this.note,
    this.user,
    this.trackingId,
    this.status,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CustomOrderRes.fromJson(Map<String, dynamic> json) => CustomOrderRes(
        productName: json["product_name"],
        productBrand: json["product_brand"],
        size: json["size"],
        color: json["color"],
        type: json["type"],
        quantity: json["quantity"],
        maxPrice: json["max_price"],
        minPrice: json["min_price"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        note: json["note"],
        user: json["user"],
        trackingId: json["tracking_id"],
        status: json["status"],
        id: json["_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_brand": productBrand,
        "size": size,
        "color": color,
        "type": type,
        "quantity": quantity,
        "max_price": maxPrice,
        "min_price": minPrice,
        "phone_number": phoneNumber,
        "email": email,
        "note": note,
        "user": user,
        "tracking_id": trackingId,
        "status": status,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  @override
  String toString() {
    return 'CustomOrderRes(productName: $productName, productBrand: $productBrand, size: $size, color: $color, type: $type, quantity: $quantity, maxPrice: $maxPrice, minPrice: $minPrice, phoneNumber: $phoneNumber, email: $email, note: $note, user: $user, trackingId: $trackingId, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }
}
