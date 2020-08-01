import 'package:flutter_clean_architecture/config/constants/endpoint.dart';
import 'package:flutter_clean_architecture/domain/errors/api_error.dart';
import 'package:flutter_clean_architecture/domain/errors/error_action_type.dart';
import 'package:dio/dio.dart';

import 'api_response.dart';

class ApiClient {
  Dio _dio;

  ApiClient() {
    BaseOptions options = BaseOptions(
      baseUrl: Endpoints.prod,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = Dio(options);
  }

  Dio getInstance() {
    return _dio;
  }

  static ApiResponse checkSuccess(Response<Map<String, dynamic>> response) {
    if (200 <= response.statusCode && response.statusCode < 300) {
      return ApiResponse.withSuccess(response);
    } else {
      return ApiResponse.withError(
        ApiError(ApiErrorType.other, "", ErrorActionType.show_alert),
      );
    }
  }

  static ApiResponse checkError(DioError error) {
    switch (error.type) {
      case DioErrorType.CONNECT_TIMEOUT:
        return ApiResponse.withError(
          ApiError(
              ApiErrorType.connect_timeout, "", ErrorActionType.show_alert),
        );
        break;
      case DioErrorType.SEND_TIMEOUT:
        return ApiResponse.withError(
          ApiError(ApiErrorType.send_timeout, "", ErrorActionType.show_alert),
        );
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        return ApiResponse.withError(
          ApiError(
              ApiErrorType.receive_timeout, "", ErrorActionType.show_alert),
        );
        break;
      case DioErrorType.RESPONSE:
        switch (error.response.statusCode) {
          case 400:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_400, "", ErrorActionType.show_alert),
            );
            break;
          case 401:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_401, "", ErrorActionType.show_alert),
            );
            break;
          case 403:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_403, "", ErrorActionType.show_alert),
            );
            break;
          case 404:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_404, "", ErrorActionType.show_alert),
            );
            break;
          case 500:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_500, "", ErrorActionType.show_alert),
            );
            break;
          case 502:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_502, "", ErrorActionType.show_alert),
            );
            break;
          case 503:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_503, "", ErrorActionType.show_alert),
            );
            break;
          case 504:
            return ApiResponse.withError(
              ApiError(
                  ApiErrorType.http_status_504, "", ErrorActionType.show_alert),
            );
            break;
          default:
            return ApiResponse.withError(
              ApiError(ApiErrorType.other, "", ErrorActionType.show_alert),
            );
        }
        break;
      case DioErrorType.CANCEL:
        return ApiResponse.withError(
          ApiError(ApiErrorType.cancel, "", ErrorActionType.show_alert),
        );
        break;
      case DioErrorType.DEFAULT:
        return ApiResponse.withError(
          ApiError(ApiErrorType.other, "", ErrorActionType.show_alert),
        );
        break;
      default:
        return ApiResponse.withError(
          ApiError(ApiErrorType.other, "", ErrorActionType.show_alert),
        );
        break;
    }
  }
}
