import 'package:flutter/material.dart';
import 'package:movie_app/screens/details_screen.dart';
import 'package:movie_app/screens/home_screen.dart';
import 'package:movie_app/screens/main_screen.dart';
import 'package:movie_app/screens/search_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (context) => HomeScreen());
    case ActualScreen.routeName:
      return MaterialPageRoute(builder: (context) => ActualScreen());
    case SearchScreen.routeName:
      return MaterialPageRoute(builder: (context) => SearchScreen());
    case DetailsScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => DetailsScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('Route not found'),
          ),
        ),
      );
  }
}
