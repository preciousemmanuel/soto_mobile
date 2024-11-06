import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const String images = "assets/images";

class AppImages {
  AppImages._();

  static const logo = "$images/logo.png";
  static const avatar = "$images/avatar.png";
  static const creditCard = "$images/creditCard.png";
  static const noImage = "$images/noImage.jpg";
  static const approval = "$images/approval.png";

  // onboarding
  static const ob1 = "$images/onboarding/ob1.png";
  static const ob2 = "$images/onboarding/ob2.png";
  static const ob3 = "$images/onboarding/ob3.png";
  static const ob4 = "$images/onboarding/ob4.png";
  static const obBg1 = "$images/onboarding/obBg1.png";
  static const obBg2 = "$images/onboarding/obBg2.png";

  static const mail = "$images/mail.png";
  static const lock = "$images/lock.png";
  static const success = "$images/success.png";

  static const cat = "$images/archive/cat.png";
  static const banner = "$images/archive/banner.png";
  static const bestSeller = "$images/archive/bestSeller.png";
  static const product = "$images/archive/product.png";
  static const product2 = "$images/archive/product2.png";
}

// Image Helper
SizedBox imageHelper(String image,
    {double? height, double? width, BoxFit? fit}) {
  return SizedBox(
    height: height,
    width: width,
    child: Image.asset(
      image,
      fit: fit,
    ),
  );
}

Widget cacheNetWorkImage(
  String url, {
  double? height,
  double? width,
  BoxFit? fit,
}) {
  return CachedNetworkImage(
    imageUrl: url,
    width: width,
    height: height,
    fit: fit,
    fadeInDuration: const Duration(milliseconds: 2000),
    placeholder: (context, url) {
      return const SizedBox();
    },
    errorWidget: (context, url, error) {
      return const SizedBox();
    },
  );
}
