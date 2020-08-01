import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentaion/widgets/login_form.dart';

class HomeTabletPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: LoginForm(),
      ),
    );
  }
}

class HomeTabletLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: SafeArea(
        child: LoginForm(),
      ),
    );
  }
}
