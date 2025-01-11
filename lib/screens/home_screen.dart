import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/common.dart';
import 'package:movie_app/screens/details_screen.dart';
import 'package:movie_app/screens/search_screen.dart';
import 'package:movie_app/widgets/picture_list.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List movies = [];

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  Future<void> loadMovies() async {
    try {
      final fetchedMovies = await fetchMovies();
      setState(() {
        movies = fetchedMovies;
      });
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Image.asset(
          'assets/tvm-header-logo.png',
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SearchScreen.routeName,
              );
            },
            icon: Icon(Icons.search_rounded),
          )
        ],
      ),
      body: movies.isEmpty
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider.builder(
                    options: CarouselOptions(
                        height: size.height * 0.9,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 8),
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1),
                    itemCount: movies.length,
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final movie = movies[index]['show'];
                      final imageUrl = movie['image']?['original'];
                      final movieGenres = movie['genres'].join(", ");
                      return imageUrl != null
                          ? SizedBox(
                              width: size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.7,
                                      child: Image.network(
                                        imageUrl,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      movie['name'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      movieGenres,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Icon(Icons.add_outlined),
                                            SizedBox(height: 5),
                                            Text("My List"),
                                          ],
                                        ),
                                        SizedBox(width: 40),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                DetailsScreen.routeName,
                                                arguments: movie);
                                          },
                                          child: Container(
                                            width: 150,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1.5)),
                                            child: Row(
                                              // mainAxisAlignment:
                                              //     MainAxisAlignment.center,
                                              children: [
                                                SizedBox(width: 20),
                                                Icon(
                                                  Icons.play_arrow_rounded,
                                                  size: 30,
                                                ),
                                                SizedBox(width: 10),
                                                Text(
                                                  "Play",
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 50),
                                        Column(
                                          children: [
                                            Icon(Icons.info_outline),
                                            SizedBox(height: 5),
                                            Text("Info"),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          : SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    // color: Colors.grey.shade200,
                                    height: size.height * 0.626,
                                    child: Center(
                                      child: Image.network(
                                        "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Text(
                                    movie['name'],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Text(
                                    movieGenres,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.add_outlined),
                                          SizedBox(height: 5),
                                          Text("My List"),
                                        ],
                                      ),
                                      SizedBox(width: 40),
                                      Container(
                                        width: 150,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1.5)),
                                        child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          children: [
                                            SizedBox(width: 20),
                                            Icon(
                                              Icons.play_arrow_rounded,
                                              size: 30,
                                            ),
                                            SizedBox(width: 15),
                                            Text(
                                              "Play",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 50),
                                      Column(
                                        children: [
                                          Icon(Icons.info_outline),
                                          SizedBox(height: 5),
                                          Text("Info"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Releases in the Past Year',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  movies.isEmpty
                      ? CircularProgressIndicator(color: Colors.black)
                      : PictureList(),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Continue Watching ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  movies.isEmpty
                      ? CircularProgressIndicator(color: Colors.black)
                      : PictureList(),
                ],
              ),
            ),
    );
  }
}
