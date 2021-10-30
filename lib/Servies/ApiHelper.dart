import 'dart:convert';

import 'package:movie_getx/Models/fetch_model.dart';
import 'package:http/http.dart'as http;
import 'api_uititles.dart';
class ApiHelper{

  Future<Movies> fetchPopularMovies() async{
    var response = await http.get(Uri.parse(apiPopularUrl));
    if(response.statusCode == 200){
      return Movies.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to contact api');
    }
  }
  Future<Movies> fetchNowPlayingMovies() async{
    var response = await http.get(Uri.parse(apiNowPlayingUrl));
    if(response.statusCode == 200){
      return Movies.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to contact api');
    }
  }
  Future<Movies> fetchTopRatedMovies() async{
    var response = await http.get(Uri.parse(apiTopRatedtUrl));
    if(response.statusCode == 200){
      return Movies.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to contact api');
    }
  }
}