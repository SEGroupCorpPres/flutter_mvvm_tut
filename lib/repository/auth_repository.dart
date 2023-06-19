import 'package:flutter_mvvm_tut/data/network/base_api_services.dart';
import 'package:flutter_mvvm_tut/data/network/network_api_services.dart';
import 'package:flutter_mvvm_tut/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _baseApiServices.getPostApiResponse(AppUrl.signUpApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
