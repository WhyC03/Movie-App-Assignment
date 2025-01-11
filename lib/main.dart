import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/router.dart';
import 'package:movie_app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 5,),
        textTheme: GoogleFonts.robotoTextTheme(),
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: SplashScreen(),
    );
  }
}
