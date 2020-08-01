import 'dart:developer';

import 'package:flutter_clean_architecture/data/sources/network/api_client.dart';
import 'package:flutter_clean_architecture/data/sources/network/api_provider.dart';
import 'package:flutter_clean_architecture/data/sources/network/api_response.dart';
import 'package:flutter_clean_architecture/domain/errors/api_error.dart';
import 'package:flutter_clean_architecture/domain/errors/error_action_type.dart';
import 'package:flutter_clean_architecture/domain/models/sample_model.dart';
import 'package:flutter_clean_architecture/domain/repositories/sample_repository.dart';

import 'package:dio/dio.dart';

class SampleRepositoryImpl
    implements
        SampleRepository<SampleUseCaseParams>,
        ApiProvider<SampleUseCaseParams> {
  @override
  Dio dio = ApiClient().getInstance();

  @override
  String path = "post";

  @override
  Map<String, dynamic> buildParams(SampleUseCaseParams params) {
    Map<String, dynamic> p = params.toMap();
    p["username"] = params.username;
    p["password"] = params.password;
    return p;
  }

  @override
  Future<ApiResponse> post(SampleUseCaseParams params) async {
    setDioOptions();
    ApiResponse apiResponse;
    try {
      Response<Map<String, dynamic>> response =
          await dio.post(path, data: FormData.fromMap(buildParams(params)));
      log(response.request.uri.toString());
      apiResponse = ApiClient.checkSuccess(response);
    } on DioError catch (error) {
      apiResponse = ApiClient.checkError(error);
    } catch (_) {
      apiResponse = ApiResponse.withError(
        ApiError(ApiErrorType.other, "", ErrorActionType.show_alert),
      );
    }
    return apiResponse;
  }

  @override
  void setDioOptions() {
    dio.options.headers['content-Type'] =
        'application/x-www-form-urlencoded;charset=utf-8';
  }
}
