import 'dart:convert';

List<VendorOrder> vendorOrderFromJson(String str) => List<VendorOrder>.from(
    json.decode(str).map((x) => VendorOrder.fromJson(x)));

String vendorOrderToJson(List<VendorOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VendorOrder {
  final String? id;
  final List<VendorItem>? items;
  final String? user;
  final String? trackingId;
  final String? status;
  final int? totalAmount;
  final double? deliveryAmount;
  final int? grandTotal;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? order;

  VendorOrder({
    this.id,
    this.items,
    this.user,
    this.trackingId,
    this.status,
    this.totalAmount,
    this.deliveryAmount,
    this.grandTotal,
    this.createdAt,
    this.updatedAt,
    this.order,
  });

  factory VendorOrder.fromJson(Map<String, dynamic> json) => VendorOrder(
        id: json["_id"],
        items: json["items"] == null
            ? []
            : List<VendorItem>.from(
                json["items"]!.map((x) => VendorItem.fromJson(x))),
        user: json["user"],
        trackingId: json["tracking_id"],
        status: json["status"],
        totalAmount: json["total_amount"],
        deliveryAmount: json["delivery_amount"]?.toDouble(),
        grandTotal: json["grand_total"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        order: json["order"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "user": user,
        "tracking_id": trackingId,
        "status": status,
        "total_amount": totalAmount,
        "delivery_amount": deliveryAmount,
        "grand_total": grandTotal,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "order": order,
      };

  @override
  String toString() {
    return 'VendorOrder(id: $id, items: $items, user: $user, trackingId: $trackingId, status: $status, totalAmount: $totalAmount, deliveryAmount: $deliveryAmount, grandTotal: $grandTotal, createdAt: $createdAt, updatedAt: $updatedAt, order: $order)';
  }
}

class VendorItem {
  final String? productId;
  final String? productName;
  final String? productCode;
  final String? description;
  final String? vendor;
  final List<dynamic>? images;
  final int? quantity;
  final int? unitPrice;
  final int? height;
  final int? width;
  final double? weight;
  final bool? isDiscounted;
  final String? id;

  VendorItem({
    this.productId,
    this.productName,
    this.productCode,
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

  factory VendorItem.fromJson(Map<String, dynamic> json) => VendorItem(
        productId: json["product_id"],
        productName: json["product_name"],
        productCode: json["product_code"],
        description: json["description"],
        vendor: json["vendor"],
        images: json["images"] == null
            ? []
            : List<dynamic>.from(json["images"]!.map((x) => x)),
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        height: json["height"],
        width: json["width"],
        weight: json["weight"]?.toDouble(),
        isDiscounted: json["is_discounted"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "product_code": productCode,
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
