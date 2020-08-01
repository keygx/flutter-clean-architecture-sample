import 'dart:core';

class SampleUseCaseParams {
  final String username;
  final String password;

  SampleUseCaseParams(this.username, this.password);

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "password": password,
    };
  }
}

class SampleUseCaseResponse {
  final String username;

  SampleUseCaseResponse(this.username);
}
