import 'dart:convert';

import 'package:soto_ecommerce/common/models/shipping_cost_agility.dart';

OrderDetailsRes orderDetailsResFromJson(String str) =>
    OrderDetailsRes.fromJson(json.decode(str));

String orderDetailsResToJson(OrderDetailsRes data) =>
    json.encode(data.toJson());

class OrderDetailsRes {
  final String? id;
  final List<OrderDetailsItem>? items;
  final User? user;
  final String? status;
  final int? totalAmount;
  final int? deliveryAmount;
  final String? shippingAddress;
  final OrderItinerary? orderItinerary;
  final String? trackingId;
  final int? grandTotal;
  final int? discountedAmount;
  final int? priceBeforeDiscount;
  final String? paymentType;
  final bool? isCouponApplied;
  final bool? shipmentCharges;
  final AgilityPricePayload? agilityPricePayload;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  OrderDetailsRes({
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
    this.discountedAmount,
    this.priceBeforeDiscount,
    this.paymentType,
    this.isCouponApplied,
    this.shipmentCharges,
    this.agilityPricePayload,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory OrderDetailsRes.fromJson(Map<String, dynamic> json) =>
      OrderDetailsRes(
        id: json["_id"],
        items: json["items"] == null
            ? []
            : List<OrderDetailsItem>.from(
                json["items"]!.map((x) => OrderDetailsItem.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        status: json["status"],
        totalAmount: json["total_amount"],
        deliveryAmount: json["delivery_amount"],
        shippingAddress: json["shipping_address"],
        orderItinerary: json["order_itinerary"] == null
            ? null
            : OrderItinerary.fromJson(json["order_itinerary"]),
        trackingId: json["tracking_id"],
        grandTotal: json["grand_total"],
        discountedAmount: json["discounted_amount"],
        priceBeforeDiscount: json["price_before_discount"],
        paymentType: json["payment_type"],
        isCouponApplied: json["is_coupon_applied"],
        shipmentCharges: json["shipment_charges"],
        agilityPricePayload: json["agility_price_payload"] == null
            ? null
            : AgilityPricePayload.fromJson(json["agility_price_payload"]),
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
        "user": user?.toJson(),
        "status": status,
        "total_amount": totalAmount,
        "delivery_amount": deliveryAmount,
        "shipping_address": shippingAddress,
        "order_itinerary": orderItinerary?.toJson(),
        "tracking_id": trackingId,
        "grand_total": grandTotal,
        "discounted_amount": discountedAmount,
        "price_before_discount": priceBeforeDiscount,
        "payment_type": paymentType,
        "is_coupon_applied": isCouponApplied,
        "shipment_charges": shipmentCharges,
        "agility_price_payload": agilityPricePayload?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class AgilityPricePayload {
  final int? preShipmentMobileId;
  final String? senderName;
  final String? senderPhoneNumber;
  final int? senderStationId;
  final String? inputtedSenderAddress;
  final String? senderLocality;
  final int? receiverStationId;
  final String? senderAddress;
  final String? receiverName;
  final String? receiverPhoneNumber;
  final String? receiverAddress;
  final String? inputtedReceiverAddress;
  final ErLocation? senderLocation;
  final ErLocation? receiverLocation;
  final List<PreShipmentItem>? preShipmentItems;
  final String? vehicleType;
  final bool? isBatchPickUp;
  final String? waybillImage;
  final String? waybillImageFormat;
  final int? destinationServiceCenterId;
  final int? destinationServiceCentreId;
  final bool? isCashOnDelivery;
  final int? cashOnDeliveryAmount;

  AgilityPricePayload({
    this.preShipmentMobileId,
    this.senderName,
    this.senderPhoneNumber,
    this.senderStationId,
    this.inputtedSenderAddress,
    this.senderLocality,
    this.receiverStationId,
    this.senderAddress,
    this.receiverName,
    this.receiverPhoneNumber,
    this.receiverAddress,
    this.inputtedReceiverAddress,
    this.senderLocation,
    this.receiverLocation,
    this.preShipmentItems,
    this.vehicleType,
    this.isBatchPickUp,
    this.waybillImage,
    this.waybillImageFormat,
    this.destinationServiceCenterId,
    this.destinationServiceCentreId,
    this.isCashOnDelivery,
    this.cashOnDeliveryAmount,
  });

  factory AgilityPricePayload.fromJson(Map<String, dynamic> json) =>
      AgilityPricePayload(
        preShipmentMobileId: json["PreShipmentMobileId"],
        senderName: json["SenderName"],
        senderPhoneNumber: json["SenderPhoneNumber"],
        senderStationId: json["SenderStationId"],
        inputtedSenderAddress: json["InputtedSenderAddress"],
        senderLocality: json["SenderLocality"],
        receiverStationId: json["ReceiverStationId"],
        senderAddress: json["SenderAddress"],
        receiverName: json["ReceiverName"],
        receiverPhoneNumber: json["ReceiverPhoneNumber"],
        receiverAddress: json["ReceiverAddress"],
        inputtedReceiverAddress: json["InputtedReceiverAddress"],
        senderLocation: json["SenderLocation"] == null
            ? null
            : ErLocation.fromJson(json["SenderLocation"]),
        receiverLocation: json["ReceiverLocation"] == null
            ? null
            : ErLocation.fromJson(json["ReceiverLocation"]),
        preShipmentItems: json["PreShipmentItems"] == null
            ? []
            : List<PreShipmentItem>.from(json["PreShipmentItems"]!
                .map((x) => PreShipmentItem.fromJson(x))),
        vehicleType: json["VehicleType"],
        isBatchPickUp: json["IsBatchPickUp"],
        waybillImage: json["WaybillImage"],
        waybillImageFormat: json["WaybillImageFormat"],
        destinationServiceCenterId: json["DestinationServiceCenterId"],
        destinationServiceCentreId: json["DestinationServiceCentreId"],
        isCashOnDelivery: json["IsCashOnDelivery"],
        cashOnDeliveryAmount: json["CashOnDeliveryAmount"],
      );

  Map<String, dynamic> toJson() => {
        "PreShipmentMobileId": preShipmentMobileId,
        "SenderName": senderName,
        "SenderPhoneNumber": senderPhoneNumber,
        "SenderStationId": senderStationId,
        "InputtedSenderAddress": inputtedSenderAddress,
        "SenderLocality": senderLocality,
        "ReceiverStationId": receiverStationId,
        "SenderAddress": senderAddress,
        "ReceiverName": receiverName,
        "ReceiverPhoneNumber": receiverPhoneNumber,
        "ReceiverAddress": receiverAddress,
        "InputtedReceiverAddress": inputtedReceiverAddress,
        "SenderLocation": senderLocation?.toJson(),
        "ReceiverLocation": receiverLocation?.toJson(),
        "PreShipmentItems": preShipmentItems == null
            ? []
            : List<dynamic>.from(preShipmentItems!.map((x) => x.toJson())),
        "VehicleType": vehicleType,
        "IsBatchPickUp": isBatchPickUp,
        "WaybillImage": waybillImage,
        "WaybillImageFormat": waybillImageFormat,
        "DestinationServiceCenterId": destinationServiceCenterId,
        "DestinationServiceCentreId": destinationServiceCentreId,
        "IsCashOnDelivery": isCashOnDelivery,
        "CashOnDeliveryAmount": cashOnDeliveryAmount,
      };
}

class OrderDetailsItem {
  final String? productId;
  final String? productName;
  final String? productCode;
  final String? description;
  final Vendor? vendor;
  final List<String>? images;
  final int? quantity;
  final int? unitPrice;
  final int? height;
  final int? width;
  final double? weight;
  final bool? isDiscounted;
  final String? id;

  OrderDetailsItem({
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

  factory OrderDetailsItem.fromJson(Map<String, dynamic> json) =>
      OrderDetailsItem(
        productId: json["product_id"],
        productName: json["product_name"],
        productCode: json["product_code"],
        description: json["description"],
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
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
        "vendor": vendor?.toJson(),
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

class Vendor {
  final String? id;
  final String? email;

  Vendor({
    this.id,
    this.email,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["_id"],
        email: json["Email"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "Email": email,
      };
}

class OrderItinerary {
  final String? step1;
  final String? step2;
  final String? step3;
  final String? step4;

  OrderItinerary({
    this.step1,
    this.step2,
    this.step3,
    this.step4,
  });

  factory OrderItinerary.fromJson(Map<String, dynamic> json) => OrderItinerary(
        step1: json["step_1"],
        step2: json["step_2"],
        step3: json["step_3"],
        step4: json["step_4"],
      );

  Map<String, dynamic> toJson() => {
        "step_1": step1,
        "step_2": step2,
        "step_3": step3,
        "step_4": step4,
      };
}

class User {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        phoneNumber: json["PhoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "PhoneNumber": phoneNumber,
      };
}
