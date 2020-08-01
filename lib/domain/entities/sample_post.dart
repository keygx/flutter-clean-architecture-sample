import 'dart:core';

class SamplePost {
  final String username;
  final String password;

  SamplePost({
    this.username,
    this.password,
  });

  factory SamplePost.fromJson(Map<String, dynamic> json) {
    return SamplePost(
      username: json["form"]["username"],
      password: json["form"]["password"],
    );
  }
}
