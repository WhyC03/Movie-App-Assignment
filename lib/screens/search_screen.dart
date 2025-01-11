import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/screens/details_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchResults = [];
  TextEditingController searchController = TextEditingController();
  Future<void> searchMovies(String query) async {
    final response = await http
        .get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if (response.statusCode == 200) {
      setState(() {
        searchResults = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search Movies",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search Here...',
                  //   suffixIcon: IconButton(
                  //     icon: Icon(Icons.search),
                  //     onPressed: () => searchMovies(searchController.text),
                  //   ),
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      searchResults.clear();
                    });
                    return;
                  }
                  searchMovies(value);
                },
              ),
            ),
            Expanded(
              child: searchResults.isEmpty
                  ? Center(
                      child: Text("No Results"),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final movie = searchResults[index]['show'];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 25.0),
                          child: InkWell(
                            onTap: () {
                              log('Navigating with data: $movie');
                              Navigator.pushNamed(
                                  context, DetailsScreen.routeName,
                                  arguments: movie);
                            },
                            child: Container(
                              padding: EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300)),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Image.network(
                                    movie['image']?['medium'] ??
                                        'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                                    width: 50,
                                  ),
                                ),
                                title: Text(movie['name'] ?? ''),
                                trailing:
                                    Icon(Icons.keyboard_arrow_right_outlined),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
