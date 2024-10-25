// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String svgIcon = "assets/svgs";

class AppSvgs {
  static const String mscard = "$svgIcon/payments/mscard.svg";
  static const String paypal = "$svgIcon/payments/paypal.svg";
  static const String paystack = "$svgIcon/payments/paystack.svg";

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

  static const String star = "$svgIcon/star.svg";
  static const String filter = "$svgIcon/filter.svg";
  static const String chatHelp = "$svgIcon/chatHelp.svg";

  static const String call = "$svgIcon/call.svg";
  static const String x = "$svgIcon/x.svg";
  static const String ws = "$svgIcon/ws.svg";
  static const String ig = "$svgIcon/ig.svg";

  static const String arrowUp = "$svgIcon/arrowUp.svg";
  static const String arrowDown = "$svgIcon/arrowDown.svg";
  static const String check = "$svgIcon/check.svg";
  static const String received = "$svgIcon/received.svg";
  static const String starActive = "$svgIcon/starActive.svg";
  static const String starInactive = "$svgIcon/starInactive.svg";
  static const String receive = "$svgIcon/receive.svg";
  static const String send = "$svgIcon/send.svg";
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
