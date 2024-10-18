import 'package:flutter/cupertino.dart';
import 'package:soto_ecommerce/buyer/core/core.dart';

class InputDoneView extends StatelessWidget {
  const InputDoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 44.h,
      color: const Color(0xffD1D3D9),
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: CupertinoButton(
            padding: const EdgeInsets.only(right: 24.0, top: 8.0, bottom: 6.0),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Text(
              "Done",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryOrange.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
