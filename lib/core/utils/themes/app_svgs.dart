// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String svgIcon = "assets/svgs";

class AppSvgs {
  static const String arrowRight = "$svgIcon/arrowRight.svg";
  static const String arrowLeft = "$svgIcon/arrowLeft.svg";

  static const String fb = "$svgIcon/fb.svg";
  static const String google = "$svgIcon/google.svg";

  static const String order = "$svgIcon/order.svg";
  static const String orderSolid = "$svgIcon/orderSolid.svg";
  static const String profile = "$svgIcon/profile.svg";
  static const String profileSolid = "$svgIcon/profileSolid.svg";
  static const String cart = "$svgIcon/cart.svg";
  static const String cartSolid = "$svgIcon/cartSolid.svg";
}

SizedBox svgHelper(
  String svg, {
  double? height,
  double? width,
  Color? color,
  ColorFilter? colorFilter,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: SvgPicture.asset(
      svg,
      fit: BoxFit.cover,
      color: color,
      colorFilter: colorFilter,
    ),
  );
}
