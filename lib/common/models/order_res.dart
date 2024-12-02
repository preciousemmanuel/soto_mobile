import 'dart:convert';

List<OrderRes> orderResFromJson(String str) =>
    List<OrderRes>.from(json.decode(str).map((x) => OrderRes.fromJson(x)));

String orderResToJson(List<OrderRes> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderRes {
  final String? id;
  final List<OrderItems>? items;
  final String? user;
  final String? status;
  final int? totalAmount;
  final int? deliveryAmount;
  final String? shippingAddress;
  final String? orderItinerary;
  final String? trackingId;
  final int? grandTotal;
  final String? paymentType;
  final bool? isCouponApplied;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  OrderRes({
    this.id,
    this.items,
    this.user,
    this.status,
    this.totalAmount,
    this.deliveryAmount,
    this.shippingAddress,
    this.orderItinerary,
    this.trackingId,
    this.grandTotal,
    this.paymentType,
    this.isCouponApplied,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderRes.fromJson(Map<String, dynamic> json) => OrderRes(
        id: json["_id"],
        items: json["items"] == null
            ? []
            : List<OrderItems>.from(
                json["items"]!.map((x) => OrderItems.fromJson(x))),
        user: json["user"],
        status: json["status"],
        totalAmount: json["total_amount"],
        deliveryAmount: json["delivery_amount"],
        shippingAddress: json["shipping_address"],
        orderItinerary: json["order_itinerary"],
        trackingId: json["tracking_id"],
        grandTotal: json["grand_total"],
        paymentType: json["payment_type"],
        isCouponApplied: json["is_coupon_applied"],
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
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "user": user,
        "status": status,
        "total_amount": totalAmount,
        "delivery_amount": deliveryAmount,
        "shipping_address": shippingAddress,
        "order_itinerary": orderItinerary,
        "tracking_id": trackingId,
        "grand_total": grandTotal,
        "payment_type": paymentType,
        "is_coupon_applied": isCouponApplied,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class OrderItems {
  final String? productId;
  final String? productName;
  final String? description;
  final String? vendor;
  final List<String>? images;
  final int? quantity;
  final int? unitPrice;
  final int? height;
  final int? width;
  final double? weight;
  final bool? isDiscounted;
  final String? id;

  OrderItems({
    this.productId,
    this.productName,
    this.description,
    this.vendor,
    this.images,
    this.quantity,
    this.unitPrice,
    this.height,
    this.width,
    this.weight,
    this.isDiscounted,
    this.id,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) => OrderItems(
        productId: json["product_id"],
        productName: json["product_name"],
        description: json["description"],
        vendor: json["vendor"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        height: json["height"],
        width: json["width"],
        weight: json["weight"],
        isDiscounted: json["is_discounted"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "description": description,
        "vendor": vendor,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "quantity": quantity,
        "unit_price": unitPrice,
        "height": height,
        "width": width,
        "weight": weight,
        "is_discounted": isDiscounted,
        "_id": id,
      };
}
