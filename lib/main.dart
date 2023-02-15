import 'package:flutter/material.dart';
import 'package:quran/screens/home.dart';
import 'package:quran/screens/lunch_screen.dart';
import 'package:quran/screens/quran_page.dart';
void main()  {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LunchScreen.id,
      routes: {
        LunchScreen.id: (context) => const LunchScreen(),
        HomePage.id: (context) => const HomePage(),
        QuranPage.id: (context) => const QuranPage(),
      },
    );
  }
}
