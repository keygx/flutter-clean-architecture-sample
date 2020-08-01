import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/domain/models/sample_model.dart';
import 'package:flutter_clean_architecture/presentaion/pages/home/home_presenter.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final presenter = HomePresenter();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _send(BuildContext context) async {
    SampleUseCaseResponse response =
        await presenter.post(_userController.text, _passwordController.text);
    log(response.username);
    showAlert(context, response.username);
  }

  void showAlert(BuildContext context, String username) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("ログイン完了"),
        content: Text("ユーザー：" + username),
        // ボタンの配置
        actions: <Widget>[
          FlatButton(
              child: const Text('OK'),
              onPressed: () {
                _userController.text = "";
                _passwordController.text = "";
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _userController,
                decoration: InputDecoration(
                  labelText: 'User Name',
                ),
                validator: (value) {
                  if (value.length < 3) {
                    return 'ユーザーネームを入力してください';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value.length < 6) {
                    return 'パスワードを入力してください';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 16,
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Login'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    FocusScope.of(context).unfocus();
                    _send(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
