import 'package:flutter/material.dart';
import 'package:movie_getx/Controllers/PopularController.dart';
import 'package:movie_getx/Controllers/nav-controller.dart';
import 'package:movie_getx/Models/fetch_model.dart';
import 'package:get/get.dart';
import 'package:movie_getx/Views/Details/DetailsScreen.dart';

class Popular extends StatelessWidget {
  final PopularController popularController = Get.put(PopularController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('Popular')),
      body: GetBuilder<PopularController>(
        builder: (controller) => FutureBuilder<Movies>(
          future: controller.popularMovies,
          builder: (context, AsyncSnapshot<Movies> snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                itemCount: snapshot.data!.results!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.5,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => Detail(), arguments: [
                          snapshot.data!.results![index].title,
                          snapshot.data!.results![index].voteCount,
                          snapshot.data!.results![index].popularity,
                          snapshot.data!.results![index].overview,
                          snapshot.data!.results![index].releaseDate,
                          snapshot.data!.results![index].posterPath,
                          snapshot.data!.results![index].originalLanguage
                        ]);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 4.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${snapshot.data!.results![index].posterPath}',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                  left: 12.0, top: 12.0, bottom: 12.0),
                              child: Text(
                                snapshot.data!.results![index].title.toString(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Container(
                child: Center(
                  child: Text(snapshot.error.toString()),
                ),
              );
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }


}
