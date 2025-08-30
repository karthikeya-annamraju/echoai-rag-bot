import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rag_chatbot/theme/app_colors.dart';
import 'package:rag_chatbot/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.submitButton),
        textTheme: GoogleFonts.interTextTheme(
          ThemeData.dark().textTheme
        )
      ),
      home: HomeScreen(),
    );
  }
}
