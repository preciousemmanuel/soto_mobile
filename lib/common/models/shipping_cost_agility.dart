// To parse this JSON data, do
//
//     final shippingCostAgility = shippingCostAgilityFromJson(jsonString);

import 'dart:convert';

ShippingCostAgility shippingCostAgilityFromJson(String str) =>
    ShippingCostAgility.fromJson(json.decode(str));

String shippingCostAgilityToJson(ShippingCostAgility data) =>
    json.encode(data.toJson());

class ShippingCostAgility {
  final int? shippingCost;
  final List<ShippingItem>? shippingItems;
  final AgilityPayload? agilityPayload;

  ShippingCostAgility({
    this.shippingCost,
    this.shippingItems,
    this.agilityPayload,
  });

  factory ShippingCostAgility.fromJson(Map<String, dynamic> json) =>
      ShippingCostAgility(
        shippingCost: json["shipping_cost"],
        shippingItems: json["shipping_items"] == null
            ? []
            : List<ShippingItem>.from(
                json["shipping_items"]!.map((x) => ShippingItem.fromJson(x))),
        agilityPayload: json["agility_payload"] == null
            ? null
            : AgilityPayload.fromJson(json["agility_payload"]),
      );

  Map<String, dynamic> toJson() => {
        "shipping_cost": shippingCost,
        "shipping_items": shippingItems == null
            ? []
            : List<dynamic>.from(shippingItems!.map((x) => x.toJson())),
        "agility_payload": agilityPayload?.toJson(),
      };
}

class AgilityPayload {
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

