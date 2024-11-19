import 'dart:convert';

OrderResponse orderResponseFromJson(String str) =>
    OrderResponse.fromJson(json.decode(str));

String orderResponseToJson(OrderResponse data) => json.encode(data.toJson());

class OrderResponse {
  final String? id;
  final List<OrderItem>? items;
  final String? user;
  final String? status;
  final int? totalAmount;
  final int? deliveryAmount;
  final String? shippingAddress;
  final String? orderItinerary;
  final int? grandTotal;
  final String? paymentType;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  OrderResponse({
    this.id,
    this.items,
    this.user,
    this.status,
    this.totalAmount,
    this.deliveryAmount,
    this.shippingAddress,
    this.orderItinerary,
    this.grandTotal,
    this.paymentType,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json) => OrderResponse(
        id: json["_id"],
        items: json["items"] == null
            ? []
            : List<OrderItem>.from(
                json["items"]!.map((x) => OrderItem.fromJson(x))),
        user: json["user"],
        status: json["status"],
        totalAmount: json["total_amount"],
        deliveryAmount: json["delivery_amount"],
        shippingAddress: json["shipping_address"],
        orderItinerary: json["order_itinerary"],
        grandTotal: json["grand_total"],
        paymentType: json["payment_type"],
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
        "grand_total": grandTotal,
        "payment_type": paymentType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class OrderItem {
  final String? productId;
  final String? productName;
  final String? description;
  final String? vendor;
  final List<String>? images;
  final int? quantity;
  final int? unitPrice;
  final bool? isDiscounted;
  final String? id;

  OrderItem({
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

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
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

OrderPaymentRes orderPaymentResFromJson(String str) =>
    OrderPaymentRes.fromJson(json.decode(str));

String orderPaymentResToJson(OrderPaymentRes data) =>
    json.encode(data.toJson());

class OrderPaymentRes {
  final bool? status;
  final String? message;
  final Data? data;

  OrderPaymentRes({
    this.status,
    this.message,
    this.data,
  });

  factory OrderPaymentRes.fromJson(Map<String, dynamic> json) =>
      OrderPaymentRes(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final String? authorizationUrl;
  final String? accessCode;
  final String? reference;

  Data({
    this.authorizationUrl,
    this.accessCode,
    this.reference,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        authorizationUrl: json["authorization_url"],
        accessCode: json["access_code"],
        reference: json["reference"],
      );

  Map<String, dynamic> toJson() => {
        "authorization_url": authorizationUrl,
        "access_code": accessCode,
        "reference": reference,
      };
}
