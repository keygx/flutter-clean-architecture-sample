import 'package:flutter_clean_architecture/config/constants/endpoint.dart';
import 'package:flutter/foundation.dart';

class Env {
  static EnvData _env;
  static EnvData get data => _env;
  static final bool isRelease = kReleaseMode;
  static final bool isDebug = !kReleaseMode; //true;

  static void init() {
    _env = isRelease ? Env.prod : Env.dev;
  }

  static final EnvData dev = EnvData(
    debug: true,
    debugShowCheckedModeBanner: true,
    debugShowMaterialGrid: true,
    debugApiClient: true,
    apiBaseUrl: Endpoints.stg,
  );

  static final EnvData prod = EnvData(
    debug: false,
    debugShowCheckedModeBanner: false,
    debugShowMaterialGrid: false,
    debugApiClient: false,
    apiBaseUrl: Endpoints.prod,
  );
}

class EnvData {
  final bool debug;
  final bool debugShowCheckedModeBanner;
  final bool debugShowMaterialGrid;
  final bool debugApiClient;
  final String apiBaseUrl;

  EnvData({
    @required this.debug,
    @required this.debugShowCheckedModeBanner,
    @required this.debugShowMaterialGrid,
    @required this.debugApiClient,
    @required this.apiBaseUrl,
  });
}
