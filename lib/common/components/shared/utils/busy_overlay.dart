import 'dart:ui';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:soto_ecommerce/common/common.dart';

class BusyOverlay extends StatefulWidget {
  final Widget child;
  final bool show;
  final Color? bgColor;

  const BusyOverlay(
      {super.key, required this.child, this.bgColor, this.show = false});

  @override
  State<BusyOverlay> createState() => _BusyOverlayState();
}

class _BusyOverlayState extends State<BusyOverlay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: Sizer.screenWidth,
        height: Sizer.screenWidth,
        child: Stack(
          children: <Widget>[
            widget.child,
            Visibility(
              visible: widget.show,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 12, sigmaY: 12), // Adjust the blur intensity
                child: Container(
                  color: Colors.black12.withOpacity(
                    0.5,
                  ), // Adjust the background color and opacity
                ),
              ),
            ),
            Center(
              child: IgnorePointer(
                ignoring: !widget.show,
                child: Visibility(
                  visible: widget.show,
                  child: const SpinKitThreeBounce(
                    color: AppColors.primaryOrange,
                    size: 60.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusyOverlayWhiteBg extends StatefulWidget {
  const BusyOverlayWhiteBg({
    super.key,
    required this.child,
    this.show = false,
  });

  final Widget child;
  final bool show;

  @override
  State<BusyOverlayWhiteBg> createState() => _BusyOverlayWhiteBgState();
}

class _BusyOverlayWhiteBgState extends State<BusyOverlayWhiteBg> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        width: Sizer.screenWidth,
        height: Sizer.screenWidth,
        child: Stack(
          children: <Widget>[
            widget.child,
            Visibility(
                visible: widget.show,
                child: Container(
                  color: AppColors.bgWhite,
                )),
            Visibility(
              visible: widget.show,
              child: Container(
                color: AppColors.bgWhite,
                child: Center(
                  child: IgnorePointer(
                    ignoring: !widget.show,
                    child: Container(
                      width: Sizer.width(80),
                      height: Sizer.width(80),
                      padding: EdgeInsets.all(Sizer.radius(10)),
                      decoration: BoxDecoration(
                        color: AppColors.black40.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
