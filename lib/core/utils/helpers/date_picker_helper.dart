// Show the modal that contains the CupertinoDatePicker
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:soto_ecommerce/core/core.dart';

void showCupertinoDatePicker(
  ctx, {
  VoidCallback? onDone,
  DateTime? minimumDate,
  DateTime? maximumDate,
  required Function(DateTime) onDateTimeChanged,
}) {
  // showCupertinoModalPopup is a built-in function of the cupertino library
  showCupertinoModalPopup(
    context: ctx,
    builder: (_) => Container(
      height: 250.h,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Material(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () => Navigator.of(
                            NavKey.appNavigatorKey.currentContext ?? ctx)
                        .pop(),
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0.w, left: 16.w),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: AppColors.text12.withOpacity(0.6),
                            fontSize: 15.sp),
                      ),
                    )),
                InkWell(
                    onTap: onDone,

                    // () {
                    //   // formattedDobController.text =
                    //   printty("jflks");
                    //   if (selectedDate != null) {
                    //     // Calculate age
                    //     DateTime currentDate = DateTime.now();
                    //     int age = currentDate.year - selectedDate!.year;
                    //     if (currentDate.month < selectedDate!.month ||
                    //         (currentDate.month == selectedDate!.month &&
                    //             currentDate.day < selectedDate!.day)) {
                    //       age--;
                    //     }
                    //     // Check if age is 18 or above
                    //     if (age >= 18) {
                    //       // Do something with the selected date
                    //       printty('Selected date: $selectedDate');
                    //       formattedController.text =
                    //           AppUtils.dayWithSuffixMonthAndYear(selectedDate!);
                    //       controller.text =
                    //           selectedDate!.toIso8601String().split("T").first;

                    //       updateView();
                    //     } else {
                    //       FlushBarToast.fLSnackBar(
                    //         message: 'Age must be 18 or above',
                    //         backgroundColor: AppColors.red,
                    //       ).show(NavigatorKeys.appNavigatorKey.currentContext ??
                    //           ctx);
                    //     }
                    //   }
                    //   // printty("val");
                    //   // Navigator.of(
                    //   //         NavigatorKeys.appNavigatorKey.currentContext ??
                    //   //             ctx)
                    //   //     .pop();
                    // },
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0.w, right: 16.w),
                      child: Text(
                        "Done",
                        style: TextStyle(
                            color: AppColors.text12.withOpacity(0.6),
                            fontSize: 15.sp),
                      ),
                    ))
              ],
            ),
            Divider(color: AppColors.black.withOpacity(0.2)),
            Container(
              height: 250.h,
              //margin: EdgeInsets.only(bottom: 120.h),
              padding: EdgeInsets.only(bottom: 80.h),
              child: CupertinoDatePicker(
                initialDateTime: DateTime.now(),
                mode: CupertinoDatePickerMode.date,
                minimumDate: minimumDate,
                maximumDate: maximumDate,
                // dateOrder: DatePickerDateOrder.dmy,
                onDateTimeChanged: onDateTimeChanged,
              ),
            ),
            //  VSpace(24.h)
          ],
        ),
      ),
    ),
  );
}
