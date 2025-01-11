import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movie_app/common.dart';
import 'package:movie_app/screens/details_screen.dart';

class PictureList extends StatefulWidget {
  const PictureList({super.key});

  @override
  State<PictureList> createState() => _PictureListState();
}

class _PictureListState extends State<PictureList> {
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
    return SizedBox(
      height: size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index]['show'];
          final imageUrl = movie['image']?['medium'];
          return imageUrl != null
              ? InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: movie);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, DetailsScreen.routeName,
                        arguments: movie);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey.shade200,
                      // height: size.height * 0.7,
                      width: 180,
                      child: Center(
                        child: Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
                        ),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
