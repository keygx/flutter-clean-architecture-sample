import 'package:flutter_clean_architecture/data/sources/network/api_response.dart';

abstract class SampleRepository<Params> {
  Future<ApiResponse> post(Params params);
}
