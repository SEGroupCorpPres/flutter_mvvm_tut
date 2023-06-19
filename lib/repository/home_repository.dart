import 'package:flutter_mvvm_tut/data/network/base_api_services.dart';
import 'package:flutter_mvvm_tut/data/network/network_api_services.dart';
import 'package:flutter_mvvm_tut/model/movies_model.dart';
import 'package:flutter_mvvm_tut/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _baseApiServices = NetworkApiServices();

  Future<MovieListModel> fetchMovieList() async {
    try {
      dynamic response = await _baseApiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
