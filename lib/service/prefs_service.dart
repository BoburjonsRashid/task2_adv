import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class PrefService {



  static storeEmail( emailController) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("emailController", emailController);
  }

  static Future<String?> loadEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("emailController");
  }

  static Future<bool> removeEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("email");
  }}
  class PrefServicep {
  static storePassword( passwordController) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("passwordController", passwordController);
  }

  static Future<String?> loadPassword() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("passwordController");
  }

  static Future<bool> removePassword() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.remove("passwordController");
  }





  static storeUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringUser = jsonEncode(user);
    await prefs.setString('user', stringUser);
  }

  static Future<User?> loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringUser = prefs.getString("user");
    if (stringUser == null || stringUser.isEmpty) return null;
    Map<String, dynamic> map = jsonDecode(stringUser);
    return User.fromJson(map);
  }
  static Future<bool> removeUser () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove("user");
  }
}