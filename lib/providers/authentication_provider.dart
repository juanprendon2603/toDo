import 'package:flutter/material.dart';

class AuthenticationProvider with ChangeNotifier {
  final TextEditingController _emailControllerL = TextEditingController();
  TextEditingController get emailControllerL => _emailControllerL;

  final TextEditingController _passwordControllerL = TextEditingController();
  TextEditingController get passwordControllerL => _passwordControllerL;

  final TextEditingController _emailControllerS = TextEditingController();
  TextEditingController get emailControllerS => _emailControllerS;

  final TextEditingController _passwordControllerS = TextEditingController();
  TextEditingController get passwordControllerS => _passwordControllerS;
}
