import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:soto_ecommerce/common/models/cart.dart';

AuthUser authUserFromJson(String str) => AuthUser.fromJson(json.decode(str));

String authUserToJson(AuthUser data) => json.encode(data.toJson());

class AuthUser extends Equatable {
  final ShippingAddress? shippingAddress;
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? userType;
  final String? signupChannel;
  final bool? isVerified;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? token;
  final Wallet? wallet;
  final Cart? cart;
  final Business? business;

  const AuthUser({
    this.shippingAddress,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.phoneNumber,
    this.userType,
    this.signupChannel,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.token,
    this.wallet,
    this.cart,
    this.business,
  });

  factory AuthUser.fromJson(Map<String, dynamic> json) => AuthUser(
        shippingAddress: json["ShippingAddress"] == null
            ? null
            : ShippingAddress.fromJson(json["ShippingAddress"]),
        id: json["_id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        email: json["Email"],
        password: json["Password"],
        phoneNumber: json["PhoneNumber"],
        userType: json["UserType"],
        signupChannel: json["SignupChannel"],
        isVerified: json["IsVerified"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        token: json["Token"],
        wallet: json["wallet"] == null ? null : Wallet.fromJson(json["wallet"]),
        cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
        business: json["business"] == null
            ? null
            : Business.fromJson(json["business"]),
      );

  Map<String, dynamic> toJson() => {
        "ShippingAddress": shippingAddress?.toJson(),
        "_id": id,
        "FirstName": firstName,
        "LastName": lastName,
        "Email": email,
        "Password": password,
        "PhoneNumber": phoneNumber,
        "UserType": userType,
        "SignupChannel": signupChannel,
        "IsVerified": isVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "Token": token,
        "wallet": wallet?.toJson(),
        "cart": cart?.toJson(),
        "business": business?.toJson(),
      };

  @override
  String toString() {
    return 'AuthUser(shippingAddress: $shippingAddress, id: $id, firstName: $firstName, lastName: $lastName, email: $email, password: $password, phoneNumber: $phoneNumber, userType: $userType, signupChannel: $signupChannel, isVerified: $isVerified, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, token: $token, wallet: $wallet, cart: $cart, business: $business)';
  }

  @override
  List<Object?> get props => [
        shippingAddress,
        id,
        firstName,
        lastName,
        email,
        password,
        phoneNumber,
        userType,
        signupChannel,
        isVerified,
        createdAt,
        updatedAt,
        v,
        token,
        wallet,
        cart,
        business
      ];
}

class Business {
  final String? id;
  final String? businessName;
  final String? lastName;
  final String? user;
  final String? email;
  final String? phoneNumber;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Business({
    this.id,
    this.businessName,
    this.lastName,
    this.user,
    this.email,
    this.phoneNumber,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        id: json["_id"],
        businessName: json["business_name"],
        lastName: json["last_name"],
        user: json["user"],
        email: json["email"],
        phoneNumber: json["phone_number"],
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
        "business_name": businessName,
        "last_name": lastName,
        "user": user,
        "email": email,
        "phone_number": phoneNumber,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  @override
  String toString() {
    return 'Business(id: $id, businessName: $businessName, lastName: $lastName, user: $user, email: $email, phoneNumber: $phoneNumber, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }
}

class ShippingAddress {
  final String? country;
  final String? fullAddress;

  ShippingAddress({this.country, this.fullAddress});

  factory ShippingAddress.fromJson(Map<String, dynamic> json) =>
      ShippingAddress(
        country: json["country"],
        fullAddress: json["full_address"],
      );

  Map<String, dynamic> toJson() =>
      {"country": country, "full_address": fullAddress};
}

class Wallet {
  final String? id;
  final String? user;
  final int? currentBalance;
  final int? previousBalance;
  final bool? isOpen;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Wallet({
    this.id,
    this.user,
    this.currentBalance,
    this.previousBalance,
    this.isOpen,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        id: json["_id"],
        user: json["user"],
        currentBalance: json["current_balance"],
        previousBalance: json["previous_balance"],
        isOpen: json["is_open"],
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
        "current_balance": currentBalance,
        "previous_balance": previousBalance,
        "is_open": isOpen,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };

  @override
  String toString() {
    return 'Wallet(id: $id, user: $user, currentBalance: $currentBalance, previousBalance: $previousBalance, isOpen: $isOpen, createdAt: $createdAt, updatedAt: $updatedAt, v: $v)';
  }
}
