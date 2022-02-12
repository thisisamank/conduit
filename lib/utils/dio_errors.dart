import 'package:conduit/constants/app_strings.dart';
import 'package:dio/dio.dart';

class DioErrorUtil {
  DioErrorUtil._();
  static String handleError(DioError error) {
    String errorDescription = "";

    switch (error.type) {
      case DioErrorType.cancel:
        errorDescription = AppStrings.serverRequestCancelled;
        break;
      case DioErrorType.connectTimeout:
        errorDescription = AppStrings.connectionTimeout;
        break;
      case DioErrorType.other:
        errorDescription = AppStrings.connectionFailedInternetUnavailable;
        break;
      case DioErrorType.receiveTimeout:
        errorDescription = AppStrings.requestTimeout;
        break;
      case DioErrorType.response:
        errorDescription =
            "${AppStrings.invalidStatusCode} ${error.response?.statusCode}";
        break;
      case DioErrorType.sendTimeout:
        errorDescription = AppStrings.sendTimeout;
        break;
    }

    return errorDescription;
  }
}
