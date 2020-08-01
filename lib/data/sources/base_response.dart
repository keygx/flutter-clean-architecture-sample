import 'package:dio/dio.dart';

abstract class BaseResponse<E> {
  Response<Map<String, dynamic>> response;
  E error;
}
