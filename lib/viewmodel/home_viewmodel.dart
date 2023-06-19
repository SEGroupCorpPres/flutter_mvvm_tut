import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm_tut/data/response/api_response.dart';
import 'package:flutter_mvvm_tut/model/movies_model.dart';
import 'package:flutter_mvvm_tut/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _movieRepository = HomeRepository();
  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    setMovieList(ApiResponse.loading());
    _movieRepository.fetchMovieList().then((value) {
      setMovieList(ApiResponse.completed(value));
    }).onError(
      (error, stackTrace) {
        setMovieList(ApiResponse.error(error.toString()));
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}
