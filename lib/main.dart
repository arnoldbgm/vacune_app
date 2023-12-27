import 'package:flutter/material.dart';
import 'package:flutter_vacuna/pages/intro_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Vaccine Storage App",
      theme: ThemeData(
        // Forma en como colocar la fuetne por defecto
        textTheme: GoogleFonts.manropeTextTheme(),
      ),
      home: IntroPage(),
    );
  }
}
