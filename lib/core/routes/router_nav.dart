import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RouterNav {
  static dynamic push(BuildContext context, Widget widget) {
    return Navigator.push(
        context, CupertinoPageRoute(builder: (context) => widget));
  }

  // static void pushWithUpTransition(BuildContext context, Widget widget){
  //   Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: widget, isIos: true,));
  // }

  // static void pushWithFade(BuildContext context, Widget widget){
  //   Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: widget, isIos: true,));
  // }

  static void pushNamed(BuildContext context, String routeName,
      {dynamic arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void replace(BuildContext context, Widget widget) {
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => widget));
  }

  static void replaceAll(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (context) => widget),
        (Route<dynamic> r) => false);
  }

  static void replaceAllWithName(BuildContext context, String routeName) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(routeName, (Route<dynamic> r) => false);
  }

  static void replaceAllWithWidget(BuildContext context, Widget widget) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute<void>(builder: (BuildContext context) => widget),
        (Route<dynamic> r) => false);
  }

  static void pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }
}
