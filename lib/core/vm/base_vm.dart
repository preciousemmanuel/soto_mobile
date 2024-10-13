import 'package:soto_ecommerce/core/core.dart';

class BaseVM extends ChangeNotifier {
  late ApiResponse apiResponse;

  final Map<int, bool> _busyStates = <int, bool>{};

  /// Returns the busy status for an object if it exists. Returns false if not present
  bool busy(Object? object) => _busyStates[object.hashCode] ?? false;

  /// Returns the busy status of the ViewModel
  bool get isBusy => busy(this);

  /// Sets the busy state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setBusyForObject(Object? object, bool value) {
    _busyStates[object.hashCode] = value;
    notifyListeners();
  }

  /// Marks the ViewModel as busy and calls notify listeners
  void setBusy(bool value) {
    setBusyForObject(this, value);
  }

  final Map<int, dynamic> _errorStates = <int, bool>{};

  /// Returns the error status for an object if it exists. Returns false if not present
  bool error(Object? object) => _errorStates[object.hashCode] ?? false;

  /// Returns the error existence status of the ViewModel
  bool get hasError => error(this);

  /// Sets the error state for the object equal to the value passed in and notifies Listeners
  /// If you're using a primitive type the value SHOULD NOT BE CHANGED, since Hashcode uses == value
  void setErrorForObject(Object? object, bool value) {
    _errorStates[object.hashCode] = value;
    notifyListeners();
  }

  /// Sets the error for the ViewModel
  void setError(bool error) {
    setErrorForObject(this, error);
  }

  // bool _isBusy = false;
  // bool get isBusy => _isBusy;

  // bool _hasError = false;
  // bool get hasError => _hasError;

  // void setBusy(bool value) {
  //   _isBusy = value;
  //   notifyListeners();
  // }

  // void setError(bool value) {
  //   _hasError = value;
  //   notifyListeners();
  // }

  reBuildUI() {
    notifyListeners();
  }

  reset() {}

  Future<ApiResponse> performApiCall({
    required String url,
    required Future<ApiResponse> Function({dynamic body, required String url})
        method,
    Map<String, dynamic>? body,
    required ApiResponse Function(Map<String, dynamic> data) onSuccess,
    ApiResponse Function(String errorMessage)? onError,
    String? busyObjectName,
  }) async {
    try {
      setBusyForObject(busyObjectName ?? this, true);
      // setBusy(true);

      apiResponse = await method(
        url: url,
        body: body,
      ); // Assuming canRetry is always true for simplicity

      if (!apiResponse.success) {
        // setBusy(false);
        setBusyForObject(busyObjectName ?? this, false);
        printty(apiResponse.message, logLevel: url.toString());
        return apiResponse;
      }

      printty(apiResponse.data, logLevel: url.toString());
      return onSuccess(apiResponse.data);
    } catch (e, s) {
      printty(e, logLevel: url.toString());
      printty(s.toString());
      setError(true);
      if (onError != null) {
        return onError(e.toString());
      } else {
        // Default error handling
        return ApiResponse(success: false, message: e.toString());
      }
    } finally {
      // setBusy(false);
      setBusyForObject(busyObjectName ?? this, false);
    }
  }
}