  AgilityPayload({
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

  factory AgilityPayload.fromJson(Map<String, dynamic> json) => AgilityPayload(
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

class PreShipmentItem {
  final int? preShipmentItemMobileId;
  final String? description;
  final int? weight;
  final int? weight2;
  final String? itemType;
  final int? shipmentType;
  final String? itemName;
  final int? estimatedPrice;
  final String? value;
  final String? imageUrl;
  final int? quantity;
  final int? serialNumber;
  final bool? isVolumetric;
  final dynamic length;
  final dynamic width;
  final dynamic height;
  final int? preShipmentMobileId;
  final dynamic calculatedPrice;
  final dynamic specialPackageId;
  final bool? isCancelled;
  final String? pictureName;
  final dynamic pictureDate;
  final String? weightRange;

  PreShipmentItem({
    this.preShipmentItemMobileId,
    this.description,
    this.weight,
    this.weight2,
    this.itemType,
    this.shipmentType,
    this.itemName,
    this.estimatedPrice,
    this.value,
    this.imageUrl,
    this.quantity,
    this.serialNumber,
    this.isVolumetric,
    this.length,
    this.width,
    this.height,
    this.preShipmentMobileId,
    this.calculatedPrice,
    this.specialPackageId,
    this.isCancelled,
    this.pictureName,
    this.pictureDate,
    this.weightRange,
  });

  factory PreShipmentItem.fromJson(Map<String, dynamic> json) =>
      PreShipmentItem(
        preShipmentItemMobileId: json["PreShipmentItemMobileId"],
        description: json["Description"],
        weight: json["Weight"],
        weight2: json["Weight2"],
        itemType: json["ItemType"],
        shipmentType: json["ShipmentType"],
        itemName: json["ItemName"],
        estimatedPrice: json["EstimatedPrice"],
        value: json["Value"],
        imageUrl: json["ImageUrl"],
        quantity: json["Quantity"],
        serialNumber: json["SerialNumber"],
        isVolumetric: json["IsVolumetric"],
        length: json["Length"],
        width: json["Width"],
        height: json["Height"],
        preShipmentMobileId: json["PreShipmentMobileId"],
        calculatedPrice: json["CalculatedPrice"],
        specialPackageId: json["SpecialPackageId"],
        isCancelled: json["IsCancelled"],
        pictureName: json["PictureName"],
        pictureDate: json["PictureDate"],
        weightRange: json["WeightRange"],
      );

  Map<String, dynamic> toJson() => {
        "PreShipmentItemMobileId": preShipmentItemMobileId,
        "Description": description,
        "Weight": weight,
        "Weight2": weight2,
        "ItemType": itemType,
        "ShipmentType": shipmentType,
        "ItemName": itemName,
        "EstimatedPrice": estimatedPrice,
        "Value": value,
        "ImageUrl": imageUrl,
        "Quantity": quantity,
        "SerialNumber": serialNumber,
        "IsVolumetric": isVolumetric,
        "Length": length,
        "Width": width,
        "Height": height,
        "PreShipmentMobileId": preShipmentMobileId,
        "CalculatedPrice": calculatedPrice,
        "SpecialPackageId": specialPackageId,
        "IsCancelled": isCancelled,
        "PictureName": pictureName,
        "PictureDate": pictureDate,
        "WeightRange": weightRange,
      };
}

class ErLocation {
  final String? latitude;
  final String? longitude;
  final String? formattedAddress;
  final String? name;
  final String? lga;

  ErLocation({
    this.latitude,
    this.longitude,
    this.formattedAddress,
    this.name,
    this.lga,
  });

  factory ErLocation.fromJson(Map<String, dynamic> json) => ErLocation(
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        formattedAddress: json["FormattedAddress"],
        name: json["Name"],
        lga: json["LGA"],
      );

  Map<String, dynamic> toJson() => {
        "Latitude": latitude,
        "Longitude": longitude,
        "FormattedAddress": formattedAddress,
        "Name": name,
        "LGA": lga,
      };
}

class ShippingItem {
  final int? preShipmentItemMobileId;
  final String? description;
  final int? weight;
  final int? weight2;
  final String? itemType;
  final int? shipmentType;
  final String? itemName;
  final int? estimatedPrice;
  final String? value;
  final String? imageUrl;
  final int? quantity;
  final int? serialNumber;
  final bool? isVolumetric;
  final int? preShipmentMobileId;
  final int? calculatedPrice;
  final bool? isCancelled;
  final String? pictureName;
  final String? weightRange;
  final DateTime? dateModified;
  final DateTime? dateCreated;
  final bool? isDeleted;
  final String? rowVersion;

  ShippingItem({
    this.preShipmentItemMobileId,
    this.description,
    this.weight,
    this.weight2,
    this.itemType,
    this.shipmentType,
    this.itemName,
    this.estimatedPrice,
    this.value,
    this.imageUrl,
    this.quantity,
    this.serialNumber,
    this.isVolumetric,
    this.preShipmentMobileId,
    this.calculatedPrice,
    this.isCancelled,
    this.pictureName,
    this.weightRange,
    this.dateModified,
    this.dateCreated,
    this.isDeleted,
    this.rowVersion,
  });

  factory ShippingItem.fromJson(Map<String, dynamic> json) => ShippingItem(
        preShipmentItemMobileId: json["preShipmentItemMobileId"],
        description: json["description"],
        weight: json["weight"],
        weight2: json["weight2"],
        itemType: json["itemType"],
        shipmentType: json["shipmentType"],
        itemName: json["itemName"],
        estimatedPrice: json["estimatedPrice"],
        value: json["value"],
        imageUrl: json["imageUrl"],
        quantity: json["quantity"],
        serialNumber: json["serialNumber"],
        isVolumetric: json["isVolumetric"],
        preShipmentMobileId: json["preShipmentMobileId"],
        calculatedPrice: json["calculatedPrice"],
        isCancelled: json["isCancelled"],
        pictureName: json["pictureName"],
        weightRange: json["weightRange"],
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.parse(json["dateModified"]),
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        isDeleted: json["isDeleted"],
        rowVersion: json["rowVersion"],
      );

  Map<String, dynamic> toJson() => {
        "preShipmentItemMobileId": preShipmentItemMobileId,
        "description": description,
        "weight": weight,
        "weight2": weight2,
        "itemType": itemType,
        "shipmentType": shipmentType,
        "itemName": itemName,
        "estimatedPrice": estimatedPrice,
        "value": value,
        "imageUrl": imageUrl,
        "quantity": quantity,
        "serialNumber": serialNumber,
        "isVolumetric": isVolumetric,
        "preShipmentMobileId": preShipmentMobileId,
        "calculatedPrice": calculatedPrice,
        "isCancelled": isCancelled,
        "pictureName": pictureName,
        "weightRange": weightRange,
        "dateModified": dateModified?.toIso8601String(),
        "dateCreated": dateCreated?.toIso8601String(),
        "isDeleted": isDeleted,
        "rowVersion": rowVersion,
      };
}
