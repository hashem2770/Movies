import 'package:get/get.dart';
import 'package:movie_getx/Models/fetch_model.dart';
import 'package:movie_getx/Servies/ApiHelper.dart';

class PlayingNowController extends GetxController {
  ApiHelper apiHelper = ApiHelper();
  late Future<Movies> playingNowMovies;

  @override
  void onInit() {
    playingNowMovies=apiHelper.fetchNowPlayingMovies();
    super.onInit();
  }
}
