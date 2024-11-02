class Cart {
  final String? id;
  final String? user;
  final int? totalAmount;
  final int? deliveryAmount;
  final String? orderItinerary;
  final int? grandTotal;
  final String? paymentType;
  final List<Item>? items;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Cart({
    this.id,
    this.user,
    this.totalAmount,
    this.deliveryAmount,
    this.orderItinerary,
    this.grandTotal,
    this.paymentType,
    this.items,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["_id"],
        user: json["user"],
        totalAmount: json["total_amount"],
        deliveryAmount: json["delivery_amount"],
        orderItinerary: json["order_itinerary"],
        grandTotal: json["grand_total"],
        paymentType: json["payment_type"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
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
        "user": user,
        "total_amount": totalAmount,
        "delivery_amount": deliveryAmount,
        "order_itinerary": orderItinerary,
        "grand_total": grandTotal,
        "payment_type": paymentType,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Item {
  final String? productId;
  final String? productName;
  final String? description;
  final String? vendor;
  final List<String>? images;
  final int? quantity;
  final int? unitPrice;
  final bool? isDiscounted;
  final String? id;

  Item({
    this.productId,
    this.productName,
    this.description,
    this.vendor,
    this.images,
    this.quantity,
    this.unitPrice,
    this.isDiscounted,
    this.id,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        productName: json["product_name"],
        description: json["description"],
        vendor: json["vendor"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
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
        "is_discounted": isDiscounted,
        "_id": id,
      };
}
