import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_tut/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel userModel) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', userModel.token.toString());
    notifyListeners();
    print('save');
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');
    return UserModel(
      token: token.toString(),
    );
  }

  Future<bool> remove() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    return true;
  }
}
