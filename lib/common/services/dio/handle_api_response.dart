import 'package:soto_ecommerce/common/common.dart';

void handleApiResponse({
  required ApiResponse response,
  void Function()? onSuccess,
}) {
  if (response.success) {
    if (onSuccess != null) onSuccess();
    FlushBarToast.fLSnackBar(
        snackBarType: SnackBarType.success,
        message: response.message ?? 'Operation successful');
  } else {
    FlushBarToast.fLSnackBar(
        snackBarType: SnackBarType.warning,
        message: response.message ?? 'Something went wrong');
  }
}
