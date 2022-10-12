import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/screens/details_page.dart';
import 'package:galaxy_planet_app/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "details_page": (context) => const DetailsPage(),
      },
    ),
  );
}
