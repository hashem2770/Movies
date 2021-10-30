import 'package:get/get.dart';
import 'package:movie_getx/Models/fetch_model.dart';
import 'package:movie_getx/Servies/ApiHelper.dart';

class TopRatedController extends GetxController {
  ApiHelper apiHelper = ApiHelper();
  late Future<Movies> topRatedMovies;

  @override
  void onInit() {
    topRatedMovies=apiHelper.fetchTopRatedMovies();
    super.onInit();
  }
}
