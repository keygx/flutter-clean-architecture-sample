import 'package:flutter_clean_architecture/data/sources/base_response.dart';
import 'package:flutter_clean_architecture/domain/errors/api_error.dart';
import 'package:dio/dio.dart';

class ApiResponse implements BaseResponse<ApiError> {
  @override
  Response<Map<String, dynamic>> response;
  @override
  ApiError error;

  ApiResponse.withSuccess(Response<Map<String, dynamic>> response)
      : this.response = response,
        this.error = null;

  ApiResponse.withError(ApiError failure)
      : this.response = null,
        this.error = failure;
}
