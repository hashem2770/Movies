import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_getx/Controllers/DetailsController.dart';

class Detail extends StatelessWidget {
  final argumentData = Get.arguments;
  final DetailController detailsController =
  Get.put(DetailController(),permanent: true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Image(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://image.tmdb.org/t/p/w500' + argumentData[5]),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Image(
                            fit: BoxFit.fill,
                            width: 50.0,
                            height: 200.0,
                            image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500' +
                                    argumentData[5]),
                          ),
                        ),
                        SizedBox(width: 12.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 30.0,
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                argumentData[0],
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              padding: EdgeInsets.only(bottom: 14.0),
                              width: MediaQuery.of(context).size.width / 1.56,
                              child: Text(
                                argumentData[3],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18.0, letterSpacing: 1.01),
                              ),
                            ),
                            Text(
                              '${argumentData[4]}  (Released)',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Divider(
                      thickness: 4.0,
                      color: Colors.black54,
                    ),
                    SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.comment),
                              radius: 25.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('${argumentData[1]} Vote')
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.accessibility_new),
                              radius: 25.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('${argumentData[2].round()} Popularity')
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                        Column(
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.language),
                              radius: 25.0,
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text(argumentData[6].toUpperCase())
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.0),
                    Divider(
                      thickness: 4.0,
                      color: Colors.black54,
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      argumentData[3],
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0.0,
            top: 25.0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.grey[900],
                size: 33.0,
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          GetBuilder<DetailController>(
            builder:(controller)=> Positioned(
              right: 0.0,
              top: 25.0,
              child: IconButton(
                icon: Icon(
                  controller.love
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: controller.love
                      ? Colors.red
                      : Colors.grey[800],
                  size: 35.0,
                ),
                onPressed: () {
                 controller.loveDetector();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
