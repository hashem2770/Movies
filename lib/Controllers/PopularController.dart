import 'package:get/get.dart';
import 'package:movie_getx/Models/fetch_model.dart';
import 'package:movie_getx/Servies/ApiHelper.dart';

class PopularController extends GetxController {
  ApiHelper apiHelper = ApiHelper();
  late Future<Movies> popularMovies;

  @override
  void onInit() {
    popularMovies=apiHelper.fetchPopularMovies();
    super.onInit();
  }
}
