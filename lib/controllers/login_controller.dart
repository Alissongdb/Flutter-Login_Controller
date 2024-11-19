import 'package:flutter/material.dart';

class LoginController {
  String? _login;

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  setLogin(String value) => _login = value;

  String? _senha;
  setPass(String value) => _senha = value;

  Future<bool> auth() async {
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;
    return _login == 'admin' && _senha == '123';
  }
}
