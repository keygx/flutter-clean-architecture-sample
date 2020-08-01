import 'dart:core';

import 'package:flutter_clean_architecture/domain/errors/error_action_type.dart';

enum ApiErrorType {
  http_status_400,
  http_status_401,
  http_status_403,
  http_status_404,
  http_status_500,
  http_status_502,
  http_status_503,
  http_status_504,
  connect_timeout,
  send_timeout,
  receive_timeout,
  cancel,
  other
}

class ApiError implements Exception {
  final ApiErrorType failure;
  final String message;
  final ErrorActionType action;

  ApiError(this.failure, this.message, this.action);
}
