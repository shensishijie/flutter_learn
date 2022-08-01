
import 'package:get/get.dart';
import 'package:untitled/api_service.dart';
import 'package:untitled/movie/movie_model.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var movieList = <MovieModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovie();
  }

  void fetchMovie() async {
    try {
      isLoading(true);
      var movie = await ApiService.fetchMovie();
      if (movie != null) {
        movieList.assignAll(movie);
      }
    } finally {
      isLoading(false);
    }
  }
}