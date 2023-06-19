import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_tut/model/user_model.dart';
import 'package:flutter_mvvm_tut/repository/auth_repository.dart';
import 'package:flutter_mvvm_tut/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_tut/utils/utils.dart';
import 'package:flutter_mvvm_tut/viewmodel/user_viewmodel.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepository = AuthRepository();
  bool _loginLoading = false;

  bool _signUpLoading = false;

  bool get loginLoading => _loginLoading;

  bool get signUpLoading => _signUpLoading;

  setLoginLoading(bool value) {
    _loginLoading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic data) async {
    setLoginLoading(true);
    _authRepository.loginApi(data).then((value) {
      setLoginLoading(false);
      final userPreferences = Provider.of<UserViewModel>(context, listen: false);
      userPreferences.saveUser(
        UserModel(
          token: value['token'].toString(),
        ),
      );
      Utils.flushBarErrorMessage(context, 'Login Successfully');
      Navigator.pushReplacementNamed(context, RoutesName.home);
      // if (kDebugMode) {
      //   print(value.toString());
      // }
    }).onError((error, stackTrace) {
      setLoginLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(context, error.toString());
        print(error.toString());
      }
    });
  }

  Future<void> signUpApi(BuildContext context, dynamic data) async {
    setSignUpLoading(true);
    _authRepository.signUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(context, 'Sign Up Successfully');
      Navigator.popAndPushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        Utils.flushBarErrorMessage(context, error.toString());
        print(error.toString());
      }
    });
  }
}
