import 'package:dio/dio.dart';

abstract class ApiProvider<Params> {
  Dio dio;
  String path;
  Map<String, dynamic> buildParams(Params params);
  void setDioOptions();
}
