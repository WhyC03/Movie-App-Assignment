import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> fetchMovies() async {
  final response =
      await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load movies');
  }
}