import 'package:dio/dio.dart';

String handleError(error) {
  String errorDescription = "";
  if (error is DioError) {
    DioError dioError = error;
    switch (dioError.type) {
      case DioErrorType.CANCEL:
        errorDescription = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        errorDescription = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        errorDescription =
            "Failed to connect to the server. Please check your internet connection and try again.";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        errorDescription = "Receive timeout in connection with API server";
        break;
      case DioErrorType.RESPONSE:
        if (dioError.response.statusCode == 403) {
          errorDescription = "Unauthorized Request.";
        } else if (dioError.response.statusCode == 400) {
          errorDescription =
              "Bad request. Please check parameters and try again.";
        } else {
          errorDescription =
              "Received invalid status code: ${dioError.response.statusCode}";
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        errorDescription = "Send timeout in connection with Server.";
        break;
    }
  } else {
    errorDescription = "Unexpected error occured!";
  }
  return errorDescription;
}
